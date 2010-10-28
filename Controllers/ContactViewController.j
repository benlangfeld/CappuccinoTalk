/*
 * ContactViewController.j
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

@import <AppKit/CPViewController.j>
@import <StropheCappuccino/TNStropheContact.j>

@import "../Views/ContactView.j"

@implementation ContactViewController : CPViewController
{
    CPImage         statusIcon;
    CPString        nickname;
    CPString        XMPPStatus;
    CPNumber        numberOfEvents;
}

- (id)init
{
    self = [super initWithCibName:@"ContactView" bundle:nil]
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [super awakeFromCib];
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];

    if (self)
    {
        nickname    = [aCoder decodeObjectForKey:@"nickname"];
        statusIcon  = [aCoder decodeObjectForKey:@"statusIcon"];
        avatar      = [aCoder decodeObjectForKey:@"avatar"];
    }

    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:nickname forKey:@"nickname"];
    [aCoder encodeObject:statusIcon forKey:@"statusIcon"];
    [aCoder encodeObject:avatar forKey:@"avatar"];
}

@end
