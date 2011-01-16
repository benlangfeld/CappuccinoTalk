/*
 * Account.j
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
@import <StropheCappuccino/StropheCappuccino.j>

@import "../Controllers/SetStatusController.j"

var BOSHService = [[CPBundle mainBundle] objectForInfoDictionaryKey:@"XMPPBOSHService"];

ConnectionStatusConnected       = @"Connected";
ConnectionStatusConnecting      = @"Connecting";
ConnectionStatusDisconnected    = @"Disconnected";

AccountWasCreatedNotification   = @"AccountWasCreatedNotification";
AccountWasAddedNotification     = @"AccountWasAddedNotification";
AccountWasEditedNotification    = @"AccountWasEditedNotification";
AccountWasDeletedNotification   = @"AccountWasDeletedNotification";

@implementation Account : TNStropheClient
{
    BOOL                    enabled                 @accessors(property=isEnabled);

    CPWindowController      setStatusController;
    CPWindowController      editAccountController;
    XMLConsoleController    xmlConsoleController;
}

+ (Account)accountWithJID:(TNStropheJID)aJID andPassword:(CPString)aPassword enabled:(BOOL)isEnabled
{
    return [[Account alloc] initWithJID:aJID andPassword:aPassword enabled:isEnabled];
}

- (id)initWithJID:(TNStropheJID)aJID andPassword:(CPString)aPassword enabled:(BOOL)isEnabled
{
    if (self = [super initWithService:BOSHService JID:aJID password:aPassword])
    {
        enabled = isEnabled;
        [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasCreatedNotification object:self];
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(whenStropheConnected:)
                   name:TNStropheConnectionStatusConnected
                 object:[self connection]];
    }
    return self;
}

- (CPString)description
{
    return [[self JID] full];
}

- (void)whenStropheConnected:(id)aConnection
{
    [[CPNotificationCenter defaultCenter]
        removeObserver:self
                  name:TNStropheConnectionStatusDisconnected
                object:nil];
}

- (CPString)connectionStatus
{
    if ([[self connection] isConnected])
        return ConnectionStatusConnected;

    return ConnectionStatusDisconnected;
}

- (void)enable
{
    enabled = YES;
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasEditedNotification object:self];
    [self connect];
}

- (void)disable
{
    [self disconnect];
    enabled = NO;
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasEditedNotification object:self];
}

- (EditAccountController)editAccountController
{
    if (!editAccountController)
        editAccountController = [[EditAccountController alloc] initWithAccount:self];

    return editAccountController;
}

- (void)editWithJID:(TNStropheJID)aJID andPassword:(CPString)aPassword changeRegistration:(BOOL)changeRegistration
{
    [self disconnect];
    [self setJID:aJID];
    [self setPassword:aPassword];
    [[CPNotificationCenter defaultCenter] postNotificationName:AccountWasEditedNotification object:self];
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(connect)
               name:TNStropheConnectionStatusDisconnected
             object:nil];
}

- (SetStatusController)setStatusController
{
    if (!setStatusController)
        setStatusController = [[SetStatusController alloc] initWithAccount:self];

    return setStatusController;
}

- (void)setStatus:(CPString)aStatus ofType:(CPString)aType
{
    var stanza = [TNStropheStanza presence];
    [stanza addChildWithName:@"show"];
    [stanza addTextNode:aType];
    [stanza up];
    [stanza up];
    [stanza addChildWithName:@"status"];
    [stanza addTextNode:aStatus];
    [self send:stanza];
}

- (XMLConsoleController)xmlConsoleController
{
    if (!xmlConsoleController)
        xmlConsoleController = [[XMLConsoleController alloc] initWithAccount:self];

    return xmlConsoleController;
}

@end
