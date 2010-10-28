/*
 * ContactView.j
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

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>

/*! CPView that contains information to display contacts
*/
@implementation ContactView : CPView
{
    @outlet     CPImageView     statusIcon      @accessors;
    @outlet     CPTextField     nickname        @accessors;
    @outlet     CPTextField     status          @accessors;
    @outlet     CPImageView     avatar          @accessors;
}

- (void)setObjectValue:(id)aValue
{
    [nickname setObjectValue:[aValue nickname]];
    [nickname sizeToFit];
    var s = [aValue XMPPStatus];
    if ([aValue numberOfEvents] > 0)
        s += " (" + [aValue numberOfEvents] + ")";
    [status setObjectValue:s];
    [status sizeToFit];
    [statusIcon setImage:[aValue statusIcon]];
    [avatar setImage:[aValue avatar]];
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];

    if (self)
    {
        nickname    = [aCoder decodeObjectForKey:@"nickname"];
        statusIcon  = [aCoder decodeObjectForKey:@"statusIcon"];
        avatar      = [aCoder decodeObjectForKey:@"avatar"];
        status      = [aCoder decodeObjectForKey:@"status"];
    }

    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:nickname forKey:@"nickname"];
    [aCoder encodeObject:statusIcon forKey:@"statusIcon"];
    [aCoder encodeObject:avatar forKey:@"avatar"];
    [aCoder encodeObject:status forKey:@"status"];
}

@end