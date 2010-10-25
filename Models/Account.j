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

BOSHService = [[CPBundle mainBundle] objectForInfoDictionaryKey:@"XMPPBOSHService"];

ConnectionStatusConnected       = @"Connected";
ConnectionStatusConnecting      = @"Connecting";
ConnectionStatusDisconnected    = @"Disconnected";

@implementation Account : TNStropheConnection
{
    TNStropheRoster     roster      @accessors;
    BOOL                enabled     @accessors(property=isEnabled);
}

+ (Account)accountWithJID:(CPString)aJID andPassword:(CPString)aPassword enabled:(BOOL)isEnabled
{
    return [[Account alloc] initWithJID:aJID andPassword:aPassword enabled:isEnabled];
}

- (id)initWithJID:(CPString)aJID andPassword:(CPString)aPassword enabled:(BOOL)isEnabled
{
    if (self = [super initWithService:BOSHService JID:aJID resource:nil password:aPassword])
    {
        enabled = isEnabled;
        roster  = [TNStropheRoster rosterWithConnection:self];
        [self setDelegate:self];
        [roster setDelegate:self];
        localStorage.setObject([self JID], {"password": [self password], "enabled": true});
    }
    return self;
}


- (BOOL)onStropheConnecting:(id)aConnection
{
    CPLog.debug("XMPP: Connecting");
}

- (BOOL)onStropheAuthenticating:(id)aConnection
{
    CPLog.debug("XMPP: Authenticating");
}

- (BOOL)onStropheAuthFail:(id)aConnection
{
    CPLog.warn("XMPP: Authentication Failed");
}

- (BOOL)onStropheConnected:(id)aConnection
{
    CPLog.info("XMPP: Connected");
    [roster getRoster];
}

- (BOOL)onStropheConnectFail:(id)aConnection
{
    CPLog.warn("XMPP: Connection Failed");
}

- (BOOL)onStropheDisconnecting:(id)aConnection
{
    CPLog.debug("XMPP: Disconnecting");
}

- (BOOL)onStropheDisconnected:(id)aConnection
{
    CPLog.debug("XMPP: Disconnected");
}

- (BOOL)onStropheError:(id)aConnection
{
    CPLog.error("XMPP: Error");
}

- (CPString)connectionStatus
{
    if ([self isConnected])
        return ConnectionStatusConnected;

    return ConnectionStatusDisconnected;
}

- (void)enable
{
    enabled = YES;
    localStorage.setObject([self JID], {"password": [self password], "enabled": true});
}

- (void)disable
{
    [self disconnect];
    enabled = NO;
    localStorage.setObject([self JID], {"password": [self password], "enabled": false});
}

@end
