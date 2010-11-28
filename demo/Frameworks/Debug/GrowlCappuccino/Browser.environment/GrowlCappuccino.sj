@STATIC;1.0;p;17;GrowlCappuccino.jt;140;@STATIC;1.0;i;15;TNGrowlCenter.ji;13;TNGrowlView.jt;85;objj_executeFile("TNGrowlCenter.j", YES);;
objj_executeFile("TNGrowlView.j", YES);;

p;15;TNGrowlCenter.jt;8051;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;TNGrowlView.jt;7966;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("TNGrowlView.j", YES);;
TNGrowlDefaultCenter = nil;
TNGrowlIconInfo = "TNGrowlIconInfo";
TNGrowlIconError = "TNGrowlIconError";
TNGrowlIconWarning = "TNGrowlIconWarning";
TNGrowlPlacementWidth = 250.0
TNGrowlPlacementHeight = 80.0
TNGrowlPlacementMarginTop = 10.0;
TNGrowlPlacementMarginRight = 10.0;
TNGrowlAnimationDuration = 0.3;
{var the_class = objj_allocateClassPair(CPObject, "TNGrowlCenter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_defaultLifeTime"), new objj_ivar("_view"), new objj_ivar("_notifications"), new objj_ivar("_notificationFrame"), new objj_ivar("_useWindowMouseMoveEvents")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("lifeDefaultTime"), function $TNGrowlCenter__lifeDefaultTime(self, _cmd)
{ with(self)
{
return _defaultLifeTime;
}
},["id"]),
new objj_method(sel_getUid("setDefaultLifeTime:"), function $TNGrowlCenter__setDefaultLifeTime_(self, _cmd, newValue)
{ with(self)
{
_defaultLifeTime = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("view"), function $TNGrowlCenter__view(self, _cmd)
{ with(self)
{
return _view;
}
},["id"]),
new objj_method(sel_getUid("setView:"), function $TNGrowlCenter__setView_(self, _cmd, newValue)
{ with(self)
{
_view = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $TNGrowlCenter__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNGrowlCenter").super_class }, "init"))
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        _defaultLifeTime = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "TNGrowlDefaultLifeTime");
        _notifications = objj_msgSend(CPArray, "array");
        _notificationFrame = CGRectMake(10,10, TNGrowlPlacementWidth,TNGrowlPlacementHeight);
        _useWindowMouseMoveEvents = objj_msgSend(bundle, "objectForInfoDictionaryKey:", "TNGrowlUseMouseMoveEvents");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("didReceivedNotificationEndLifeTime:"), function $TNGrowlCenter__didReceivedNotificationEndLifeTime_(self, _cmd, aNotification)
{ with(self)
{
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter"),
        senderView = objj_msgSend(aNotification, "object"),
        animView = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", senderView, CPViewAnimationTargetKey, CPViewAnimationFadeOutEffect, CPViewAnimationEffectKey),
        anim = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithViewAnimations:", [animView]);
    objj_msgSend(center, "removeObserver:name:object:", self, TNGrowlViewLifeTimeExpirationNotification, senderView);
    objj_msgSend(anim, "setDuration:", TNGrowlAnimationDuration);
    objj_msgSend(anim, "setDelegate:", self);
    objj_msgSend(anim, "startAnimation");
}
},["void","CPNotification"]), new objj_method(sel_getUid("pushNotificationWithTitle:message:"), function $TNGrowlCenter__pushNotificationWithTitle_message_(self, _cmd, aTitle, aMessage)
{ with(self)
{
    objj_msgSend(self, "pushNotificationWithTitle:message:icon:", aTitle, aMessage, TNGrowlIconInfo);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("pushNotificationWithTitle:message:icon:"), function $TNGrowlCenter__pushNotificationWithTitle_message_icon_(self, _cmd, aTitle, aMessage, anIconType)
{ with(self)
{
    objj_msgSend(self, "pushNotificationWithTitle:message:customIcon:", aTitle, aMessage, anIconType);
}
},["void","CPString","CPString","CPString"]), new objj_method(sel_getUid("pushNotificationWithTitle:message:customIcon:"), function $TNGrowlCenter__pushNotificationWithTitle_message_customIcon_(self, _cmd, aTitle, aMessage, anIcon)
{ with(self)
{
    objj_msgSend(self, "pushNotificationWithTitle:message:customIcon:target:action:actionParameters:", aTitle, aMessage, anIcon, nil, nil, nil);
}
},["void","CPString","CPString","id"]), new objj_method(sel_getUid("pushNotificationWithTitle:message:customIcon:target:action:actionParameters:"), function $TNGrowlCenter__pushNotificationWithTitle_message_customIcon_target_action_actionParameters_(self, _cmd, aTitle, aMessage, anIcon, aTarget, anAction, anObject)
{ with(self)
{
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter"),
        notifView = objj_msgSend(objj_msgSend(TNGrowlView, "alloc"), "initWithFrame:title:message:icon:lifeTime:", _notificationFrame, aTitle, aMessage, anIcon, _defaultLifeTime),
        frame = objj_msgSend(_view, "frame"),
        notifFrame = CPRectCreateCopy(_notificationFrame),
        animParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", notifView, CPViewAnimationTargetKey, CPViewAnimationFadeInEffect, CPViewAnimationEffectKey),
        anim = objj_msgSend(objj_msgSend(CPViewAnimation, "alloc"), "initWithViewAnimations:", [animParams]);
    if (_useWindowMouseMoveEvents && !objj_msgSend(objj_msgSend(_view, "window"), "acceptsMouseMovedEvents"))
        objj_msgSend(objj_msgSend(_view, "window"), "setAcceptsMouseMovedEvents:", YES);
    objj_msgSend(center, "addObserver:selector:name:object:", self, sel_getUid("didReceivedNotificationEndLifeTime:"), TNGrowlViewLifeTimeExpirationNotification, notifView);
    notifFrame.origin.x = frame.size.width - _notificationFrame.size.width - TNGrowlPlacementMarginRight;
    notifFrame.origin.y = TNGrowlPlacementMarginTop;
    for (var i = 0; i < objj_msgSend(_notifications, "count"); i++)
    {
        var isViewInThisFrame = NO,
            tmpFrame;
        for (var j = 0; j < objj_msgSend(_notifications, "count"); j++)
        {
            tmpFrame = objj_msgSend(objj_msgSend(_notifications, "objectAtIndex:", j), "frame");
            if ((notifFrame.origin.y == tmpFrame.origin.y) && (notifFrame.origin.x == tmpFrame.origin.x))
            {
                isViewInThisFrame = YES;
                break;
            }
        }
        if (!isViewInThisFrame)
            break;
        notifFrame.origin.y += tmpFrame.size.height + TNGrowlPlacementMarginTop;
        if ((notifFrame.origin.y + notifFrame.size.height) >= frame.size.height)
        {
            notifFrame.origin.x -= (notifFrame.size.width + TNGrowlPlacementMarginRight);
            notifFrame.origin.y = TNGrowlPlacementMarginTop;
        }
    }
    objj_msgSend(_notifications, "addObject:", notifView);
    objj_msgSend(notifView, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(notifView, "setFrame:", notifFrame);
    objj_msgSend(notifView, "setTarget:", aTarget);
    objj_msgSend(notifView, "setAction:", anAction);
    objj_msgSend(notifView, "setActionParameters:", anObject);
    objj_msgSend(_view, "addSubview:", notifView);
    objj_msgSend(anim, "setDuration:", 0.3);
    objj_msgSend(anim, "startAnimation");
}
},["void","CPString","CPString","id","id","SEL","id"]), new objj_method(sel_getUid("animationDidEnd:"), function $TNGrowlCenter__animationDidEnd_(self, _cmd, anAnimation)
{ with(self)
{
    var senderView = objj_msgSend(objj_msgSend(objj_msgSend(anAnimation, "viewAnimations"), "objectAtIndex:", 0), "objectForKey:", CPViewAnimationTargetKey);
    objj_msgSend(_notifications, "removeObject:", senderView);
    objj_msgSend(senderView, "removeFromSuperview");
    if (_useWindowMouseMoveEvents && objj_msgSend(objj_msgSend(_view, "window"), "acceptsMouseMovedEvents") && objj_msgSend(_notifications, "count") == 0);
        objj_msgSend(objj_msgSend(_view, "window"), "setAcceptsMouseMovedEvents:", NO);
}
},["void","CPAnimation"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultCenter"), function $TNGrowlCenter__defaultCenter(self, _cmd)
{ with(self)
{
    if (!TNGrowlDefaultCenter)
        TNGrowlDefaultCenter = objj_msgSend(objj_msgSend(TNGrowlCenter, "alloc"), "init");
    return TNGrowlDefaultCenter;
}
},["id"])]);
}

p;13;TNGrowlView.jt;9410;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;9343;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
TNGrowlViewLifeTimeExpirationNotification = "TNGrowlViewLifeTimeExpirationNotification";
{var the_class = objj_allocateClassPair(CPView, "TNGrowlView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_target"), new objj_ivar("_action"), new objj_ivar("_actionParameters"), new objj_ivar("_icon"), new objj_ivar("_title"), new objj_ivar("_message"), new objj_ivar("_timer"), new objj_ivar("_lifeTime")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("target"), function $TNGrowlView__target(self, _cmd)
{ with(self)
{
return _target;
}
},["id"]),
new objj_method(sel_getUid("setTarget:"), function $TNGrowlView__setTarget_(self, _cmd, newValue)
{ with(self)
{
_target = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("action"), function $TNGrowlView__action(self, _cmd)
{ with(self)
{
return _action;
}
},["id"]),
new objj_method(sel_getUid("setAction:"), function $TNGrowlView__setAction_(self, _cmd, newValue)
{ with(self)
{
_action = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("actionParameters"), function $TNGrowlView__actionParameters(self, _cmd)
{ with(self)
{
return _actionParameters;
}
},["id"]),
new objj_method(sel_getUid("setActionParameters:"), function $TNGrowlView__setActionParameters_(self, _cmd, newValue)
{ with(self)
{
_actionParameters = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:title:message:icon:lifeTime:"), function $TNGrowlView__initWithFrame_title_message_icon_lifeTime_(self, _cmd, aFrame, aTitle, aMessage, anIcon, aLifeTime)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNGrowlView").super_class }, "initWithFrame:", aFrame))
    {
        _title = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(44, 5, aFrame.size.width - 44, 20));
        objj_msgSend(_title, "setStringValue:", aTitle);
        objj_msgSend(_title, "setFont:", objj_msgSend(CPFont, "boldSystemFontOfSize:", 12));
        objj_msgSend(_title, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
        objj_msgSend(_title, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "addSubview:", _title);
        _message = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(44, 20, aFrame.size.width - 50, aFrame.size.height - 25));
        objj_msgSend(_message, "setStringValue:", aMessage);
        objj_msgSend(_message, "setLineBreakMode:", CPLineBreakByWordWrapping);
        objj_msgSend(_message, "setAutoresizingMask:", CPViewHeightSizable | CPViewWidthSizable);
        objj_msgSend(_message, "setTextColor:", objj_msgSend(self, "valueForThemeAttribute:", "text-color"));
        objj_msgSend(self, "addSubview:", _message);
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "background-color"));
        objj_msgSend(self, "setAlphaValue:", objj_msgSend(self, "valueForThemeAttribute:", "alpha-value"));
        _icon = objj_msgSend(objj_msgSend(CPImageView, "alloc"), "initWithFrame:", CGRectMake(5, 6, 36, 36));
        objj_msgSend(_icon, "setImageScaling:", CPScaleProportionally);
        if (objj_msgSend(anIcon, "class") == CPImage)
            objj_msgSend(_icon, "setImage:", anIcon);
        else
            switch (anIcon)
            {
                case TNGrowlIconInfo:
                    objj_msgSend(_icon, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "icon-info"));
                    break;
                case TNGrowlIconWarning:
                    objj_msgSend(_icon, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "icon-warning"));
                    break;
                case TNGrowlIconError:
                    objj_msgSend(_icon, "setImage:", objj_msgSend(self, "valueForThemeAttribute:", "icon-error"));
                    break;
            }
        objj_msgSend(self, "addSubview:", _icon);
        var height = objj_msgSend(aMessage, "sizeWithFont:inWidth:", objj_msgSend(_message, "font"), CGRectGetWidth(aFrame) - 44).height;
        aFrame.size.height = height + 30;
        if (aFrame.size.height < TNGrowlPlacementHeight)
            aFrame.size.height = TNGrowlPlacementHeight
        objj_msgSend(self, "setFrame:", aFrame);
        _lifeTime = aLifeTime;
        _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", _lifeTime, self, sel_getUid("willBeRemoved:"), nil, NO);
    }
    return self;
}
},["id","CPRect","CPString","CPString","id","float"]), new objj_method(sel_getUid("mouseDown:"), function $TNGrowlView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPLeftMouseDown)
    {
        objj_msgSend(_timer, "invalidate");
        objj_msgSend(self, "willBeRemoved:", nil);
        if (_target && _action)
            objj_msgSend(_target, "performSelector:withObject:withObject:", _action, self, _actionParameters);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNGrowlView").super_class }, "mouseDown:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseEntered:"), function $TNGrowlView__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPMouseEntered)
    {
        objj_msgSend(_timer, "invalidate");
        objj_msgSend(self, "setAlphaValue:", 1.0);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNGrowlView").super_class }, "mouseEntered:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("mouseExited:"), function $TNGrowlView__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(anEvent, "type") == CPMouseExited)
    {
        _timer = objj_msgSend(CPTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", _lifeTime, self, sel_getUid("willBeRemoved:"), nil, NO);
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNGrowlView").super_class }, "mouseExited:", anEvent);
}
},["void","CPEvent"]), new objj_method(sel_getUid("willBeRemoved:"), function $TNGrowlView__willBeRemoved_(self, _cmd, aTimer)
{ with(self)
{
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter");
    objj_msgSend(center, "postNotificationName:object:", TNGrowlViewLifeTimeExpirationNotification, self);
}
},["void","CPTimer"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $TNGrowlView__themeClass(self, _cmd)
{ with(self)
{
    return "growl-view";
}
},["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $TNGrowlView__themeAttributes(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class")),
        backgroundImage = objj_msgSend(CPColor, "colorWithPatternImage:", objj_msgSend(objj_msgSend(CPNinePartImage, "alloc"), "initWithImageSlices:", [
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/top-left.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/top.png"), CPSizeMake(1.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/top-right.png"), CPSizeMake(10.0, 30.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/left.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/center.png"), CPSizeMake(1.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/right.png"), CPSizeMake(10.0, 1.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/bottom-left.png"), CPSizeMake(10.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/bottom.png"), CPSizeMake(1.0, 12.0)),
            objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:size:", objj_msgSend(bundle, "pathForResource:", "Noir/bottom-right.png"), CPSizeMake(10.0, 12.0)),
        ])),
        iconInfo = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "icon-info.png")),
        iconError = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "icon-error.png")),
        iconWarning = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "icon-warning.png"));
    return objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [backgroundImage, iconInfo, iconError, iconWarning, objj_msgSend(CPColor, "whiteColor"), 0.8], ["background-color", "icon-info", "icon-error", "icon-warning", "text-color", "alpha-value"]);
}
},["id"])]);
}

e;