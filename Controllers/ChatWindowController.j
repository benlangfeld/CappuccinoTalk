/*
 * ChatWindowController.j
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
@import <MessageBoard/MessageBoard.j>

@import "../Models/Account.j"

@implementation ChatWindowController : CPWindowController
{
    TNStropheContact    contact;
    @outlet CPScrollView        scrollView;
            TNMessageBoard      conversationView;
    @outlet CPTextField         messageField;
    @outlet CPButton            sendButton;
}

- (id)initWithContact:(TNStropheContact)aContact
{
    if (self = [super initWithWindowCibName:@"ChatWindow"])
    {
        contact = aContact;
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.
    [super awakeFromCib];
    [[self window] setTitle:[contact nickname]];
    conversationView = [[TNMessageBoard alloc] initWithFrame:[scrollView bounds]];

    [scrollView setDocumentView:conversationView];
}

- (@action)sendMessage:(id)aSender
{
    [contact sendMessage:[messageField objectValue]];
    [messageField setObjectValue:nil];
}

@end
