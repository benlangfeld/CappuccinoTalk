@STATIC;1.0;p;14;MessageBoard.jt;200;@STATIC;1.0;i;13;TNStackView.ji;16;TNMessageBoard.ji;15;TNMessageView.jt;123;
objj_executeFile("TNStackView.j",YES);
objj_executeFile("TNMessageBoard.j",YES);
objj_executeFile("TNMessageView.j",YES);
p;16;TNMessageBoard.jt;1444;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;TNMessageView.ji;13;TNStackView.jt;1339;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("TNMessageView.j",YES);
objj_executeFile("TNStackView.j",YES);
var _1=objj_allocateClassPair(TNStackView,"TNMessageBoard"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_messageDicts"),new objj_ivar("_messageViews")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("TNMessageBoard").super_class},"initWithFrame:",_5)){
_messageDicts=objj_msgSend(CPArray,"array");
_messageViews=objj_msgSend(CPArray,"array");
objj_msgSend(_3,"setDataSource:",_messageViews);
}
return _3;
}
}),new objj_method(sel_getUid("addMessage:from:date:color:"),function(_6,_7,_8,_9,_a,_b){
with(_6){
var _c=objj_msgSend(objj_msgSend(TNMessageView,"alloc"),"initWithFrame:author:subject:message:timestamp:backgroundColor:",CPRectMake(0,0,100,100),_9,"Subject",_8,_a,_b);
objj_msgSend(_messageViews,"addObject:",_c);
objj_msgSend(_messageDicts,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_9,"author",_8,"message",_a,"date",_b,"color"));
objj_msgSend(_6,"reload");
}
}),new objj_method(sel_getUid("removeAllMessages:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_d,"removeAllViews:",_f);
}
})]);
p;15;TNMessageView.jt;3212;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;3145;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPView,"TNMessageView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_fieldAuthor"),new objj_ivar("_fieldTimestamp"),new objj_ivar("_fieldMessage"),new objj_ivar("_bgColor"),new objj_ivar("_author"),new objj_ivar("_message"),new objj_ivar("_subject"),new objj_ivar("_timestamp")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:author:subject:message:timestamp:backgroundColor:"),function(_3,_4,_5,_6,_7,_8,_9,_a){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("TNMessageView").super_class},"initWithFrame:",_5)){
_author=_6;
_subject=_7;
_message=_8;
_timestamp=_9;
_bgColor=_a;
objj_msgSend(_3,"setAutoresizingMask:",CPViewWidthSizable);
_fieldAuthor=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,10,CGRectGetWidth(_5)-10,20));
objj_msgSend(_fieldAuthor,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_fieldAuthor,"setTextColor:",objj_msgSend(CPColor,"grayColor"));
objj_msgSend(_fieldAuthor,"setAutoresizingMask:",CPViewWidthSizable);
_fieldMessage=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,30,CGRectGetWidth(_5)-20,50));
objj_msgSend(_fieldMessage,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_fieldMessage,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_fieldMessage,"setAlignment:",CPJustifiedTextAlignment);
_fieldTimestamp=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetWidth(_5)-200,10,190,20));
objj_msgSend(_fieldTimestamp,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_fieldTimestamp,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithHexString:","f2f0e4"),"text-shadow-color",CPThemeStateNormal);
objj_msgSend(_fieldTimestamp,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",9),"font",CPThemeStateNormal);
objj_msgSend(_fieldTimestamp,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"colorWithHexString:","808080"),"text-color",CPThemeStateNormal);
objj_msgSend(_fieldTimestamp,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_3,"addSubview:",_fieldAuthor);
objj_msgSend(_3,"addSubview:",_fieldMessage);
objj_msgSend(_3,"addSubview:",_fieldTimestamp);
objj_msgSend(_fieldAuthor,"setStringValue:",_author);
objj_msgSend(_fieldMessage,"setStringValue:",_message);
objj_msgSend(_fieldTimestamp,"setStringValue:",_timestamp);
objj_msgSend(_3,"setBackgroundColor:",_bgColor);
objj_msgSend(_fieldMessage,"setStringValue:",_message);
}
return _3;
}
}),new objj_method(sel_getUid("layout"),function(_b,_c){
with(_b){
var _d=objj_msgSend(_b,"frame"),_e=objj_msgSend(_message,"sizeWithFont:inWidth:",objj_msgSend(CPFont,"systemFontOfSize:",12),CGRectGetWidth(_d)).height,_f=objj_msgSend(_fieldMessage,"frame");
_f.size.height=_e+10;
_d.size.height=_f.size.height+30;
objj_msgSend(_b,"setFrame:",_d);
objj_msgSend(_fieldMessage,"setFrame:",_f);
objj_msgSend(_fieldMessage,"setSelectable:",YES);
}
})]);
p;13;TNStackView.jt;3195;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;3128;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
var _1=objj_allocateClassPair(CPView,"TNStackView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_dataSource"),new objj_ivar("_padding"),new objj_ivar("_reversed"),new objj_ivar("_stackedViews")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("dataSource"),function(_3,_4){
with(_3){
return _dataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_5,_6,_7){
with(_5){
_dataSource=_7;
}
}),new objj_method(sel_getUid("padding"),function(_8,_9){
with(_8){
return _padding;
}
}),new objj_method(sel_getUid("setPadding:"),function(_a,_b,_c){
with(_a){
_padding=_c;
}
}),new objj_method(sel_getUid("isReversed"),function(_d,_e){
with(_d){
return _reversed;
}
}),new objj_method(sel_getUid("setReversed:"),function(_f,_10,_11){
with(_f){
_reversed=_11;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_12,_13,_14){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("TNStackView").super_class},"initWithFrame:",_14)){
_dataSource=objj_msgSend(CPArray,"array");
_stackedViews=objj_msgSend(CPArray,"array");
_padding=0;
_reversed=NO;
objj_msgSend(_12,"setAutoresizingMask:",CPViewWidthSizable);
}
return _12;
}
}),new objj_method(sel_getUid("_nextPosition"),function(_15,_16){
with(_15){
var _17=objj_msgSend(_stackedViews,"lastObject"),_18;
if(_17){
_18=objj_msgSend(_17,"frame");
_18.origin.y=CPRectGetMaxY(_18)+_padding;
_18.origin.x=_padding;
}else{
_18=CGRectMake(_padding,_padding,CPRectGetWidth(objj_msgSend(_15,"bounds"))-(_padding*2),0);
}
return _18;
}
}),new objj_method(sel_getUid("reload"),function(_19,_1a){
with(_19){
var _1b=objj_msgSend(_19,"frame");
_1b.size.height=0;
objj_msgSend(_19,"setFrame:",_1b);
for(var i=0;i<objj_msgSend(_dataSource,"count");i++){
var _1c=objj_msgSend(_dataSource,"objectAtIndex:",i);
if(objj_msgSend(_1c,"superview")){
objj_msgSend(_1c,"removeFromSuperview");
}
}
objj_msgSend(_stackedViews,"removeAllObjects");
objj_msgSend(_19,"layout");
}
}),new objj_method(sel_getUid("layout"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"frame"),_20=_reversed?objj_msgSend(_dataSource,"copy").reverse():_dataSource;
_1f.size.height=0;
for(var i=0;i<objj_msgSend(_20,"count");i++){
var _21=objj_msgSend(_20,"objectAtIndex:",i),_22=objj_msgSend(_1d,"_nextPosition");
_22.size.height=objj_msgSend(_21,"frameSize").height;
objj_msgSend(_21,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_21,"setFrame:",_22);
if(objj_msgSend(_21,"respondsToSelector:",sel_getUid("layout"))){
objj_msgSend(_21,"layout");
}
objj_msgSend(_1d,"addSubview:",_21);
objj_msgSend(_stackedViews,"addObject:",_21);
_1f.size.height+=objj_msgSend(_21,"frame").size.height+_padding;
}
_1f.size.height+=_padding;
objj_msgSend(_1d,"setFrame:",_1f);
}
}),new objj_method(sel_getUid("removeAllViews:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_dataSource,"removeAllObjects");
objj_msgSend(_23,"reload");
}
}),new objj_method(sel_getUid("reverse:"),function(_26,_27,_28){
with(_26){
_reversed=!_reversed;
objj_msgSend(_26,"reload");
}
})]);
e;