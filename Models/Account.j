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

+ (Account)accountWithJID:(CPString)aJID andPassword:(CPString)aPassword
{
    return [[Account alloc] initWithJID:aJID andPassword:aPassword];
}

- (id)initWithJID:(CPString)aJID andPassword:(CPString)aPassword
{
    if (self = [super initWithService:BOSHService JID:aJID resource:nil password:aPassword])
    {
        enabled = YES;
        roster  = [TNStropheRoster rosterWithConnection:self];
        [self setDelegate:self];
        [roster setDelegate:self];
    }
    return self;
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
}

- (void)disable
{
    [self disconnect];
    enabled = NO;
}

@end
