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

@import <AppKit/CPView.j>

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
    var oldNicknameBounds = [nickname boundsSize];
    [nickname sizeToFit];
    [self setFrameSize:CGSizeMake([self boundsSize].x + [nickname bounds].x - oldNicknameBounds.x, [self boundsSize].y)];

    var s = @"";
    if ([aValue XMPPStatus])
        s += [aValue XMPPStatus];
    if ([aValue numberOfEvents] > 0)
        s += " (" + [aValue numberOfEvents] + ")";
    [status setObjectValue:s];
    [status sizeToFit];
    [statusIcon setImage:[aValue statusIcon]];
    [avatar setImage:[aValue avatar]];
}

- (BOOL)setThemeState:(CPThemeState)aState
{
    [nickname setThemeState:aState];
    [status setThemeState:aState];
    return [super setThemeState:aState];
}

- (BOOL)unsetThemeState:(CPThemeState)aState
{
    [nickname unsetThemeState:aState];
    [status unsetThemeState:aState];
    return [super unsetThemeState:aState];
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
        [nickname setValue:[CPColor whiteColor] forThemeAttribute:@"text-color" inState:CPThemeStateSelectedDataView];
        [status setValue:[CPColor colorWithRed:51.0 / 255.0 green:51.0 / 255.0 blue:51.0 / 255.0 alpha:1.0] forThemeAttribute:"text-color"];
        [status setValue:[CPColor whiteColor] forThemeAttribute:@"text-color" inState:CPThemeStateSelectedDataView];
        [status setLineBreakMode:CPLineBreakByTruncatingTail];
        [status setValue:[CPFont systemFontOfSize:11.0] forThemeAttribute:@"font"];
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