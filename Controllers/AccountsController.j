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

SharedAccountsController = nil;

AccountWasCreatedNotification   = @"AccountWasCreatedNotification";
AccountWasEditedNotification    = @"AccountWasEditedNotification";
AccountWasDeletedNotification   = @"AccountWasDeletedNotification";

@implementation AccountsController : CPWindowController
{
    CPArray accounts @accessors;
}

+ (AccountsController)sharedController
{
    if (!SharedAccountsController)
        SharedAccountsController = [[AccountsController alloc] init];

    return SharedAccountsController;
}

- (id)init
{
    if (self = [super initWithWindowCibName:@"Accounts"])
    {
        accounts = [CPArray array];
        for (var i = 0; i < localStorage.length; i++)
        {
            var JID     = localStorage.key(i),
                object  = localStorage.getObject(JID);
            [self addAccountWithJID:JID andPassword:object["password"] enabled:object["enabled"]];
        }
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [super awakeFromCib];
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
}

- (void)deleteAccount:(Account)anAccount
{
    [anAccount disconnect];
    [accounts removeObject:anAccount];
    localStorage.removeItem([anAccount JID]);
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasDeletedNotification object:self];
}

@end
