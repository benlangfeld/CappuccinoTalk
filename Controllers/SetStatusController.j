/*
 * SetStatusController.j
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

@import "AccountsController.j"
@import "../Models/Account.j"

@implementation SetStatusController : CPWindowController
{
    @outlet CPButton        setButton;
    @outlet CPPopUpButton   showPicker;
    @outlet CPTextField     statusField;
            Account         account;
}

- (id)initWithAccount:(Account)anAccount
{
    if (self = [super initWithWindowCibName:@"SetStatus"])
    {
        account = anAccount;
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [super awakeFromCib];
    [[self window] setDefaultButton:setButton];

    [statusField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];

    [showPicker removeAllItems];

    var onlineItem  = [CPMenuItem new],
        awayItem    = [CPMenuItem new],
        busyItem    = [CPMenuItem new],
        dndItem     = [CPMenuItem new];

    [onlineItem setTag:TNStropheContactStatusOnline];
    [awayItem setTag:TNStropheContactStatusAway];
    [busyItem setTag:TNStropheContactStatusBusy];
    [dndItem setTag:TNStropheContactStatusDND];

    [onlineItem setTitle:@"Online"];
    [awayItem setTitle:@"Away"];
    [busyItem setTitle:@"Busy"];
    [dndItem setTitle:@"Do Not Disturb"];

    [showPicker addItem:onlineItem];
    [showPicker addItem:awayItem];
    [showPicker addItem:busyItem];
    [showPicker addItem:dndItem];

    // [showPicker selectItemWithTag:];
    // [statusField setObjectValue:[account XMPPStatus]];

    [statusField becomeFirstResponder];
}

- (@action)submit:(id)aSender
{
    [account setStatus:[statusField objectValue] ofType:[[showPicker selectedItem] tag]];
    [self close];
}

- (@action)cancel:(id)aSender
{
    [self close];
}

@end
