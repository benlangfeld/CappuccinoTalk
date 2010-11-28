@STATIC;1.0;p;17;GrowlCappuccino.jt;136;@STATIC;1.0;i;15;TNGrowlCenter.ji;13;TNGrowlView.jt;81;
objj_executeFile("TNGrowlCenter.j",YES);
objj_executeFile("TNGrowlView.j",YES);
p;15;TNGrowlCenter.jt;5860;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;13;TNGrowlView.jt;5775;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("TNGrowlView.j",YES);
TNGrowlDefaultCenter=nil;
TNGrowlIconInfo="TNGrowlIconInfo";
TNGrowlIconError="TNGrowlIconError";
TNGrowlIconWarning="TNGrowlIconWarning";
TNGrowlPlacementWidth=250;
TNGrowlPlacementHeight=80;
TNGrowlPlacementMarginTop=10;
TNGrowlPlacementMarginRight=10;
TNGrowlAnimationDuration=0.3;
var _1=objj_allocateClassPair(CPObject,"TNGrowlCenter"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_defaultLifeTime"),new objj_ivar("_view"),new objj_ivar("_notifications"),new objj_ivar("_notificationFrame"),new objj_ivar("_useWindowMouseMoveEvents")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("lifeDefaultTime"),function(_3,_4){
with(_3){
return _defaultLifeTime;
}
}),new objj_method(sel_getUid("setDefaultLifeTime:"),function(_5,_6,_7){
with(_5){
_defaultLifeTime=_7;
}
}),new objj_method(sel_getUid("view"),function(_8,_9){
with(_8){
return _view;
}
}),new objj_method(sel_getUid("setView:"),function(_a,_b,_c){
with(_a){
_view=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("TNGrowlCenter").super_class},"init")){
var _f=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_d,"class"));
_defaultLifeTime=objj_msgSend(_f,"objectForInfoDictionaryKey:","TNGrowlDefaultLifeTime");
_notifications=objj_msgSend(CPArray,"array");
_notificationFrame=CGRectMake(10,10,TNGrowlPlacementWidth,TNGrowlPlacementHeight);
_useWindowMouseMoveEvents=objj_msgSend(_f,"objectForInfoDictionaryKey:","TNGrowlUseMouseMoveEvents");
}
return _d;
}
}),new objj_method(sel_getUid("didReceivedNotificationEndLifeTime:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(CPNotificationCenter,"defaultCenter"),_14=objj_msgSend(_12,"object"),_15=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_14,CPViewAnimationTargetKey,CPViewAnimationFadeOutEffect,CPViewAnimationEffectKey),_16=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_15]);
objj_msgSend(_13,"removeObserver:name:object:",_10,TNGrowlViewLifeTimeExpirationNotification,_14);
objj_msgSend(_16,"setDuration:",TNGrowlAnimationDuration);
objj_msgSend(_16,"setDelegate:",_10);
objj_msgSend(_16,"startAnimation");
}
}),new objj_method(sel_getUid("pushNotificationWithTitle:message:"),function(_17,_18,_19,_1a){
with(_17){
objj_msgSend(_17,"pushNotificationWithTitle:message:icon:",_19,_1a,TNGrowlIconInfo);
}
}),new objj_method(sel_getUid("pushNotificationWithTitle:message:icon:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
objj_msgSend(_1b,"pushNotificationWithTitle:message:customIcon:",_1d,_1e,_1f);
}
}),new objj_method(sel_getUid("pushNotificationWithTitle:message:customIcon:"),function(_20,_21,_22,_23,_24){
with(_20){
objj_msgSend(_20,"pushNotificationWithTitle:message:customIcon:target:action:actionParameters:",_22,_23,_24,nil,nil,nil);
}
}),new objj_method(sel_getUid("pushNotificationWithTitle:message:customIcon:target:action:actionParameters:"),function(_25,_26,_27,_28,_29,_2a,_2b,_2c){
with(_25){
var _2d=objj_msgSend(CPNotificationCenter,"defaultCenter"),_2e=objj_msgSend(objj_msgSend(TNGrowlView,"alloc"),"initWithFrame:title:message:icon:lifeTime:",_notificationFrame,_27,_28,_29,_defaultLifeTime),_2f=objj_msgSend(_view,"frame"),_30=CPRectCreateCopy(_notificationFrame),_31=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_2e,CPViewAnimationTargetKey,CPViewAnimationFadeInEffect,CPViewAnimationEffectKey),_32=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[_31]);
if(_useWindowMouseMoveEvents&&!objj_msgSend(objj_msgSend(_view,"window"),"acceptsMouseMovedEvents")){
objj_msgSend(objj_msgSend(_view,"window"),"setAcceptsMouseMovedEvents:",YES);
}
objj_msgSend(_2d,"addObserver:selector:name:object:",_25,sel_getUid("didReceivedNotificationEndLifeTime:"),TNGrowlViewLifeTimeExpirationNotification,_2e);
_30.origin.x=_2f.size.width-_notificationFrame.size.width-TNGrowlPlacementMarginRight;
_30.origin.y=TNGrowlPlacementMarginTop;
for(var i=0;i<objj_msgSend(_notifications,"count");i++){
var _33=NO,_34;
for(var j=0;j<objj_msgSend(_notifications,"count");j++){
_34=objj_msgSend(objj_msgSend(_notifications,"objectAtIndex:",j),"frame");
if((_30.origin.y==_34.origin.y)&&(_30.origin.x==_34.origin.x)){
_33=YES;
break;
}
}
if(!_33){
break;
}
_30.origin.y+=_34.size.height+TNGrowlPlacementMarginTop;
if((_30.origin.y+_30.size.height)>=_2f.size.height){
_30.origin.x-=(_30.size.width+TNGrowlPlacementMarginRight);
_30.origin.y=TNGrowlPlacementMarginTop;
}
}
objj_msgSend(_notifications,"addObject:",_2e);
objj_msgSend(_2e,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_2e,"setFrame:",_30);
objj_msgSend(_2e,"setTarget:",_2a);
objj_msgSend(_2e,"setAction:",_2b);
objj_msgSend(_2e,"setActionParameters:",_2c);
objj_msgSend(_view,"addSubview:",_2e);
objj_msgSend(_32,"setDuration:",0.3);
objj_msgSend(_32,"startAnimation");
}
}),new objj_method(sel_getUid("animationDidEnd:"),function(_35,_36,_37){
with(_35){
var _38=objj_msgSend(objj_msgSend(objj_msgSend(_37,"viewAnimations"),"objectAtIndex:",0),"objectForKey:",CPViewAnimationTargetKey);
objj_msgSend(_notifications,"removeObject:",_38);
objj_msgSend(_38,"removeFromSuperview");
if(_useWindowMouseMoveEvents&&objj_msgSend(objj_msgSend(_view,"window"),"acceptsMouseMovedEvents")&&objj_msgSend(_notifications,"count")==0){
}
objj_msgSend(objj_msgSend(_view,"window"),"setAcceptsMouseMovedEvents:",NO);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultCenter"),function(_39,_3a){
with(_39){
if(!TNGrowlDefaultCenter){
TNGrowlDefaultCenter=objj_msgSend(objj_msgSend(TNGrowlCenter,"alloc"),"init");
}
return TNGrowlDefaultCenter;
}
})]);
p;13;TNGrowlView.jt;7271;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;7204;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
TNGrowlViewLifeTimeExpirationNotification="TNGrowlViewLifeTimeExpirationNotification";
var _1=objj_allocateClassPair(CPView,"TNGrowlView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_target"),new objj_ivar("_action"),new objj_ivar("_actionParameters"),new objj_ivar("_icon"),new objj_ivar("_title"),new objj_ivar("_message"),new objj_ivar("_timer"),new objj_ivar("_lifeTime")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("target"),function(_3,_4){
with(_3){
return _target;
}
}),new objj_method(sel_getUid("setTarget:"),function(_5,_6,_7){
with(_5){
_target=_7;
}
}),new objj_method(sel_getUid("action"),function(_8,_9){
with(_8){
return _action;
}
}),new objj_method(sel_getUid("setAction:"),function(_a,_b,_c){
with(_a){
_action=_c;
}
}),new objj_method(sel_getUid("actionParameters"),function(_d,_e){
with(_d){
return _actionParameters;
}
}),new objj_method(sel_getUid("setActionParameters:"),function(_f,_10,_11){
with(_f){
_actionParameters=_11;
}
}),new objj_method(sel_getUid("initWithFrame:title:message:icon:lifeTime:"),function(_12,_13,_14,_15,_16,_17,_18){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("TNGrowlView").super_class},"initWithFrame:",_14)){
_title=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(44,5,_14.size.width-44,20));
objj_msgSend(_title,"setStringValue:",_15);
objj_msgSend(_title,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_title,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_title,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_12,"addSubview:",_title);
_message=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(44,20,_14.size.width-50,_14.size.height-25));
objj_msgSend(_message,"setStringValue:",_16);
objj_msgSend(_message,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_message,"setAutoresizingMask:",CPViewHeightSizable|CPViewWidthSizable);
objj_msgSend(_message,"setTextColor:",objj_msgSend(_12,"valueForThemeAttribute:","text-color"));
objj_msgSend(_12,"addSubview:",_message);
objj_msgSend(_12,"setBackgroundColor:",objj_msgSend(_12,"valueForThemeAttribute:","background-color"));
objj_msgSend(_12,"setAlphaValue:",objj_msgSend(_12,"valueForThemeAttribute:","alpha-value"));
_icon=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(5,6,36,36));
objj_msgSend(_icon,"setImageScaling:",CPScaleProportionally);
if(objj_msgSend(_17,"class")==CPImage){
objj_msgSend(_icon,"setImage:",_17);
}else{
switch(_17){
case TNGrowlIconInfo:
objj_msgSend(_icon,"setImage:",objj_msgSend(_12,"valueForThemeAttribute:","icon-info"));
break;
case TNGrowlIconWarning:
objj_msgSend(_icon,"setImage:",objj_msgSend(_12,"valueForThemeAttribute:","icon-warning"));
break;
case TNGrowlIconError:
objj_msgSend(_icon,"setImage:",objj_msgSend(_12,"valueForThemeAttribute:","icon-error"));
break;
}
}
objj_msgSend(_12,"addSubview:",_icon);
var _19=objj_msgSend(_16,"sizeWithFont:inWidth:",objj_msgSend(_message,"font"),CGRectGetWidth(_14)-44).height;
_14.size.height=_19+30;
if(_14.size.height<TNGrowlPlacementHeight){
_14.size.height=TNGrowlPlacementHeight;
}
objj_msgSend(_12,"setFrame:",_14);
_lifeTime=_18;
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_lifeTime,_12,sel_getUid("willBeRemoved:"),nil,NO);
}
return _12;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1a,_1b,_1c){
with(_1a){
if(objj_msgSend(_1c,"type")==CPLeftMouseDown){
objj_msgSend(_timer,"invalidate");
objj_msgSend(_1a,"willBeRemoved:",nil);
if(_target&&_action){
objj_msgSend(_target,"performSelector:withObject:withObject:",_action,_1a,_actionParameters);
}
}
objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("TNGrowlView").super_class},"mouseDown:",_1c);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(_1f,"type")==CPMouseEntered){
objj_msgSend(_timer,"invalidate");
objj_msgSend(_1d,"setAlphaValue:",1);
}
objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("TNGrowlView").super_class},"mouseEntered:",_1f);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_20,_21,_22){
with(_20){
if(objj_msgSend(_22,"type")==CPMouseExited){
_timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_lifeTime,_20,sel_getUid("willBeRemoved:"),nil,NO);
}
objj_msgSendSuper({receiver:_20,super_class:objj_getClass("TNGrowlView").super_class},"mouseExited:",_22);
}
}),new objj_method(sel_getUid("willBeRemoved:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_26,"postNotificationName:object:",TNGrowlViewLifeTimeExpirationNotification,_23);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("themeClass"),function(_27,_28){
with(_27){
return "growl-view";
}
}),new objj_method(sel_getUid("themeAttributes"),function(_29,_2a){
with(_29){
var _2b=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_29,"class")),_2c=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPNinePartImage,"alloc"),"initWithImageSlices:",[objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/top-left.png"),CPSizeMake(10,30)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/top.png"),CPSizeMake(1,30)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/top-right.png"),CPSizeMake(10,30)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/left.png"),CPSizeMake(10,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/center.png"),CPSizeMake(1,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/right.png"),CPSizeMake(10,1)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/bottom-left.png"),CPSizeMake(10,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/bottom.png"),CPSizeMake(1,12)),objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(_2b,"pathForResource:","Noir/bottom-right.png"),CPSizeMake(10,12)),])),_2d=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_2b,"pathForResource:","icon-info.png")),_2e=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_2b,"pathForResource:","icon-error.png")),_2f=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_2b,"pathForResource:","icon-warning.png"));
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_2c,_2d,_2e,_2f,objj_msgSend(CPColor,"whiteColor"),0.8],["background-color","icon-info","icon-error","icon-warning","text-color","alpha-value"]);
}
})]);
e;