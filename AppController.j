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
        manageAccountsButton = [CPButtonBar minusButton];

    [plusButton setTarget:[AccountsController sharedController]];
    [plusButton setAction:@selector(promptForNewContact:)];
    [minusButton setTarget:[AccountsController sharedController]];
    [minusButton setAction:@selector(removeContact:)];
    [manageAccountsButton setTarget:[AccountsController sharedController]];
    [manageAccountsButton setAction:@selector(manageAccounts:)];

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
