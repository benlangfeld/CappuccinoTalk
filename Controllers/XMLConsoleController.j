/*
 * XMLConsoleController.j
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

@implementation XMLConsoleController : CPWindowController
{
    @outlet CPScrollView        scrollView;
            TNMessageBoard      conversationView;
            CPWebView           webView;
            Account             account;
}

- (id)initWithAccount:(Account)anAccount
{
    if (self = [super initWithWindowCibName:@"XMLConsole"])
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

    conversationView = [[TNMessageBoard alloc] initWithFrame:[scrollView bounds]];
    [scrollView setDocumentView:conversationView];

    [CPBox boxEnclosingView:scrollView];

    [account connection].xmlInput = function (body) {
        if (body.childNodes.length > 0)
            [self addData:body.childNodes inDirection:"incoming"];
    };
    [account connection].xmlOutput = function (body) {
        if (body.childNodes.length > 0)
            [self addData:body.childNodes inDirection:"outgoing"];
    };
}

- (void)addData:(CPString)aData inDirection:(CPString)aDirection
{
    var color;
    if (aDirection === @"incoming")
        color = [CPColor whiteColor];
    else
        color = [CPColor grayColor];

    for (var i = 0; i < aData.length; i++)
        [conversationView addMessage:[[TNXMLNode nodeWithXMLNode:aData[i]] description] from:nil date:[CPDate date] color:color];

    [self scrollToBottom];
}

- (void)scrollToBottom
{
    // Scroll to the bottom
    var verticalOffset = [conversationView boundsSize].height - [[scrollView contentView] boundsSize].height;
    [[scrollView contentView] scrollToPoint:CGPointMake(0,verticalOffset)];
    [scrollView reflectScrolledClipView:[scrollView contentView]];
}

- (@action)removeAllViews:(id)aSender
{
    return [conversationView removeAllViews:aSender];
}

@end
