/*
 * AccountsController.j
 * CappuccinoTalk
 *
 * Copyright (C) 2010 Ben Langfeld <ben@langfeld.me>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

@import <AppKit/CPWindowController.j>

@import "../Models/Account.j"
@import "ContactViewController.j"

SharedAccountsController = nil;

AccountWasCreatedNotification   = @"AccountWasCreatedNotification";
AccountWasEditedNotification    = @"AccountWasEditedNotification";
AccountWasDeletedNotification   = @"AccountWasDeletedNotification";

@implementation AccountsController : CPViewController
{
            CPArray         accounts    @accessors;
    @outlet CPScrollView    scrollView  @accessors;
    @outlet CPOutlineView   rosterView  @accessors;
}

+ (AccountsController)sharedController
{
    if (!SharedAccountsController)
        SharedAccountsController = [[AccountsController alloc] init];

    return SharedAccountsController;
}

- (id)init
{
    if (self = [super init])
    {
        accounts = [CPArray array];
        for (var i = 0; i < localStorage.length; i++)
        {
            var JID     = localStorage.key(i),
                object  = localStorage.getObject(JID);
            [self addAccountWithJID:JID andPassword:object["password"] enabled:object["enabled"]];
        }
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(reload)
                   name:TNStropheRosterRetrievedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(reload)
                   name:TNStropheContactPresenceUpdatedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(reload)
                   name:TNStropheContactVCardReceivedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(reload)
                   name:TNStropheContactMessageReceivedNotification
                 object:nil];
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    SharedAccountsController = self;
    [super awakeFromCib];

    rosterView = [[CPOutlineView alloc] initWithFrame:[[scrollView contentView] bounds]];
    [rosterView setBackgroundColor:[CPColor colorWithHexString:@"e0ecfa"]];

    var textColumn = [[CPTableColumn alloc] initWithIdentifier:@"TextColumn"];
    [textColumn setWidth:200.0];
    [rosterView setRowHeight:45.0];

    [rosterView setCornerView:nil];
    [rosterView setHeaderView:nil];

    [rosterView addTableColumn:textColumn];
    [rosterView setOutlineTableColumn:textColumn];

    [rosterView setDelegate:self];
    [rosterView setTarget:self];

    [rosterView setDoubleAction:@selector(rosterDidReceiveDoubleClick:)];
    [rosterView setDataSource:self];

    [rosterView setAllowsMultipleSelection:NO];
    [rosterView setAllowsEmptySelection:YES];

    [rosterView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

    [rosterView setAllowsColumnResizing:YES];
    [rosterView setColumnAutoresizingStyle:CPTableViewUniformColumnAutoresizingStyle];

    [scrollView setDocumentView:rosterView];
}


#pragma mark -
#pragma mark Account Management

- (@action)manageAccounts:(id)aSender
{
    CPLog.debug("Managing accounts!");
    [[ManageAccountsController sharedController] showWindow:self];
}

- (Account)accountWithJID:(CPString)aJID
{
    for (var i = 0; i < [accounts count]; i++)
    {
        var account = [accounts objectAtIndex:i];
        if ([account JID] === aJID)
            return account;
    }
}

- (void)addAccountWithJID:(CPString)aJID andPassword:(CPString)aPassword
{
    [self addAccountWithJID:aJID andPassword:aPassword enabled:YES];
}

- (void)addAccountWithJID:(CPString)aJID andPassword:(CPString)aPassword enabled:(BOOL)isEnabled
{
    CPLog.debug("Adding account with JID " + aJID + " and password " + aPassword);
    var account = [Account accountWithJID:aJID andPassword:aPassword enabled:isEnabled];
    [accounts addObject:account];
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasCreatedNotification object:self];
    if (isEnabled)
        [account connect];
}

- (void)deleteAccountWithJID:(CPString)aJID
{
    [self deleteAccount:[self accountWithJID:aJID]];
    [self reload];
}

- (void)deleteAccount:(Account)anAccount
{
    [anAccount disconnect];
    [accounts removeObject:anAccount];
    localStorage.removeItem([anAccount JID]);
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasDeletedNotification object:self];
    [self reload];
}

- (void)reload
{
    CPLog.debug("Reloading roster view!");
    [rosterView reloadData];
}


#pragma mark -
#pragma mark Contact Management

- (@action)promptForNewContact:(id)aSender
{
    CPLog.debug("Adding a contact");
}

- (@action)removeContact:(id)aSender
{
    CPLog.debug("Removing a contact");
}


#pragma mark -
#pragma mark Outline View Data Source

- (CPDictionary)structure
{
    var structure = [CPDictionary dictionary];
    for (var i = 0; i < [accounts count]; i++)
    {
        var account     = [accounts objectAtIndex:i],
            JID         = [account JID],
            contacts    = [[account roster] contacts];

        [structure setObject:contacts forKey:JID];
    }
    return structure;
}

- (int)outlineView:(CPOutlineView)anOutlineView numberOfChildrenOfItem:(id)anItem
{
    if (!anItem)
        return [[self structure] count];

    if ([anItem isKindOfClass:[CPDictionary class]] || [anItem isKindOfClass:[CPArray class]])
        return [anItem count];

    return 0;
}

- (id)outlineView:(CPOutlineView)anOutlineView child:(int)anIndex ofItem:(id)anItem
{
    if (!anItem)
        anItem = [self structure];

    if ([anItem isKindOfClass:[CPArray class]])
        return [anItem objectAtIndex:anIndex];
    else if ([anItem isKindOfClass:[CPDictionary class]])
        return [anItem objectForKey:[[anItem allKeys] objectAtIndex:anIndex]];

    return;
}

- (BOOL)outlineView:(CPOutlineView)anOutlineView isItemExpandable:(id)anItem
{
    if (([anItem isKindOfClass:[CPArray class]] || [anItem isKindOfClass:[CPDictionary class]]) && [anItem count] > 0)
        return YES;

    return NO;
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)aTableColumn byItem:(id)anItem
{
    if ([anItem isKindOfClass:[TNStropheContact class]])
        return anItem;

    var parentObject = [anOutlineView parentForItem:anItem] ? [anOutlineView parentForItem:anItem] : [self structure];
    if ([parentObject isKindOfClass:[CPDictionary class]])
        return [[parentObject allKeysForObject:anItem] objectAtIndex:0];

    else if ([parentObject isKindOfClass:[CPArray class]])
        return anItem;

    return;
}


#pragma mark -
#pragma mark Outline View Delegate

- (CPView)outlineView:(CPOutlineView)anOutlineView dataViewForTableColumn:(CPTableColumn)aTableColumn item:(id)anItem
{
    if ([anItem isKindOfClass:[TNStropheContact class]])
        return [[[ContactViewController alloc] init] view];

    var textDataView = [CPTextField new];
    [textDataView setValue:[CPColor colorWithRed:51.0 / 255.0 green:51.0 / 255.0 blue:51.0 / 255.0 alpha:1.0] forThemeAttribute:"text-color"];
    [textDataView setValue:[CPColor whiteColor] forThemeAttribute:@"text-color" inState:CPThemeStateSelectedDataView];
    [textDataView setLineBreakMode:CPLineBreakByTruncatingTail];
    [textDataView setValue:[CPFont boldSystemFontOfSize:12.0] forThemeAttribute:@"font" inState:CPThemeStateSelectedDataView];
    [textDataView setValue:CPCenterVerticalTextAlignment forThemeAttribute:@"vertical-alignment"];
    [textDataView setValue:CGInsetMake(0.0, 0.0, 0.0, 5.0) forThemeAttribute:@"content-inset"];

    return textDataView;
}

@end
