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

@import <AppKit/CPViewController.j>
@import <AppKit/CPScrollView.j>
@import <Foundation/CPUserDefaults.j>

@import "../Models/Account.j"
@import "ContactViewController.j"
@import "ChatWindowController.j"
@import "AddContactController.j"

var SharedController = nil;

RosterViewDragType = @"RosterViewDragType";

@implementation AccountsController : CPViewController
{
            CPArray         accounts    @accessors;
            CPDictionary    chatWindows;
    @outlet CPScrollView    scrollView  @accessors;
    @outlet CPOutlineView   rosterView  @accessors;
            CPArray         draggedItems;
}

+ (AccountsController)sharedController
{
    if (!SharedController)
        SharedController = [[AccountsController alloc] init];

    return SharedController;
}

- (id)init
{
    if (self = [super init])
    {
        accounts    = [CPArray array];
        chatWindows = [CPDictionary dictionary];
        [self listenForReloadNotifications];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(expandAccount:)
                   name:TNStropheRosterRetrievedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(storeAccounts)
                  name:AccountWasAddedNotification
                object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(storeAccounts)
                  name:AccountWasEditedNotification
                object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(storeAccounts)
                   name:AccountWasDeletedNotification
                 object:nil];
        [self setupStoredAccounts];
    }
    return self;
}

- (void)listenForReloadNotifications
{
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheRosterRetrievedNotification
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheConnectionStatusDisconnected
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheConnectionStatusConnectionFailure
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheConnectionStatusError
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheContactNicknameUpdatedNotification
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheContactGroupUpdatedNotification
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
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheContactMessageTreatedNotification
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheRosterAddedContactNotification
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheRosterRemovedContactNotification
             object:nil];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(reload)
               name:TNStropheRosterRemovedGroupNotification
             object:nil];
}

- (void)setupStoredAccounts
{
    var storedAccounts = [[CPUserDefaults standardUserDefaults] objectForKey:@"accounts"];
    for (var i = 0; i < [storedAccounts count]; i++)
    {
        var account = [storedAccounts objectAtIndex:i];
        [self addAccountWithJID:[account valueForKey:@"jid"] andPassword:[account valueForKey:@"password"] enabled:[account valueForKey:@"enabled"]];
    }
}

- (CPArray)accountCredentials
{
    var credentials = [CPArray array];
    for (var i = 0; i < [accounts count]; i++)
    {
        var account = [accounts objectAtIndex:i],
            creds   = [CPDictionary dictionaryWithObjectsAndKeys:[account JID], @"jid",
                                                                 [account password], @"password",
                                                                 [account isEnabled], @"enabled"];
        [credentials addObject:creds];
    }
    return credentials;
}

- (void)storeAccounts
{
    [[CPUserDefaults standardUserDefaults] setObject:[self accountCredentials] forKey:@"accounts"];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    SharedController = self;
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

    [rosterView registerForDraggedTypes:[RosterViewDragType]];

    [rosterView setDoubleAction:@selector(rosterDidReceiveDoubleClick:)];
    [rosterView setDataSource:self];

    [rosterView setAllowsMultipleSelection:NO];
    [rosterView setAllowsEmptySelection:YES];

    [rosterView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

    [rosterView setAllowsColumnResizing:YES];
    [rosterView setColumnAutoresizingStyle:CPTableViewUniformColumnAutoresizingStyle];

    [scrollView setDocumentView:rosterView];
}

- (id)selectedItem
{
    return [rosterView itemAtRow:[rosterView selectedRow]];
}


#pragma mark -
#pragma mark Connections

- (@action)connectAllAccounts:(id)aSender
{
    for (var i = 0; i < [accounts count]; i++)
        [[accounts objectAtIndex:i] connect];
}

- (@action)disconnectAllAccounts:(id)aSender
{
    for (var i = 0; i < [accounts count]; i++)
        [[accounts objectAtIndex:i] disconnect];
}

- (@action)connectSelectedAccount:(id)aSender
{
    var account = [self selectedItem];
    if (![account isKindOfClass:[Account class]])
        return;

    [account connect];
}

- (@action)disconnectSelectedAccount:(id)aSender
{
    var account = [self selectedItem];
    if (![account isKindOfClass:[Account class]])
        return;

    [account disconnect];
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
    [self addAccount:[Account accountWithJID:aJID andPassword:aPassword enabled:isEnabled]];
}

- (void)addAccount:(Account)anAccount
{
    [accounts addObject:anAccount];
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasAddedNotification object:self];
    if ([anAccount isEnabled])
        [anAccount connect];
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
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasDeletedNotification object:self];
    [self reload];
}

- (void)reload
{
    CPLog.debug("Reloading roster view!");
    [rosterView reloadData];
}

- (void)expandAccount:(CPNotification)aNotification
{
    [rosterView expandItem:[[aNotification object] connection] expandChildren:YES];
}


#pragma mark -
#pragma mark Contact Management

- (@action)promptForNewContact:(id)aSender
{
    CPLog.debug("Adding a contact");

    var selected = [self selectedItem],
        account;

    if ([selected isKindOfClass:[TNStropheContact class]])
        account = [rosterView parentForItem:[rosterView parentForItem:selected]];
    else if ([selected isKindOfClass:[TNStropheGroup class]])
        account = [rosterView parentForItem:selected];
    else if ([selected isKindOfClass:[Account class]])
        account = selected;
    else
        account = [accounts objectAtIndex:0];

    var controller = [[AddContactController alloc] initWithAccount:account];
    [controller showWindow:aSender];
}

