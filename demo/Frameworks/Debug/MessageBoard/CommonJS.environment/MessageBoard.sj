@STATIC;1.0;p;14;MessageBoard.jt;203;@STATIC;1.0;i;13;TNStackView.ji;16;TNMessageBoard.ji;15;TNMessageView.jt;126;objj_executeFile("TNStackView.j", YES);
objj_executeFile("TNMessageBoard.j", YES);
objj_executeFile("TNMessageView.j", YES);

p;16;TNMessageBoard.jt;1950;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;TNMessageView.ji;13;TNStackView.jt;1845;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("TNMessageView.j", YES);;
objj_executeFile("TNStackView.j", YES);;
{var the_class = objj_allocateClassPair(TNStackView, "TNMessageBoard"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_messageDicts"), new objj_ivar("_messageViews")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TNMessageBoard__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNMessageBoard").super_class }, "initWithFrame:", aFrame))
    {
        _messageDicts = objj_msgSend(CPArray, "array");
        _messageViews = objj_msgSend(CPArray, "array");
        objj_msgSend(self, "setDataSource:", _messageViews);
    }
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("addMessage:from:date:color:"), function $TNMessageBoard__addMessage_from_date_color_(self, _cmd, aMessage, anAuthor, aDate, aColor)
{ with(self)
{
    var messageView = objj_msgSend(objj_msgSend(TNMessageView, "alloc"), "initWithFrame:author:subject:message:timestamp:backgroundColor:", CPRectMake(0, 0, 100, 100), anAuthor, "Subject", aMessage, aDate, aColor);
    objj_msgSend(_messageViews, "addObject:", messageView);
    objj_msgSend(_messageDicts, "addObject:", objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anAuthor, "author", aMessage, "message", aDate, "date", aColor, "color"));
    objj_msgSend(self, "reload");
}
},["void","CPString","CPString","CPDate","CPColor"]), new objj_method(sel_getUid("removeAllMessages:"), function $TNMessageBoard__removeAllMessages_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "removeAllViews:", aSender);
}
},["IBAction","id"])]);
}

p;15;TNMessageView.jt;4070;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4003;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "TNMessageView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_fieldAuthor"), new objj_ivar("_fieldTimestamp"), new objj_ivar("_fieldMessage"), new objj_ivar("_bgColor"), new objj_ivar("_author"), new objj_ivar("_message"), new objj_ivar("_subject"), new objj_ivar("_timestamp")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:author:subject:message:timestamp:backgroundColor:"), function $TNMessageView__initWithFrame_author_subject_message_timestamp_backgroundColor_(self, _cmd, aFrame, anAuthor, aSubject, aMessage, aTimestamp, aColor)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNMessageView").super_class }, "initWithFrame:", aFrame))
    {
        _author = anAuthor;
        _subject = aSubject;
        _message = aMessage;
        _timestamp = aTimestamp;
        _bgColor = aColor;
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
        _fieldAuthor = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10,10, CGRectGetWidth(aFrame) - 10, 20));
        objj_msgSend(_fieldAuthor, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12));
        objj_msgSend(_fieldAuthor, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(_fieldAuthor, "setAutoresizingMask:", CPViewWidthSizable);
        _fieldMessage = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10,30, CGRectGetWidth(aFrame) - 20, 50));
        objj_msgSend(_fieldMessage, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
        objj_msgSend(_fieldMessage, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(_fieldMessage, "setAlignment:", CPJustifiedTextAlignment);
        _fieldTimestamp = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(CGRectGetWidth(aFrame) - 200, 10, 190, 20));
        objj_msgSend(_fieldTimestamp, "setAutoresizingMask:", CPViewMinXMargin);
        objj_msgSend(_fieldTimestamp, "setValue:forThemeAttribute:inState:", objj_msgSend(CPColor, "colorWithHexString:", "f2f0e4"), "text-shadow-color", CPThemeStateNormal);
        objj_msgSend(_fieldTimestamp, "setValue:forThemeAttribute:inState:", objj_msgSend(CPFont, "systemFontOfSize:", 9.0), "font", CPThemeStateNormal);
        objj_msgSend(_fieldTimestamp, "setValue:forThemeAttribute:inState:", objj_msgSend(CPColor, "colorWithHexString:", "808080"), "text-color", CPThemeStateNormal);
        objj_msgSend(_fieldTimestamp, "setAlignment:", CPRightTextAlignment);
        objj_msgSend(self, "addSubview:", _fieldAuthor);
        objj_msgSend(self, "addSubview:", _fieldMessage);
        objj_msgSend(self, "addSubview:", _fieldTimestamp);
        objj_msgSend(_fieldAuthor, "setStringValue:", _author);
        objj_msgSend(_fieldMessage, "setStringValue:", _message);
        objj_msgSend(_fieldTimestamp, "setStringValue:", _timestamp);
        objj_msgSend(self, "setBackgroundColor:", _bgColor);
        objj_msgSend(_fieldMessage, "setStringValue:", _message);
    }
    return self;
}
},["void",null,"CPString","CPString","CPString","CPString","CPColor"]), new objj_method(sel_getUid("layout"), function $TNMessageView__layout(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame"),
        messageHeight = objj_msgSend(_message, "sizeWithFont:inWidth:", objj_msgSend(CPFont, "systemFontOfSize:", 12), CGRectGetWidth(frame)).height,
        messageFrame = objj_msgSend(_fieldMessage, "frame");
    messageFrame.size.height = messageHeight + 10;
    frame.size.height = messageFrame.size.height + 30;
    objj_msgSend(self, "setFrame:", frame);
    objj_msgSend(_fieldMessage, "setFrame:", messageFrame);
    objj_msgSend(_fieldMessage, "setSelectable:", YES);
}
},["void"])]);
}

