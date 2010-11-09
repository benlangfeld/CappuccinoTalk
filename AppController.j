/*
 * AppController.j
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

@import <Foundation/CPObject.j>
@import <Foundation/CPTimer.j>

@import "Controllers/ManageAccountsController.j"


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPSplitView mainSplitView;
    @outlet CPButtonBar rosterButtonBar;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [mainSplitView setButtonBar:rosterButtonBar forDividerAtIndex:0];
    [mainSplitView setPosition:220 ofDividerAtIndex:0];

    var plusButton = [CPButtonBar plusButton],
        minusButton = [CPButtonBar minusButton],
        manageAccountsButton = [CPButtonBar actionPopupButton];

    [plusButton setTarget:[AccountsController sharedController]];
    [plusButton setAction:@selector(promptForNewContact:)];
    [minusButton setTarget:[AccountsController sharedController]];
    [minusButton setAction:@selector(rosterMinusWasClicked:)];

    var manageAccountsItem = [[CPMenuItem alloc] initWithTitle:@"Manage Accounts" action:@selector(manageAccounts:) keyEquivalent:nil];
    [manageAccountsItem setTarget:[AccountsController sharedController]];

    var consoleItem = [[CPMenuItem alloc] initWithTitle:@"Open XML Console for selected Account" action:@selector(openXMLConsole:) keyEquivalent:nil];
    [consoleItem setTarget:[AccountsController sharedController]];

    var connectAccountsItem = [[CPMenuItem alloc] initWithTitle:@"Connect All Accounts" action:@selector(connectAllAccounts:) keyEquivalent:nil];
    [connectAccountsItem setTarget:[AccountsController sharedController]];

    var disconnectAccountsItem = [[CPMenuItem alloc] initWithTitle:@"Disconnect All Accounts" action:@selector(disconnectAllAccounts:) keyEquivalent:nil];
    [disconnectAccountsItem setTarget:[AccountsController sharedController]];

    var connectSelectedAccountItem = [[CPMenuItem alloc] initWithTitle:@"Connect Selected Account" action:@selector(connectSelectedAccount:) keyEquivalent:nil];
    [connectSelectedAccountItem setTarget:[AccountsController sharedController]];

    var disconnectSelectedAccountItem = [[CPMenuItem alloc] initWithTitle:@"Disconnect Selected Account" action:@selector(disconnectSelectedAccount:) keyEquivalent:nil];
    [disconnectSelectedAccountItem setTarget:[AccountsController sharedController]];

    [manageAccountsButton addItem:connectSelectedAccountItem];
    [manageAccountsButton addItem:disconnectSelectedAccountItem];
    [manageAccountsButton addItem:[CPMenuItem separatorItem]];
    [manageAccountsButton addItem:connectAccountsItem];
    [manageAccountsButton addItem:disconnectAccountsItem];
    [manageAccountsButton addItem:[CPMenuItem separatorItem]];
    [manageAccountsButton addItem:manageAccountsItem];
    [manageAccountsButton addItem:consoleItem];

    [rosterButtonBar setButtons:[plusButton, minusButton, manageAccountsButton]];
}

- (CGFloat)splitView:(CPSplitView)splitView constrainMinCoordinate:(float)proposedMin ofSubviewAt:(int)dividerIndex
{
    return 160;
}

- (CGFloat)splitView:(CPSplitView)splitView constrainMaxCoordinate:(float)proposedMax ofSubviewAt:(int)dividerIndex
{
    return 300;
}

@end
