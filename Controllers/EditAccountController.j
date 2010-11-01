/*
 * EditAccountController.j
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

@implementation EditAccountController : CPWindowController
{
    @outlet CPButton    editButton;
    @outlet CPCheckBox  changeRegistrationField;
    @outlet CPTextField jidField;
    @outlet CPTextField passwordField;
            Account     account;
}

- (id)initWithAccount:(Account)anAccount
{
    if (self = [super initWithWindowCibName:@"EditAccount"])
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
    [[self window] setDefaultButton:editButton];
    [passwordField setSecure:YES];

    [jidField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];
    [passwordField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];

    [jidField setObjectValue:[account JID]];
    [passwordField setObjectValue:[account password]];

    [jidField becomeFirstResponder];
}

- (@action)submit:(id)aSender
{
    [account editWithJID:[jidField objectValue] andPassword:[passwordField objectValue] changeRegistration:[changeRegistrationField objectValue] === 1];
    [self close];
}

- (@action)cancel:(id)aSender
{
    [self close];
}

@end