p;13;TNStackView.jt;4590;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4523;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPView, "TNStackView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_dataSource"), new objj_ivar("_padding"), new objj_ivar("_reversed"), new objj_ivar("_stackedViews")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("dataSource"), function $TNStackView__dataSource(self, _cmd)
{ with(self)
{
return _dataSource;
}
},["id"]),
new objj_method(sel_getUid("setDataSource:"), function $TNStackView__setDataSource_(self, _cmd, newValue)
{ with(self)
{
_dataSource = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("padding"), function $TNStackView__padding(self, _cmd)
{ with(self)
{
return _padding;
}
},["id"]),
new objj_method(sel_getUid("setPadding:"), function $TNStackView__setPadding_(self, _cmd, newValue)
{ with(self)
{
_padding = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isReversed"), function $TNStackView__isReversed(self, _cmd)
{ with(self)
{
return _reversed;
}
},["id"]),
new objj_method(sel_getUid("setReversed:"), function $TNStackView__setReversed_(self, _cmd, newValue)
{ with(self)
{
_reversed = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $TNStackView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStackView").super_class }, "initWithFrame:", aFrame))
    {
        _dataSource = objj_msgSend(CPArray, "array");
        _stackedViews = objj_msgSend(CPArray, "array");
        _padding = 0;
        _reversed = NO;
        objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable);
    }
    return self;
}
},["id","CPRect"]), new objj_method(sel_getUid("_nextPosition"), function $TNStackView___nextPosition(self, _cmd)
{ with(self)
{
    var lastStackedView = objj_msgSend(_stackedViews, "lastObject"),
        position;
    if (lastStackedView)
    {
        position = objj_msgSend(lastStackedView, "frame");
        position.origin.y = position.origin.y + position.size.height + _padding;
        position.origin.x = _padding;
    }
    else
        position = CGRectMake(_padding, _padding, objj_msgSend(self, "bounds").size.width - (_padding * 2), 0);
    return position
}
},["CPRect"]), new objj_method(sel_getUid("reload"), function $TNStackView__reload(self, _cmd)
{ with(self)
{
    var frame = objj_msgSend(self, "frame");
    frame.size.height = 0;
    objj_msgSend(self, "setFrame:", frame);
    for (var i = 0; i < objj_msgSend(_dataSource, "count"); i++)
    {
        var view = objj_msgSend(_dataSource, "objectAtIndex:", i);
        if (objj_msgSend(view, "superview"))
            objj_msgSend(view, "removeFromSuperview");
    }
    objj_msgSend(_stackedViews, "removeAllObjects");
    objj_msgSend(self, "layout");
}
},["void"]), new objj_method(sel_getUid("layout"), function $TNStackView__layout(self, _cmd)
{ with(self)
{
    var stackViewFrame = objj_msgSend(self, "frame"),
        workingArray = _reversed ? objj_msgSend(_dataSource, "copy").reverse() : _dataSource;
    stackViewFrame.size.height = 0;
    for (var i = 0; i < objj_msgSend(workingArray, "count"); i++)
    {
        var currentView = objj_msgSend(workingArray, "objectAtIndex:", i),
            position = objj_msgSend(self, "_nextPosition");
        position.size.height = objj_msgSend(currentView, "frameSize").height;
        objj_msgSend(currentView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(currentView, "setFrame:", position);
        if (objj_msgSend(currentView, "respondsToSelector:", sel_getUid("layout")))
            objj_msgSend(currentView, "layout");
        objj_msgSend(self, "addSubview:", currentView);
        objj_msgSend(_stackedViews, "addObject:", currentView);
        stackViewFrame.size.height += objj_msgSend(currentView, "frame").size.height + _padding;
    }
    stackViewFrame.size.height += _padding;
    objj_msgSend(self, "setFrame:", stackViewFrame);
}
},["void"]), new objj_method(sel_getUid("removeAllViews:"), function $TNStackView__removeAllViews_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(_dataSource, "removeAllObjects");
    objj_msgSend(self, "reload");
}
},["IBAction","id"]), new objj_method(sel_getUid("reverse:"), function $TNStackView__reverse_(self, _cmd, sender)
{ with(self)
{
    _reversed = !_reversed;
    objj_msgSend(self, "reload");
}
},["IBAction","id"])]);
}

e;