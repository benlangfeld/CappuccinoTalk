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
        [[CPNotificationCenter defaultCenter]
            addObserver:self
               selector:@selector(stopListeningForMessages)
                   name:CPWindowWillCloseNotification
                 object:[self window]];
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
    [[self window] setDefaultButton:sendButton];

    [messageField setValue:[CPColor grayColor] forThemeAttribute:"text-color" inState:CPTextFieldStatePlaceholder];
    [messageField becomeFirstResponder];

    conversationView = [[TNMessageBoard alloc] initWithFrame:[scrollView bounds]];
    [scrollView setDocumentView:conversationView];

    [CPBox boxEnclosingView:scrollView];
}

- (void)showWindow:(id)aSender
{
    [super showWindow:aSender];
    [self grabAllQueuedMessages];
    [self startListeningForMessages];
}

- (void)grabAllQueuedMessages
{
    var message;
    while (message = [contact popMessagesQueue])
        [self processIncomingMessage:message];
}

- (void)startListeningForMessages
{
    [[CPNotificationCenter defaultCenter]
        addObserver:self
           selector:@selector(receiveMessage:)
               name:TNStropheContactMessageReceivedNotification
             object:contact];
}

- (void)stopListeningForMessages
{
    [[CPNotificationCenter defaultCenter]
        removeObserver:self
                  name:TNStropheContactMessageReceivedNotification
                object:contact];
}

- (@action)sendMessage:(id)aSender
{
    var body = [messageField objectValue];
    [contact sendMessage:body];
    [messageField setObjectValue:nil];
    [conversationView addMessage:body from:@"me" date:[CPDate date] color:[CPColor redColor]];
    [self scrollToBottom];
}

- (void)receiveMessage:(CPNotification)aNotification
{
    [self processIncomingMessage:[contact popMessagesQueue]];
}

- (void)processIncomingMessage:(TNStropheStanza)aMessage
{
    [conversationView addMessage:[[aMessage firstChildWithName:@"body"] text] from:[contact nickname] date:[CPDate date] color:[CPColor blueColor]];
    [self scrollToBottom];
}

- (void)scrollToBottom
{
    // Scroll to the bottom
    var verticalOffset = [conversationView boundsSize].height - [[scrollView contentView] boundsSize].height;
    [[scrollView contentView] scrollToPoint:CGPointMake(0,verticalOffset)];
    [scrollView reflectScrolledClipView:[scrollView contentView]];
}

@end
