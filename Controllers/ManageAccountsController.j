/*
 * ManageAccountsController.j
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
@import <AppKit/CPScrollView.j>

@import "AccountsController.j"
@import "NewAccountController.j"
@import "EditAccountController.j"
@import "../Models/Account.j"

var SharedController = nil;

@implementation ManageAccountsController : CPWindowController
{
    @outlet CPScrollView    scrollView;
            CPTableView     accountsTable;
    @outlet CPButton        editAccountButton;
    @outlet CPButton        deleteAccountButton;

            CPArray         accounts;
}

+ (ManageAccountsController)sharedController
{
    if (!SharedController)
        SharedController = [[ManageAccountsController alloc] init];

    return SharedController;
}

- (id)init
{
    if (self = [super initWithWindowCibName:@"ManageAccounts"])
    {
        accounts = [[AccountsController sharedController] accounts];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(accountsWereUpdated:)
                   name:AccountWasAddedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(accountsWereUpdated:)
                   name:AccountWasEditedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(accountsWereUpdated:)
                   name:AccountWasDeletedNotification
                 object:nil];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(accountsWereUpdated:)
                   name:TNStropheConnectionStatusDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [super awakeFromCib];
    [[self window] setFrameOrigin:CGPointMake(310,50)];
    [editAccountButton setEnabled:NO];
    [deleteAccountButton setEnabled:NO];

    accountsTable = [[CPTableView alloc] initWithFrame:[scrollView bounds]];
    [accountsTable setDataSource:self];
    [accountsTable setDelegate:self];
    [accountsTable setDoubleAction:@selector(doubleClickedRow:)];
    [accountsTable setUsesAlternatingRowBackgroundColors:YES];

    var stateColumn = [[CPTableColumn alloc] initWithIdentifier:@"accountState"];
    [stateColumn setWidth:24.0];
    [accountsTable addTableColumn:stateColumn];

    var jidColumn = [[CPTableColumn alloc] initWithIdentifier:@"JID"];
    [[jidColumn headerView] setStringValue:@"JID"];
    [jidColumn setWidth:200.0];
    [accountsTable addTableColumn:jidColumn];

    var connectionStatusColumn = [[CPTableColumn alloc] initWithIdentifier:@"connectionStatus"];
    [[connectionStatusColumn headerView] setStringValue:@"Connection Status"];
    [connectionStatusColumn setWidth:140.0];
    [accountsTable addTableColumn:connectionStatusColumn];

    [scrollView setDocumentView:accountsTable];
    [CPBox boxEnclosingView:scrollView];
}

- (@action)addAccount:(id)aSender
{
    var controller = [[NewAccountController alloc] init];
    [controller showWindow:aSender];
}

- (Account)selectedAccount
{
    return [accounts objectAtIndex:[accountsTable selectedRow]];
}

- (@action)editAccount:(id)aSender
{
    CPLog.debug("Editing an account!");
    var controller = [[EditAccountController alloc] initWithAccount:[self selectedAccount]];
    [controller showWindow:aSender];
}

- (@action)deleteAccount:(id)aSender
{
    CPLog.debug("Deleting an account!");
    [[AccountsController sharedController] deleteAccount:[self selectedAccount]];
}

- (void)accountsWereUpdated:(CPNotification)aNotification
{
    CPLog.debug("Accounts were updated!");
    [accountsTable reloadData];
    [self setButtonStatus];
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    return [accounts count];
}

- (CPView)tableView:(CPTableView)aTableView dataViewForTableColumn:(CPTableColumn)aTableColumn row:(int)aRow
{
    if ([aTableColumn identifier] == @"accountState")
        return [CPCheckBox checkBoxWithTitle:nil];

    return [aTableColumn dataView];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aTableColumn row:(int)aRow
{
    var account = [accounts objectAtIndex:aRow],
        value;

    switch ([aTableColumn identifier])
    {
        case @"accountState":
            if ([account isEnabled])
                value = CPOnState;
            else
                value = CPOffState;

            break;
        case @"JID":
            value = [account JID];
            break;
        case @"connectionStatus":
            value = [account connectionStatus];
            break;
    }
    return value;
}

- (void)tableView:(CPTableView)aTableView setObjectValue:(id)anObject forTableColumn:(CPTableColumn)aTableColumn row:(int)aRow
{
    var account = [accounts objectAtIndex:aRow];
    if ([aTableColumn identifier] == @"accountState")
    {
        if (anObject == CPOnState)
            [account enable];
        else if (anObject === CPOffState)
            [account disable];
    }
}

- (void)tableViewSelectionDidChange:(CPNotification)aNotification
{
    [self setButtonStatus];
}

- (void)setButtonStatus
{
    var answer = YES;
    if ([accountsTable selectedRow] == -1 || [accounts count] < 1)
        answer = NO;

    [editAccountButton setEnabled:answer];
    [deleteAccountButton setEnabled:answer];
}

- (void)doubleClickedRow:(CPTableView)aTableView
{
    [[[self selectedAccount] editAccountController] showWindow:self];
}

@end