- (@action)rosterMinusWasClicked:(id)aSender
{
    CPLog.debug("Removing something!");
    var selected = [self selectedItem];
    if ([selected isKindOfClass:[TNStropheContact class]])
        [[[rosterView parentForItem:[rosterView parentForItem:selected]] roster] removeContact:selected];
    else if ([selected isKindOfClass:[TNStropheGroup class]])
        [[[rosterView parentForItem:selected] roster] removeGroup:selected];
}


#pragma mark -
#pragma mark Outline View Data Source

- (int)outlineView:(CPOutlineView)anOutlineView numberOfChildrenOfItem:(id)anItem
{
    if (!anItem)
        return [accounts count];

    if ([anItem isKindOfClass:[Account class]])
        return [[anItem roster] populatedGroupsCount];

    if ([anItem isKindOfClass:[CPDictionary class]] || [anItem isKindOfClass:[CPArray class]] || [anItem isKindOfClass:[TNStropheGroup class]])
        return [anItem count];

    return 0;
}

- (id)outlineView:(CPOutlineView)anOutlineView child:(int)anIndex ofItem:(id)anItem
{
    if (!anItem)
        anItem = accounts;

    if ([anItem isKindOfClass:[CPArray class]])
        return [anItem objectAtIndex:anIndex];
    else if ([anItem isKindOfClass:[CPDictionary class]])
        return [anItem objectForKey:[[anItem allKeys] objectAtIndex:anIndex]];
    else if ([anItem isKindOfClass:[TNStropheGroup class]])
        return [[anItem contacts] objectAtIndex:anIndex];
    else if ([anItem isKindOfClass:[Account class]])
        return [[[anItem roster] populatedGroups] objectAtIndex:anIndex];

    return;
}

- (BOOL)outlineView:(CPOutlineView)anOutlineView isItemExpandable:(id)anItem
{
    if (([anItem isKindOfClass:[CPArray class]] || [anItem isKindOfClass:[CPDictionary class]]) && [anItem count] > 0)
        return YES;

    if (([anItem isKindOfClass:[Account class]]) && [[anItem roster] populatedGroupsCount] > 0)
        return YES;

    if (([anItem isKindOfClass:[TNStropheGroup class]]) && [anItem count] > 0)
        return YES;

    return NO;
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)aTableColumn byItem:(id)anItem
{
    if ([anItem isKindOfClass:[TNStropheContact class]] || [anItem isKindOfClass:[TNStropheGroup class]] || [anItem isKindOfClass:[Account class]])
        return anItem;

    var parentObject = [anOutlineView parentForItem:anItem] ? [anOutlineView parentForItem:anItem] : [self structure];
    if ([parentObject isKindOfClass:[CPDictionary class]])
        return [[parentObject allKeysForObject:anItem] objectAtIndex:0];

    else if ([parentObject isKindOfClass:[CPArray class]])
        return anItem;

    return;
}

#pragma mark -
#pragma mark Outline View Target

- (@action)rosterDidReceiveDoubleClick:(id)aSender
{
    if ([[self selectedItem] isKindOfClass:[TNStropheContact class]])
    {
        var contact = [self selectedItem],
            chatWindow;

        if ([chatWindows objectForKey:contact])
            chatWindow = [chatWindows objectForKey:contact];
        else
        {
            chatWindow = [[ChatWindowController alloc] initWithContact:contact];
            [chatWindows setObject:chatWindow forKey:contact];
        }

        [chatWindow showWindow:self];
    }
    else if ([[self selectedItem] isKindOfClass:[Account class]])
        [[[self selectedItem] setStatusController] showWindow:self];
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

- (BOOL)outlineView:(CPOutlineView)anOutlineView writeItems:(CPArray)theItems toPasteboard:(CPPasteBoard)thePasteBoard
{
    for (var i = 0; i < [theItems count]; i++)
    {
        if (![[theItems objectAtIndex:i] isKindOfClass:[TNStropheContact class]])
            return NO;
    }
    draggedItems = theItems;
    [thePasteBoard declareTypes:[RosterViewDragType] owner:self];
    [thePasteBoard setData:[CPKeyedArchiver archivedDataWithRootObject:theItems] forType:RosterViewDragType];

    return YES;
}

- (CPDragOperation)outlineView:(CPOutlineView)anOutlineView validateDrop:(id < CPDraggingInfo >)theInfo proposedItem:(id)theItem proposedChildIndex:(int)theIndex
{
    if (!theItem)
        [anOutlineView setDropItem:nil dropChildIndex:theIndex];

    if (![theItem isKindOfClass:[TNStropheGroup class]])
        return CPDragOperationNone;

    // Check we're not trying to move stuff between accounts
    var targetAccount   = [anOutlineView parentForItem:theItem],
        betweenAccounts = NO;

    for (var i = 0; i < [draggedItems count]; i++)
    {
        if (targetAccount != [anOutlineView parentForItem:[rosterView parentForItem:[draggedItems objectAtIndex:i]]])
            betweenAccounts = YES;
    }

    if (betweenAccounts)
        return CPDragOperationNone;

    [anOutlineView setDropItem:theItem dropChildIndex:theIndex];

    return CPDragOperationMove;
}

- (BOOL)outlineView:(CPOutlineView)outlineView acceptDrop:(id < CPDraggingInfo >)theInfo item:(id)theItem childIndex:(int)theIndex
{
    if (theItem === nil)
        theItem = accounts;

    var contactIndex = [draggedItems count];
    while (contactIndex--)
    {
        var contact = [draggedItems objectAtIndex:contactIndex];

        if (contact === theItem)
            continue;

        [[[outlineView parentForItem:[rosterView parentForItem:contact]] roster] changeGroup:theItem ofContact:contact];
        theIndex += 1;
    }

    return YES;
}

@end
