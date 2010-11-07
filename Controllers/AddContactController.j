/*
 * AddContactController.j
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

@implementation AddContactController : CPWindowController
{
    @outlet CPButton        addButton;
    @outlet CPTextField     jidField;
    @outlet CPTextField     nameField;
    @outlet CPPopUpButton   groupPicker;
            Account         account;
}

- (id)initWithAccount:(Account)anAccount
{
    if (self = [super initWithWindowCibName:@"AddContact"])
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
    [[self window] setDefaultButton:addButton];

    [jidField becomeFirstResponder];
    [jidField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];
    [nameField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];

    [groupPicker removeAllItems];

    for (var i = 0; i < [[[account roster] groups] count]; i++)
    {
        var group   = [[[account roster] groups] objectAtIndex:i],
            item    = [CPMenuItem new];
        [item setTag:[group name]];
        [item setTitle:[group name]];
        [groupPicker addItem:item];
    }

    [groupPicker selectItemAtIndex:0];
}

- (@action)add:(id)aSender
{
    [[account roster] addContact:[jidField objectValue] withName:[nameField objectValue] inGroupWithName:[[groupPicker selectedItem] tag]];
    [self close];
}

- (@action)cancel:(id)aSender
{
    [self close];
}

@end
