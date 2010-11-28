@STATIC;1.0;p;19;StropheCappuccino.jt;1140;@STATIC;1.0;i;28;Resources/Strophe/strophe.jsi;25;Resources/Strophe/sha1.jsi;14;TNStropheJID.ji;17;TNStropheStanza.ji;16;TNStropheGroup.ji;21;TNStropheConnection.ji;18;TNStropheContact.ji;17;TNStropheRoster.ji;15;TNBase64Image.ji;10;TNPubSub.ji;22;MUC/TNStropheMUCRoom.jt;864;
objj_executeFile("Resources/Strophe/strophe.js",YES);
objj_executeFile("Resources/Strophe/sha1.js",YES);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNStropheStanza.j",YES);
objj_executeFile("TNStropheGroup.j",YES);
objj_executeFile("TNStropheConnection.j",YES);
objj_executeFile("TNStropheContact.j",YES);
objj_executeFile("TNStropheRoster.j",YES);
objj_executeFile("TNBase64Image.j",YES);
objj_executeFile("TNPubSub.j",YES);
objj_executeFile("MUC/TNStropheMUCRoom.j",YES);
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","CAPS","http://jabber.org/protocol/caps");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","DELAY","urn:xmpp:delay");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","X_DATA","jabber:x:data");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PING","urn:xmpp:ping");
p;15;TNBase64Image.jt;1776;@STATIC;1.0;I;23;Foundation/Foundation.jt;1729;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=objj_allocateClassPair(CPImage,"TNBase64Image"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_base64EncodedData"),new objj_ivar("_contentType")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_base64EncodedData"),function(_3,_4){
with(_3){
return _base64EncodedData;
}
}),new objj_method(sel_getUid("setBase64EncodedData:"),function(_5,_6,_7){
with(_5){
_base64EncodedData=_7;
}
}),new objj_method(sel_getUid("_contentType"),function(_8,_9){
with(_8){
return _contentType;
}
}),new objj_method(sel_getUid("setContentType:"),function(_a,_b,_c){
with(_a){
_contentType=_c;
}
}),new objj_method(sel_getUid("load"),function(_d,_e){
with(_d){
if(_loadStatus==CPImageLoadStatusLoading||_loadStatus==CPImageLoadStatusCompleted){
return;
}
var _f="data:"+_contentType+";base64,"+_base64EncodedData;
_loadStatus=CPImageLoadStatusLoading;
_image=new Image();
_image.addEventListener("load",function(){
objj_msgSend(_d,"_imageDidLoad");
});
_filename=_f;
_image.src=_f;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("base64ImageWithContentType:andData:"),function(_10,_11,_12,_13){
with(_10){
var img=objj_msgSend(objj_msgSend(TNBase64Image,"alloc"),"init");
objj_msgSend(img,"setBase64EncodedData:",_13);
objj_msgSend(img,"setContentType:",_12);
objj_msgSend(img,"load");
return img;
}
}),new objj_method(sel_getUid("base64ImageWithContentType:data:delegate:"),function(_14,_15,_16,_17,_18){
with(_14){
var img=objj_msgSend(objj_msgSend(TNBase64Image,"alloc"),"init");
objj_msgSend(img,"setBase64EncodedData:",_17);
objj_msgSend(img,"setContentType:",_16);
objj_msgSend(img,"setDelegate:",_18);
objj_msgSend(img,"load");
return img;
}
})]);
p;10;TNPubSub.jt;935;@STATIC;1.0;i;21;PubSub/TNPubSubNode.ji;27;PubSub/TNPubSubController.jt;859;
objj_executeFile("PubSub/TNPubSubNode.j",YES);
objj_executeFile("PubSub/TNPubSubController.j",YES);
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB","http://jabber.org/protocol/pubsub");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB_EVENT","http://jabber.org/protocol/pubsub#event");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB_OWNER","http://jabber.org/protocol/pubsub#owner");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB_NODE_CONFIG","http://jabber.org/protocol/pubsub#node_config");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB_NOTIFY","http://jabber.org/protocol/pubsub+notify");
objj_msgSend(TNStropheConnection,"addNamespaceWithName:value:","PUBSUB_SUBSCRIBE OPTIONS","http://jabber.org/protocol/pubsub#subscribe_options");
p;21;TNStropheConnection.jt;16834;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;17;TNStropheStanza.ji;25;Resources/Strophe/sha1.jsi;18;TNStropheGlobals.jt;16692;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNStropheStanza.j",YES);
objj_executeFile("Resources/Strophe/sha1.js",YES);
objj_executeFile("TNStropheGlobals.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNStropheConnection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_connected"),new objj_ivar("_features"),new objj_ivar("_clientNode"),new objj_ivar("_identityCategory"),new objj_ivar("_identityName"),new objj_ivar("_identityType"),new objj_ivar("_password"),new objj_ivar("_giveupTimeout"),new objj_ivar("_currentStatus"),new objj_ivar("_delegate"),new objj_ivar("_connectionTimeout"),new objj_ivar("_maxConnections"),new objj_ivar("_JID"),new objj_ivar("_registeredHandlerDict"),new objj_ivar("_boshService"),new objj_ivar("_connection"),new objj_ivar("_giveUpTimer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isConnected"),function(_3,_4){
with(_3){
return _connected;
}
}),new objj_method(sel_getUid("_setConnected:"),function(_5,_6,_7){
with(_5){
_connected=_7;
}
}),new objj_method(sel_getUid("_features"),function(_8,_9){
with(_8){
return _features;
}
}),new objj_method(sel_getUid("clientNode"),function(_a,_b){
with(_a){
return _clientNode;
}
}),new objj_method(sel_getUid("setClientNode:"),function(_c,_d,_e){
with(_c){
_clientNode=_e;
}
}),new objj_method(sel_getUid("identityCategory"),function(_f,_10){
with(_f){
return _identityCategory;
}
}),new objj_method(sel_getUid("setIdentityCategory:"),function(_11,_12,_13){
with(_11){
_identityCategory=_13;
}
}),new objj_method(sel_getUid("identityName"),function(_14,_15){
with(_14){
return _identityName;
}
}),new objj_method(sel_getUid("setIdentityName:"),function(_16,_17,_18){
with(_16){
_identityName=_18;
}
}),new objj_method(sel_getUid("identityType"),function(_19,_1a){
with(_19){
return _identityType;
}
}),new objj_method(sel_getUid("setIdentityType:"),function(_1b,_1c,_1d){
with(_1b){
_identityType=_1d;
}
}),new objj_method(sel_getUid("password"),function(_1e,_1f){
with(_1e){
return _password;
}
}),new objj_method(sel_getUid("setPassword:"),function(_20,_21,_22){
with(_20){
_password=_22;
}
}),new objj_method(sel_getUid("giveupTimeout"),function(_23,_24){
with(_23){
return _giveupTimeout;
}
}),new objj_method(sel_getUid("setGiveupTimeout:"),function(_25,_26,_27){
with(_25){
_giveupTimeout=_27;
}
}),new objj_method(sel_getUid("currentStatus"),function(_28,_29){
with(_28){
return _currentStatus;
}
}),new objj_method(sel_getUid("_setCurrentStatus:"),function(_2a,_2b,_2c){
with(_2a){
_currentStatus=_2c;
}
}),new objj_method(sel_getUid("delegate"),function(_2d,_2e){
with(_2d){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_2f,_30,_31){
with(_2f){
_delegate=_31;
}
}),new objj_method(sel_getUid("connectionTimeout"),function(_32,_33){
with(_32){
return _connectionTimeout;
}
}),new objj_method(sel_getUid("setConnectionTimeout:"),function(_34,_35,_36){
with(_34){
_connectionTimeout=_36;
}
}),new objj_method(sel_getUid("maxConnections"),function(_37,_38){
with(_37){
return _maxConnections;
}
}),new objj_method(sel_getUid("setMaxConnections:"),function(_39,_3a,_3b){
with(_39){
_maxConnections=_3b;
}
}),new objj_method(sel_getUid("JID"),function(_3c,_3d){
with(_3c){
return _JID;
}
}),new objj_method(sel_getUid("setJID:"),function(_3e,_3f,_40){
with(_3e){
_JID=_40;
}
}),new objj_method(sel_getUid("connection"),function(_41,_42){
with(_41){
return _connection;
}
}),new objj_method(sel_getUid("_setConnection:"),function(_43,_44,_45){
with(_43){
_connection=_45;
}
}),new objj_method(sel_getUid("initWithService:"),function(_46,_47,_48){
with(_46){
if(_46=objj_msgSendSuper({receiver:_46,super_class:objj_getClass("TNStropheConnection").super_class},"init")){
_boshService=_48;
_registeredHandlerDict=objj_msgSend(CPDictionary,"dictionary");
_connected=NO;
_maxConnections=10;
_connectionTimeout=3600;
_giveupTimeout=8;
_currentStatus=Strophe.Status.DISCONNECTED;
_connection=new Strophe.Connection(_boshService);
_clientNode="http://cappuccino.org";
_identityCategory="client";
_identityName="StropheCappuccino";
_identityType="web";
_features=[Strophe.NS.CAPS,Strophe.NS.DISCO_INFO,Strophe.NS.DISCO_ITEMS];
}
return _46;
}
}),new objj_method(sel_getUid("initWithService:JID:password:"),function(_49,_4a,_4b,_4c,_4d){
with(_49){
if(_49=objj_msgSend(_49,"initWithService:",_4b)){
_JID=_4c;
_password=_4d;
}
return _49;
}
}),new objj_method(sel_getUid("connect"),function(_4e,_4f){
with(_4e){
if(_currentStatus!==Strophe.Status.DISCONNECTED){
return;
}
objj_msgSend(_4e,"registerSelector:ofObject:withDict:",sel_getUid("_didReceivePing:"),_4e,objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","iq","name","get","type"));
_connection.connect(objj_msgSend(_JID,"full"),_password,function(_50,_51){
var _52,_53;
_currentStatus=_50;
if(_51){
_currentStatus=Strophe.Status.DISCONNECTED;
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:errorCondition:"))){
objj_msgSend(_delegate,"connection:errorCondition:",_4e,_51);
}
}else{
switch(_50){
case Strophe.Status.ERROR:
_52=sel_getUid("onStropheError:");
_53=TNStropheConnectionStatusError;
break;
case Strophe.Status.CONNECTING:
_52=sel_getUid("onStropheConnecting:");
_53=TNStropheConnectionStatusConnecting;
_giveUpTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",_giveupTimeout,function(_54){
_currentStatus=Strophe.Status.DISCONNECTED;
_giveUpTimer=nil;
_connection=nil;
_connection=new Strophe.Connection(_boshService);
if((_currentStatus===Strophe.Status.CONNECTING)&&(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:errorCondition:")))){
objj_msgSend(_delegate,"connection:errorCondition:",_4e,"Cannot connect");
}
},NO);
break;
case Strophe.Status.CONNFAIL:
_52=sel_getUid("onStropheConnectFail:");
_53=TNStropheConnectionStatusConnectionFailure;
break;
case Strophe.Status.AUTHENTICATING:
_52=sel_getUid("onStropheAuthenticating:");
_53=TNStropheConnectionStatusAuthenticating;
break;
case Strophe.Status.AUTHFAIL:
_52=sel_getUid("onStropheAuthFail:");
_53=TNStropheConnectionStatusAuthFailure;
break;
case Strophe.Status.DISCONNECTING:
_52=sel_getUid("onStropheDisconnecting:");
_53=TNStropheConnectionStatusDisconnecting;
break;
case Strophe.Status.DISCONNECTED:
_52=sel_getUid("onStropheDisconnected:");
_53=TNStropheConnectionStatusDisconnected;
_connected=NO;
break;
case Strophe.Status.CONNECTED:
_connection.send($pres().tree());
objj_msgSend(_4e,"sendCAPS");
_52=sel_getUid("onStropheConnected:");
_53=TNStropheConnectionStatusConnected;
_connected=YES;
if(_giveUpTimer){
objj_msgSend(_giveUpTimer,"invalidate");
}
break;
}
}
if(objj_msgSend(_delegate,"respondsToSelector:",_52)){
objj_msgSend(_delegate,"performSelector:withObject:",_52,_4e);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_53,_4e);
},_connectionTimeout,_maxConnections);
}
}),new objj_method(sel_getUid("disconnect"),function(_55,_56){
with(_55){
if(_currentStatus!==Strophe.Status.CONNECTED){
return;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheConnectionStatusWillDisconnect,_55);
_connection.disconnect();
}
}),new objj_method(sel_getUid("reset"),function(_57,_58){
with(_57){
if(_connection){
_connection.reset();
}
}
}),new objj_method(sel_getUid("pause"),function(_59,_5a){
with(_59){
if(_connection){
_connection.pause();
}
}
}),new objj_method(sel_getUid("resume"),function(_5b,_5c){
with(_5b){
if(_connection){
_connection.pause();
}
}
}),new objj_method(sel_getUid("flush"),function(_5d,_5e){
with(_5d){
_connection.flush();
}
}),new objj_method(sel_getUid("_didReceivePing:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_61,"containsChildrenWithName:","ping")&&objj_msgSend(objj_msgSend(_61,"firstChildWithName:","ping"),"namespace")==Strophe.NS.PING){
CPLog.debug("Ping received. Sending pong.");
objj_msgSend(_5f,"send:",objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"to":objj_msgSend(objj_msgSend(_61,"from"),"bare"),"id":objj_msgSend(_61,"ID"),"type":"result"}));
}
return YES;
}
}),new objj_method(sel_getUid("addFeature:"),function(_62,_63,_64){
with(_62){
objj_msgSend(_features,"addObject:",_64);
}
}),new objj_method(sel_getUid("removeFeature:"),function(_65,_66,_67){
with(_65){
objj_msgSend(_features,"removeObjectIdenticalTo:",_67);
}
}),new objj_method(sel_getUid("_clientVer"),function(_68,_69){
with(_68){
return SHA1.b64_sha1(_features.join());
}
}),new objj_method(sel_getUid("sendCAPS"),function(_6a,_6b){
with(_6a){
var _6c=objj_msgSend(TNStropheStanza,"presence");
objj_msgSend(_6c,"addChildWithName:andAttributes:","c",{"xmlns":Strophe.NS.CAPS,"node":_clientNode,"hash":"sha-1","ver":objj_msgSend(_6a,"_clientVer")});
objj_msgSend(_6a,"registerSelector:ofObject:withDict:",sel_getUid("handleFeaturesDisco:"),_6a,objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","iq","name","get","type",Strophe.NS.DISCO_INFO,"namespace"));
objj_msgSend(_6a,"send:",_6c);
}
}),new objj_method(sel_getUid("handleFeaturesDisco:"),function(_6d,_6e,_6f){
with(_6d){
var _70=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"id":objj_msgSend(_6d,"getUniqueId"),"type":"result"});
objj_msgSend(_70,"setTo:",objj_msgSend(_6f,"from"));
objj_msgSend(_70,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.DISCO_INFO,"node":(_clientNode+"#"+objj_msgSend(_6d,"_clientVer"))});
objj_msgSend(_70,"addChildWithName:andAttributes:","identity",{"category":_identityCategory,"name":_identityName,"type":_identityType});
objj_msgSend(_70,"up");
for(var i=0;i<objj_msgSend(_features,"count");i++){
objj_msgSend(_70,"addChildWithName:andAttributes:","feature",{"var":objj_msgSend(_features,"objectAtIndex:",i)});
objj_msgSend(_70,"up");
}
objj_msgSend(_6d,"send:",_70);
return YES;
}
}),new objj_method(sel_getUid("send:"),function(_71,_72,_73){
with(_71){
if(_currentStatus==Strophe.Status.CONNECTED){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_performSend:"),_71,_73,0,[CPDefaultRunLoopMode]);
}
}
}),new objj_method(sel_getUid("_performSend:"),function(_74,_75,_76){
with(_74){
if(_currentStatus==Strophe.Status.CONNECTED){
CPLog.trace("StropheCappuccino Stanza Send:");
CPLog.trace(_76);
_connection.send(objj_msgSend(_76,"tree"));
objj_msgSend(_74,"flush");
}
}
}),new objj_method(sel_getUid("publishPEPPayload:toNode:"),function(_77,_78,_79,_7a){
with(_77){
var uid=objj_msgSend(_77,"getUniqueId"),_7b=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"set","id":uid}),_7c=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",uid,"id");
objj_msgSend(_7b,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_7b,"addChildWithName:andAttributes:","publish",{"node":_7a});
objj_msgSend(_7b,"addChildWithName:","item");
objj_msgSend(_7b,"addNode:",_79);
objj_msgSend(_77,"registerSelector:ofObject:withDict:",sel_getUid("_didPublishPEP:"),_77,_7c);
objj_msgSend(_77,"send:",_7b);
}
}),new objj_method(sel_getUid("_didPublishPEP:"),function(_7d,_7e,_7f){
with(_7d){
if(objj_msgSend(_7f,"type")=="result"){
CPLog.debug("Publish succeeded!");
}else{
CPLog.error("Cannot publish the pubsub item in node with name: "+_nodeName);
}
return NO;
}
}),new objj_method(sel_getUid("getUniqueId"),function(_80,_81){
with(_80){
return objj_msgSend(_80,"getUniqueIdWithSuffix:",null);
}
}),new objj_method(sel_getUid("getUniqueIdWithSuffix:"),function(_82,_83,_84){
with(_82){
return _connection.getUniqueId(_84);
}
}),new objj_method(sel_getUid("registerSelector:ofObject:withDict:"),function(_85,_86,_87,_88,_89){
with(_85){
var _8a=(objj_msgSend(objj_msgSend(_89,"valueForKey:","from"),"class")==CPString)?objj_msgSend(_89,"valueForKey:","from"):objj_msgSend(objj_msgSend(_89,"valueForKey:","from"),"stringValue"),_8b=_connection.addHandler(function(_8c){
var _8d=objj_msgSend(TNStropheStanza,"stanzaWithStanza:",_8c);
CPLog.trace("StropheCappuccino stanza received that trigger selector : "+objj_msgSend(_88,"class")+"."+_87);
CPLog.trace(_8d);
return objj_msgSend(_88,"performSelector:withObject:",_87,_8d);
},objj_msgSend(_89,"valueForKey:","namespace"),objj_msgSend(_89,"valueForKey:","name"),objj_msgSend(_89,"valueForKey:","type"),objj_msgSend(_89,"valueForKey:","id"),_8a,objj_msgSend(_89,"valueForKey:","options"));
return _8b;
}
}),new objj_method(sel_getUid("registerSelector:ofObject:withDict:userInfo:"),function(_8e,_8f,_90,_91,_92,_93){
with(_8e){
var _94=(objj_msgSend(objj_msgSend(_92,"valueForKey:","from"),"class")==CPString)?objj_msgSend(_92,"valueForKey:","from"):objj_msgSend(objj_msgSend(_92,"valueForKey:","from"),"stringValue"),_95=_connection.addHandler(function(_96){
var _97=objj_msgSend(TNStropheStanza,"stanzaWithStanza:",_96);
CPLog.trace("StropheCappuccino stanza received that trigger selector : "+objj_msgSend(_91,"class")+"."+_90);
CPLog.trace(_97);
return objj_msgSend(_91,"performSelector:withObject:withObject:",_90,_97,_93);
},objj_msgSend(_92,"valueForKey:","namespace"),objj_msgSend(_92,"valueForKey:","name"),objj_msgSend(_92,"valueForKey:","type"),objj_msgSend(_92,"valueForKey:","id"),_94,objj_msgSend(_92,"valueForKey:","options"));
return _95;
}
}),new objj_method(sel_getUid("registerTimeoutSelector:ofObject:withDict:forTimeout:"),function(_98,_99,_9a,_9b,_9c,_9d){
with(_98){
var _9e=(objj_msgSend(objj_msgSend(_9c,"valueForKey:","from"),"class")==CPString)?objj_msgSend(_9c,"valueForKey:","from"):objj_msgSend(objj_msgSend(_9c,"valueForKey:","from"),"stringValue"),_9f=_connection.addTimedHandler(_9d,function(_a0){
if(!_a0){
CPLog.trace("StropheCappuccino stanza timeout that trigger selector : "+objj_msgSend(_9b,"class")+"."+_9a);
return objj_msgSend(_9b,"performSelector:",_9a);
}
return NO;
},objj_msgSend(_9c,"valueForKey:","namespace"),objj_msgSend(_9c,"valueForKey:","name"),objj_msgSend(_9c,"valueForKey:","type"),objj_msgSend(_9c,"valueForKey:","id"),_9e,objj_msgSend(_9c,"valueForKey:","options"));
return _9f;
}
}),new objj_method(sel_getUid("deleteRegisteredSelector:"),function(_a1,_a2,_a3){
with(_a1){
_connection.deleteHandler(_a3);
}
}),new objj_method(sel_getUid("deleteRegisteredTimedSelector:"),function(_a4,_a5,_a6){
with(_a4){
_connection.deleteTimedHandler(_a6);
}
}),new objj_method(sel_getUid("rawInputRegisterSelector:ofObject:"),function(_a7,_a8,_a9,_aa){
with(_a7){
_connection.xmlInput=function(_ab){
objj_msgSend(_aa,"performSelector:withObject:",_a9,objj_msgSend(TNStropheStanza,"nodeWithXMLNode:",_ab));
};
}
}),new objj_method(sel_getUid("rawOutputRegisterSelector:ofObject:"),function(_ac,_ad,_ae,_af){
with(_ac){
_connection.xmlOutput=function(_b0){
objj_msgSend(_af,"performSelector:withObject:",_ae,objj_msgSend(TNStropheStanza,"nodeWithXMLNode:",_b0));
};
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("addNamespaceWithName:value:"),function(_b1,_b2,_b3,_b4){
with(_b1){
Strophe.addNamespace(_b3,_b4);
}
}),new objj_method(sel_getUid("connectionWithService:"),function(_b5,_b6,_b7){
with(_b5){
return objj_msgSend(objj_msgSend(TNStropheConnection,"alloc"),"initWithService:",_b7);
}
}),new objj_method(sel_getUid("connectionWithService:JID:password:"),function(_b8,_b9,_ba,_bb,_bc){
with(_b8){
return objj_msgSend(objj_msgSend(TNStropheConnection,"alloc"),"initWithService:JID:password:",_ba,_bb,_bc);
}
})]);
var _1=objj_getClass("TNStropheConnection");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"TNStropheConnection\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_bd,_be,_bf){
with(_bd){
_bd=objj_msgSendSuper({receiver:_bd,super_class:objj_getClass("TNStropheConnection").super_class},"initWithCoder:",_bf);
if(_bd){
_JID=objj_msgSend(_bf,"decodeObjectForKey:","_JID");
_password=objj_msgSend(_bf,"decodeObjectForKey:","_password");
_delegate=objj_msgSend(_bf,"decodeObjectForKey:","_delegate");
_boshService=objj_msgSend(_bf,"decodeObjectForKey:","_boshService");
_connection=objj_msgSend(_bf,"decodeObjectForKey:","_connection");
_audioTagReceive=objj_msgSend(_bf,"decodeObjectForKey:","_audioTagReceive");
}
return _bd;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c0,_c1,_c2){
with(_c0){
objj_msgSend(_c2,"encodeObject:forKey:",_JID,"_JID");
objj_msgSend(_c2,"encodeObject:forKey:",_password,"_password");
objj_msgSend(_c2,"encodeObject:forKey:",_boshService,"_boshService");
objj_msgSend(_c2,"encodeObject:forKey:",_connection,"_connection");
objj_msgSend(_c2,"encodeObject:forKey:",_registeredHandlerDict,"_registeredHandlerDict");
objj_msgSend(_c2,"encodeObject:forKey:",_audioTagReceive,"_audioTagReceive");
}
})]);
p;18;TNStropheContact.jt;19826;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;16;TNStropheGroup.ji;21;TNStropheConnection.ji;15;TNBase64Image.ji;18;TNStropheGlobals.jt;19669;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNStropheGroup.j",YES);
objj_executeFile("TNStropheConnection.j",YES);
objj_executeFile("TNBase64Image.j",YES);
objj_executeFile("TNStropheGlobals.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNStropheContact"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_messagesQueue"),new objj_ivar("_resources"),new objj_ivar("_statusIcon"),new objj_ivar("_numberOfEvents"),new objj_ivar("_JID"),new objj_ivar("_groupName"),new objj_ivar("_nickname"),new objj_ivar("_nodeName"),new objj_ivar("_type"),new objj_ivar("_vCard"),new objj_ivar("_XMPPShow"),new objj_ivar("_XMPPStatus"),new objj_ivar("_subscription"),new objj_ivar("_avatar"),new objj_ivar("_connection"),new objj_ivar("_isComposing"),new objj_ivar("_askingVCard"),new objj_ivar("_imageAway"),new objj_ivar("_imageNewError"),new objj_ivar("_imageNewMessage"),new objj_ivar("_imageOffline"),new objj_ivar("_imageOnline"),new objj_ivar("_statusReminder")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("messagesQueue"),function(_3,_4){
with(_3){
return _messagesQueue;
}
}),new objj_method(sel_getUid("setMessagesQueue:"),function(_5,_6,_7){
with(_5){
_messagesQueue=_7;
}
}),new objj_method(sel_getUid("resources"),function(_8,_9){
with(_8){
return _resources;
}
}),new objj_method(sel_getUid("setResources:"),function(_a,_b,_c){
with(_a){
_resources=_c;
}
}),new objj_method(sel_getUid("statusIcon"),function(_d,_e){
with(_d){
return _statusIcon;
}
}),new objj_method(sel_getUid("setStatusIcon:"),function(_f,_10,_11){
with(_f){
_statusIcon=_11;
}
}),new objj_method(sel_getUid("numberOfEvents"),function(_12,_13){
with(_12){
return _numberOfEvents;
}
}),new objj_method(sel_getUid("setNumberOfEvents:"),function(_14,_15,_16){
with(_14){
_numberOfEvents=_16;
}
}),new objj_method(sel_getUid("JID"),function(_17,_18){
with(_17){
return _JID;
}
}),new objj_method(sel_getUid("setJID:"),function(_19,_1a,_1b){
with(_19){
_JID=_1b;
}
}),new objj_method(sel_getUid("groupName"),function(_1c,_1d){
with(_1c){
return _groupName;
}
}),new objj_method(sel_getUid("setGroupName:"),function(_1e,_1f,_20){
with(_1e){
_groupName=_20;
}
}),new objj_method(sel_getUid("nickname"),function(_21,_22){
with(_21){
return _nickname;
}
}),new objj_method(sel_getUid("setNickname:"),function(_23,_24,_25){
with(_23){
_nickname=_25;
}
}),new objj_method(sel_getUid("nodeName"),function(_26,_27){
with(_26){
return _nodeName;
}
}),new objj_method(sel_getUid("setNodeName:"),function(_28,_29,_2a){
with(_28){
_nodeName=_2a;
}
}),new objj_method(sel_getUid("type"),function(_2b,_2c){
with(_2b){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_2d,_2e,_2f){
with(_2d){
_type=_2f;
}
}),new objj_method(sel_getUid("vCard"),function(_30,_31){
with(_30){
return _vCard;
}
}),new objj_method(sel_getUid("setVCard:"),function(_32,_33,_34){
with(_32){
_vCard=_34;
}
}),new objj_method(sel_getUid("XMPPShow"),function(_35,_36){
with(_35){
return _XMPPShow;
}
}),new objj_method(sel_getUid("setXMPPShow:"),function(_37,_38,_39){
with(_37){
_XMPPShow=_39;
}
}),new objj_method(sel_getUid("XMPPStatus"),function(_3a,_3b){
with(_3a){
return _XMPPStatus;
}
}),new objj_method(sel_getUid("setXMPPStatus:"),function(_3c,_3d,_3e){
with(_3c){
_XMPPStatus=_3e;
}
}),new objj_method(sel_getUid("subscription"),function(_3f,_40){
with(_3f){
return _subscription;
}
}),new objj_method(sel_getUid("setSubscription:"),function(_41,_42,_43){
with(_41){
_subscription=_43;
}
}),new objj_method(sel_getUid("avatar"),function(_44,_45){
with(_44){
return _avatar;
}
}),new objj_method(sel_getUid("setAvatar:"),function(_46,_47,_48){
with(_46){
_avatar=_48;
}
}),new objj_method(sel_getUid("connection"),function(_49,_4a){
with(_49){
return _connection;
}
}),new objj_method(sel_getUid("setConnection:"),function(_4b,_4c,_4d){
with(_4b){
_connection=_4d;
}
}),new objj_method(sel_getUid("initWithConnection:JID:groupName:"),function(_4e,_4f,_50,_51,_52){
with(_4e){
if(_4e=objj_msgSendSuper({receiver:_4e,super_class:objj_getClass("TNStropheContact").super_class},"init")){
var _53=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_4e,"class"));
_imageOffline=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Offline.png"));
_imageOnline=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Available.png"));
_imageBusy=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Away.png"));
_imageAway=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Idle.png"));
_imageDND=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Blocked.png"));
_imageNewMessage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","NewMessage.png"));
_imageNewError=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(_53,"pathForResource:","Error.png"));
_type="contact";
_statusIcon=_imageOffline;
_XMPPShow=TNStropheContactStatusOffline;
_connection=_50;
_messagesQueue=objj_msgSend(CPArray,"array");
_numberOfEvents=0;
_isComposing=NO;
_askingVCard=NO;
_resources=objj_msgSend(CPArray,"array");
_JID=_51;
_groupName=_52;
}
return _4e;
}
}),new objj_method(sel_getUid("_didReceivePresence:"),function(_54,_55,_56){
with(_54){
var _57=objj_msgSend(_56,"fromResource"),_58=objj_msgSend(_56,"firstChildWithName:","status");
objj_msgSend(_JID,"setResource:",objj_msgSend(objj_msgSend(_56,"from"),"resource"));
if(objj_msgSend(_JID,"resource")&&(objj_msgSend(_JID,"resource")!="")&&!objj_msgSend(_resources,"containsObject:",_57)){
objj_msgSend(_resources,"addObject:",_57);
}
switch(objj_msgSend(_56,"type")){
case "error":
var _59=objj_msgSend(objj_msgSend(_56,"firstChildWithName:","error"),"valueForAttribute:","code");
_XMPPShow=TNStropheContactStatusOffline;
_XMPPStatus="Error code: "+_59;
_statusIcon=_imageNewError;
_statusReminder=_imageNewError;
return NO;
case "unavailable":
objj_msgSend(_resources,"removeObject:",_57);
CPLogConsole("contact become unavailable from resource: "+_57+". Resources left : "+_resources);
if(objj_msgSend(_resources,"count")==0){
_XMPPShow=TNStropheContactStatusOffline;
_statusIcon=_imageOffline;
_statusReminder=_imageOffline;
if(_58){
_XMPPStatus=objj_msgSend(_58,"text");
}
}
break;
case "subscribe":
_XMPPStatus="Asking subscribtion";
break;
case "subscribed":
break;
case "unsubscribe":
break;
case "unsubscribed":
_XMPPStatus="Unauthorized";
break;
default:
_XMPPShow=TNStropheContactStatusOnline;
_statusReminder=_imageOnline;
_statusIcon=_imageOnline;
if(objj_msgSend(_56,"firstChildWithName:","show")){
_XMPPShow=objj_msgSend(objj_msgSend(_56,"firstChildWithName:","show"),"text");
switch(_XMPPShow){
case TNStropheContactStatusBusy:
_statusIcon=_imageBusy;
_statusReminder=_imageBusy;
break;
case TNStropheContactStatusAway:
_statusIcon=_imageAway;
_statusReminder=_imageAway;
break;
case TNStropheContactStatusDND:
_statusIcon=_imageDND;
_statusReminder=_imageDND;
break;
}
}
if(_numberOfEvents>0){
_statusIcon=_imageNewMessage;
}
if(_58){
_XMPPStatus=objj_msgSend(_58,"text");
}
if(objj_msgSend(_56,"firstChildWithName:","x")&&objj_msgSend(objj_msgSend(_56,"firstChildWithName:","x"),"valueForAttribute:","xmlns")=="vcard-temp:x:update"){
objj_msgSend(_54,"getVCard");
}
if(!_vCard&&!_askingVCard){
objj_msgSend(_54,"getVCard");
}
break;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactPresenceUpdatedNotification,_54);
return YES;
}
}),new objj_method(sel_getUid("sendStatus:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(TNStropheStanza,"messageTo:withAttributes:",_JID,{"type":"chat"});
objj_msgSend(_5d,"addChildWithName:andAttributes:",_5c,{"xmlns":"http://jabber.org/protocol/chatstates"});
objj_msgSend(_5a,"sendStanza:andRegisterSelector:ofObject:",_5d,sel_getUid("_didSendMessage:"),_5a);
}
}),new objj_method(sel_getUid("sendComposing"),function(_5e,_5f){
with(_5e){
if(!_isComposing){
objj_msgSend(_5e,"sendStatus:","composing");
_isComposing=YES;
}
}
}),new objj_method(sel_getUid("sendComposePaused"),function(_60,_61){
with(_60){
objj_msgSend(_60,"sendStatus:","paused");
_isComposing=NO;
}
}),new objj_method(sel_getUid("subscribe"),function(_62,_63){
with(_62){
objj_msgSend(_connection,"send:",objj_msgSend(TNStropheStanza,"presenceTo:withAttributes:bare:",_JID,{"type":"subscribed"},YES));
}
}),new objj_method(sel_getUid("unsubscribe"),function(_64,_65){
with(_64){
objj_msgSend(_connection,"send:",objj_msgSend(TNStropheStanza,"presenceTo:WwthAttributes:bare:",_JID,{"type":"unsubscribed"},YES));
}
}),new objj_method(sel_getUid("askSubscription"),function(_66,_67){
with(_66){
objj_msgSend(_connection,"send:",objj_msgSend(TNStropheStanza,"presenceTo:withAttributes:bare:",_JID,{"type":"subscribe"},YES));
}
}),new objj_method(sel_getUid("setSubscription:"),function(_68,_69,_6a){
with(_68){
_subcription=_6a;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactSubscriptionUpdatedNotification,_68);
}
}),new objj_method(sel_getUid("description"),function(_6b,_6c){
with(_6b){
return _nickname;
}
}),new objj_method(sel_getUid("getVCard"),function(_6d,_6e){
with(_6d){
var uid=objj_msgSend(_connection,"getUniqueId"),_6f=objj_msgSend(TNStropheStanza,"iqTo:withAttributes:bare:",_JID,{"type":"get","id":uid},YES),_70=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_6f,"addChildWithName:andAttributes:","vCard",{"xmlns":"vcard-temp"});
_askingVCard=YES;
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceiveVCard:"),_6d,_70);
objj_msgSend(_connection,"send:",_6f);
}
}),new objj_method(sel_getUid("_didReceiveVCard:"),function(_71,_72,_73){
with(_71){
var _74=objj_msgSend(_73,"firstChildWithName:","vCard");
_askingVCard=NO;
if(_74){
_vCard=_74;
if(!_nickname||(_nickname==objj_msgSend(_JID,"node"))){
if(objj_msgSend(_74,"firstChildWithName:","NAME")){
_nickname=objj_msgSend(objj_msgSend(_74,"firstChildWithName:","NAME"),"text");
}else{
_nickname=objj_msgSend(_JID,"node");
}
}
var _75;
if(_75=objj_msgSend(_74,"firstChildWithName:","PHOTO")){
var _76=objj_msgSend(objj_msgSend(_75,"firstChildWithName:","TYPE"),"text"),_77=objj_msgSend(objj_msgSend(_75,"firstChildWithName:","BINVAL"),"text");
_avatar=objj_msgSend(TNBase64Image,"base64ImageWithContentType:data:delegate:",_76,_77,_71);
}else{
_avatar=nil;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactVCardReceivedNotification,_71);
}
}
return YES;
}
}),new objj_method(sel_getUid("changeNickname:"),function(_78,_79,_7a){
with(_78){
_nickname=_7a;
var _7b=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"set"});
objj_msgSend(_7b,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.ROSTER});
objj_msgSend(_7b,"addChildWithName:andAttributes:","item",{"JID":objj_msgSend(_JID,"bare"),"name":_nickname});
objj_msgSend(_7b,"addChildWithName:andAttributes:","group",nil);
objj_msgSend(_7b,"addTextNode:",_groupName);
objj_msgSend(_connection,"send:",_7b);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactNicknameUpdatedNotification,_78);
}
}),new objj_method(sel_getUid("changeGroup:"),function(_7c,_7d,_7e){
with(_7c){
objj_msgSend(_7c,"changeGroupName:",objj_msgSend(_7e,"name"));
}
}),new objj_method(sel_getUid("changeGroupName:"),function(_7f,_80,_81){
with(_7f){
var _82=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"set"});
objj_msgSend(_82,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.ROSTER});
objj_msgSend(_82,"addChildWithName:andAttributes:","item",{"JID":objj_msgSend(_JID,"bare"),"name":_nickname});
objj_msgSend(_82,"addChildWithName:andAttributes:","group",nil);
objj_msgSend(_82,"addTextNode:",_81);
objj_msgSend(_connection,"send:",_82);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactGroupUpdatedNotification,_7f);
}
}),new objj_method(sel_getUid("sendStanza:"),function(_83,_84,_85){
with(_83){
objj_msgSend(_83,"sendStanza:withUserInfo:",_85,nil);
}
}),new objj_method(sel_getUid("sendStanza:withUserInfo:"),function(_86,_87,_88,_89){
with(_86){
objj_msgSend(_88,"setTo:",_JID);
objj_msgSend(_connection,"send:",_88);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheContactStanzaSentNotification,_86,_89);
}
}),new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:"),function(_8a,_8b,_8c,_8d,_8e,_8f,_90){
with(_8a){
var _91=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_8f,"id"),_92=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_8c,"stanza",_8f,"id"),ret;
objj_msgSend(_8c,"setID:",_8f);
if(_8d&&!_90){
ret=objj_msgSend(_connection,"registerSelector:ofObject:withDict:",_8d,_8e,_91);
}else{
if(_8d&&_90){
ret=objj_msgSend(_connection,"registerSelector:ofObject:withDict:userInfo:",_8d,_8e,_91,_90);
}
}
objj_msgSend(_8a,"sendStanza:withUserInfo:",_8c,_92);
return ret;
}
}),new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:"),function(_93,_94,_95,_96,_97){
with(_93){
return objj_msgSend(_93,"sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:",_95,_96,_97,objj_msgSend(_connection,"getUniqueId"),nil);
}
}),new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:withSpecificID:"),function(_98,_99,_9a,_9b,_9c,_9d){
with(_98){
return objj_msgSend(_98,"sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:",_9a,_9b,_9c,_9d,nil);
}
}),new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:userInfo:"),function(_9e,_9f,_a0,_a1,_a2,_a3){
with(_9e){
return objj_msgSend(_9e,"sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:",_a0,_a1,_a2,objj_msgSend(_connection,"getUniqueId"),_a3);
}
}),new objj_method(sel_getUid("getMessages"),function(_a4,_a5){
with(_a4){
var _a6=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","message","name",objj_msgSend(_JID,"bare"),"from",{matchBare:true},"options");
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceiveMessage:"),_a4,_a6);
}
}),new objj_method(sel_getUid("_didReceiveMessage:"),function(_a7,_a8,_a9){
with(_a7){
var _aa=objj_msgSend(CPNotificationCenter,"defaultCenter"),_ab=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_a9,"stanza",objj_msgSend(CPDate,"date"),"date");
if(objj_msgSend(_a9,"containsChildrenWithName:","composing")){
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessageComposing,_a7,_ab);
}
if(objj_msgSend(_a9,"containsChildrenWithName:","paused")){
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessagePaused,_a7,_ab);
}
if(objj_msgSend(_a9,"containsChildrenWithName:","active")){
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessageActive,_a7,_ab);
}
if(objj_msgSend(_a9,"containsChildrenWithName:","inactive")){
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessageInactive,_a7,_ab);
}
if(objj_msgSend(_a9,"containsChildrenWithName:","gone")){
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessageGone,_a7,_ab);
}
if(objj_msgSend(_a9,"containsChildrenWithName:","body")){
_statusIcon=_imageNewMessage;
objj_msgSend(_messagesQueue,"addObject:",_a9);
_numberOfEvents++;
objj_msgSend(_aa,"postNotificationName:object:userInfo:",TNStropheContactMessageReceivedNotification,_a7,_ab);
}
return YES;
}
}),new objj_method(sel_getUid("sendMessage:"),function(_ac,_ad,_ae){
with(_ac){
objj_msgSend(_ac,"sendMessage:withType:",_ae,"chat");
}
}),new objj_method(sel_getUid("sendMessage:withType:"),function(_af,_b0,_b1,_b2){
with(_af){
var _b3=objj_msgSend(TNStropheStanza,"messageWithAttributes:",{"type":_b2});
objj_msgSend(_b3,"addChildWithName:","body");
objj_msgSend(_b3,"addTextNode:",_b1);
objj_msgSend(_af,"sendStanza:",_b3);
}
}),new objj_method(sel_getUid("popMessagesQueue"),function(_b4,_b5){
with(_b4){
if(objj_msgSend(_messagesQueue,"count")==0){
return Nil;
}
var _b6=objj_msgSend(_messagesQueue,"objectAtIndex:",0);
_numberOfEvents--;
if(_numberOfEvents===0){
_statusIcon=_statusReminder;
}
objj_msgSend(_messagesQueue,"removeObjectAtIndex:",0);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactMessageTreatedNotification,_b4);
return _b6;
}
}),new objj_method(sel_getUid("freeMessagesQueue"),function(_b7,_b8){
with(_b7){
_numberOfEvents=0;
_statusIcon=_statusReminder;
objj_msgSend(_messagesQueue,"removeAllObjects");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactMessageTreatedNotification,_b7);
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_b9,_ba,_bb){
with(_b9){
objj_msgSend(_bb,"setDelegate:",nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactVCardReceivedNotification,_b9);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("contactWithConnection:JID:groupName:"),function(_bc,_bd,_be,_bf,_c0){
with(_bc){
return objj_msgSend(objj_msgSend(TNStropheContact,"alloc"),"initWithConnection:JID:groupName:",_be,_bf,_c0);
}
})]);
var _1=objj_getClass("TNStropheContact");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"TNStropheContact\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_c1,_c2,_c3){
with(_c1){
_c1=objj_msgSendSuper({receiver:_c1,super_class:objj_getClass("TNStropheContact").super_class},"initWithCoder:",_c3);
if(_c1){
_JID=objj_msgSend(_c3,"decodeObjectForKey:","_JID");
_nodeName=objj_msgSend(_c3,"decodeObjectForKey:","_nodeName");
_groupName=objj_msgSend(_c3,"decodeObjectForKey:","_groupName");
_nickname=objj_msgSend(_c3,"decodeObjectForKey:","_nickname");
_XMPPStatus=objj_msgSend(_c3,"decodeObjectForKey:","_XMPPStatus");
_resources=objj_msgSend(_c3,"decodeObjectForKey:","_resources");
_XMPPShow=objj_msgSend(_c3,"decodeObjectForKey:","_XMPPShow");
_statusIcon=objj_msgSend(_c3,"decodeObjectForKey:","_statusIcon");
_type=objj_msgSend(_c3,"decodeObjectForKey:","_type");
_vCard=objj_msgSend(_c3,"decodeObjectForKey:","_vCard");
_messageQueue=objj_msgSend(_c3,"decodeObjectForKey:","_messagesQueue");
_numberOfEvents=objj_msgSend(_c3,"decodeObjectForKey:","_numberOfEvents");
}
return _c1;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_c4,_c5,_c6){
with(_c4){
objj_msgSend(_c6,"encodeObject:forKey:",_JID,"_JID");
objj_msgSend(_c6,"encodeObject:forKey:",_nodeName,"_nodeName");
objj_msgSend(_c6,"encodeObject:forKey:",_groupName,"_groupName");
objj_msgSend(_c6,"encodeObject:forKey:",_nickname,"_nickname");
objj_msgSend(_c6,"encodeObject:forKey:",_XMPPStatus,"_XMPPStatus");
objj_msgSend(_c6,"encodeObject:forKey:",_XMPPShow,"_XMPPShow");
objj_msgSend(_c6,"encodeObject:forKey:",_type,"_type");
objj_msgSend(_c6,"encodeObject:forKey:",_statusIcon,"_statusIcon");
objj_msgSend(_c6,"encodeObject:forKey:",_messagesQueue,"_messagesQueue");
objj_msgSend(_c6,"encodeObject:forKey:",_numberOfEvents,"_numberOfEvents");
if(_resources){
objj_msgSend(_c6,"encodeObject:forKey:",_resources,"_resources");
}
if(_vCard){
objj_msgSend(_c6,"encodeObject:forKey:",_vCard,"_vCard");
}
}
})]);
p;18;TNStropheGlobals.jt;5590;@STATIC;1.0;t;5571;
TNStropheConnectionStatusConnecting="TNStropheConnectionStatusConnecting";
TNStropheConnectionStatusConnected="TNStropheConnectionStatusConnected";
TNStropheConnectionStatusConnectionFailure="TNStropheConnectionStatusConnectionFailure";
TNStropheConnectionStatusAuthenticating="TNStropheConnectionStatusAuthenticating";
TNStropheConnectionStatusAuthFailure="TNStropheConnectionStatusAuthFailure";
TNStropheConnectionStatusWillDisconnect="TNStropheConnectionStatusWillDisconnect";
TNStropheConnectionStatusDisconnecting="TNStropheConnectionStatusDisconnecting";
TNStropheConnectionStatusDisconnected="TNStropheConnectionStatusDisconnected";
TNStropheConnectionStatusError="TNStropheConnectionStatusError";
TNStropheContactStatusAway="away";
TNStropheContactStatusBusy="xa";
TNStropheContactStatusDND="dnd";
TNStropheContactStatusOffline="offline";
TNStropheContactStatusOnline="online";
TNStropheContactNicknameUpdatedNotification="TNStropheContactNicknameUpdatedNotification";
TNStropheContactGroupUpdatedNotification="TNStropheContactGroupUpdatedNotification";
TNStropheContactPresenceUpdatedNotification="TNStropheContactPresenceUpdatedNotification";
TNStropheContactSubscriptionUpdatedNotification="TNStropheContactSubscriptionUpdatedNotification";
TNStropheContactVCardReceivedNotification="TNStropheContactVCardReceivedNotification";
TNStropheContactMessageReceivedNotification="TNStropheContactMessageReceivedNotification";
TNStropheContactMessageTreatedNotification="TNStropheContactMessageTreatedNotification";
TNStropheContactMessageSentNotification="TNStropheContactMessageSentNotification";
TNStropheContactStanzaSentNotification="TNStropheContactStanzaSentNotification";
TNStropheContactMessageComposing="TNStropheContactMessageComposing";
TNStropheContactMessagePaused="TNStropheContactMessagePaused";
TNStropheContactMessageActive="TNStropheContactMessageActive";
TNStropheContactMessageInactive="TNStropheContactMessageInactive";
TNStropheContactMessageGone="TNStropheContactMessageGone";
TNStropheRosterRetrievedNotification="TNStropheRosterRetrievedNotification";
TNStropheRosterAddedContactNotification="TNStropheRosterAddedContactNotification";
TNStropheRosterRemovedContactNotification="TNStropheRosterRemovedContactNotification";
TNStropheRosterAddedGroupNotification="TNStropheRosterAddedGroupNotification";
TNStropheRosterRemovedGroupNotification="TNStropheRosterRemovedGroupNotification";
TNStropheGroupRenamedNotification="TNStropheGroupRenamed";
TNStropheGroupRemovedNotification="TNStropheGroupRemoved";
TNStrophePubSubVarTitle="pubsub#title";
TNStrophePubSubVarDeliverNotification="pubsub#deliver_notifications";
TNStrophePubSubVarDeliverPayloads="pubsub#deliver_payloads";
TNStrophePubSubVarPersistItems="pubsub#persist_items";
TNStrophePubSubVarMaxItems="pubsub#max_items";
TNStrophePubSubVarItemExpire="pubsub#item_expire";
TNStrophePubSubVarAccessModel="pubsub#access_model";
TNStrophePubSubVarRosterGroupAllowed="pubsub#roster_groups_allowed";
TNStrophePubSubVarPublishModel="pubsub#publish_model";
TNStrophePubSubVarPurgeOffline="pubsub#purge_offline";
TNStrophePubSubVarSendLastPublishedItem="pubsub#send_last_published_item";
TNStrophePubSubVarPresenceBasedDelivery="pubsub#presence_based_delivery";
TNStrophePubSubVarNotificationType="pubsub#notification_type";
TNStrophePubSubVarNotifyConfig="pubsub#notify_config";
TNStrophePubSubVarNotifyDelete="pubsub#notify_delete";
TNStrophePubSubVarNotifyRectract="pubsub#notify_retract";
TNStrophePubSubVarNotifySub="pubsub#notify_sub";
TNStrophePubSubVarMaxPayloadSize="pubsub#max_payload_size";
TNStrophePubSubVarType="pubsub#type";
TNStrophePubSubVarBodyXSLT="pubsub#body_xslt";
TNStrophePubSubVarAccessModelOpen="open";
TNStrophePubSubVarAccessModelRoster="roster";
TNStrophePubSubVarAccessModelAuthorize="authorize";
TNStrophePubSubVarAccessModelWhitelist="whitelist";
TNStrophePubSubNodeRetrievedNotification="TNStrophePubSubNodeRetrievedNotification";
TNStrophePubSubNodeCreatedNotification="TNStrophePubSubNodeCreatedNotification";
TNStrophePubSubNodeDeletedNotification="TNStrophePubSubNodeDeletedNotification";
TNStrophePubSubNodeConfiguredNotification="TNStrophePubSubNodeConfiguredNotification";
TNStrophePubSubItemPublishedNotification="TNStrophePubSubItemPublishedNotification";
TNStrophePubSubItemRetractedNotification="TNStrophePubSubItemRetractedNotification";
TNStrophePubSubNodeSubscribedNotification="TNStrophePubSubNodeSubscribedNotification";
TNStrophePubSubNodeUnsubscribedNotification="TNStrophePubSubNodeUnsubscribedNotification";
TNStrophePubSubNodeEventNotification="TNStrophePubSubNodeEventNotification";
TNStrophePubSubSubscriptionsRetrievedNotification="TNStrophePubSubSubscriptionsReceivedNotification";
TNStrophePubSubNoOldSubscriptionsLeftNotification="TNStrophePubSubNoOldSubscriptionsLeft";
TNStrophePubSubBatchSubscribeComplete="TNStrophePubSubBatchSubscribeComplete";
TNStrophePubSubBatchUnsubscribeComplete="TNStrophePubSubBatchUnsubscribeComplete";
TNStropheMUCRosterWasUpdatedNotification="TNStropheMUCRosterWasUpdatedNotification";
TNStropheMUCConversationWasUpdatedNotification="TNStropheMUCConversationWasUpdatedNotification";
TNStropheMUCSubjectWasUpdatedNotification="TNStropheMUCSubjectWasUpdatedNotification";
TNStropheMUCDataReceivedNotification="TNStropheMUCDataReceivedNotification";
TNStropheMUCPrivateMessageWasReceivedNotification="TNStropheMUCPrivateMessageWasReceivedNotification";
TNStropheMUCContactJoinedNotification="TNStropheMUCContactJoinedNotification";
TNStropheMUCContactLeftNotification="TNStropheMUCContactLeftNotification";
p;16;TNStropheGroup.jt;2823;@STATIC;1.0;I;23;Foundation/Foundation.ji;18;TNStropheGlobals.jt;2753;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheGlobals.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNStropheGroup"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contacts"),new objj_ivar("_name")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("contacts"),function(_3,_4){
with(_3){
return _contacts;
}
}),new objj_method(sel_getUid("_setContacts:"),function(_5,_6,_7){
with(_5){
_contacts=_7;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_a,_b,_c){
with(_a){
_name=_c;
}
}),new objj_method(sel_getUid("initWithName:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("TNStropheGroup").super_class},"init")){
_contacts=objj_msgSend(CPArray,"array");
_name=_f;
}
return _d;
}
}),new objj_method(sel_getUid("description"),function(_10,_11){
with(_10){
return _name;
}
}),new objj_method(sel_getUid("changeName:"),function(_12,_13,_14){
with(_12){
_name=_14;
for(var i=0;i<objj_msgSend(_12,"count");i++){
objj_msgSend(objj_msgSend(_contacts,"objectAtIndex:",i),"changeGroupName:",_14);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheGroupRenamedNotification,_12);
}
}),new objj_method(sel_getUid("addContact:"),function(_15,_16,_17){
with(_15){
if(objj_msgSend(_17,"class")!=TNStropheContact){
objj_msgSend(CPException,"raise:reason:","Invalid Object","You can only add TNStropheContacts");
}
objj_msgSend(_contacts,"addObject:",_17);
}
}),new objj_method(sel_getUid("removeContact:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_contacts,"removeObject:",_1a);
}
}),new objj_method(sel_getUid("count"),function(_1b,_1c){
with(_1b){
return objj_msgSend(_contacts,"count");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("stropheGroupWithName:"),function(_1d,_1e,_1f){
with(_1d){
return objj_msgSend(objj_msgSend(TNStropheGroup,"alloc"),"initWithName:",_1f);
}
})]);
var _1=objj_getClass("TNStropheGroup");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"TNStropheGroup\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_20,_21,_22){
with(_20){
_20=objj_msgSendSuper({receiver:_20,super_class:objj_getClass("TNStropheGroup").super_class},"initWithCoder:",_22);
if(_20){
_contacts=objj_msgSend(_22,"decodeObjectForKey:","_contacts");
_name=objj_msgSend(_22,"decodeObjectForKey:","_name");
}
return _20;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_25,"encodeObject:forKey:",_contacts,"_contacts");
objj_msgSend(_25,"encodeObject:forKey:",_name,"_name");
}
})]);
p;14;TNStropheJID.jt;5465;@STATIC;1.0;I;23;Foundation/Foundation.jt;5418;
objj_executeFile("Foundation/Foundation.j",NO);
TNStropheJIDExceptionJID="TNStropheJIDExceptionJID";
var _1=objj_allocateClassPair(CPObject,"TNStropheJID"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_node"),new objj_ivar("_domain"),new objj_ivar("_resource"),new objj_ivar("_isServer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("node"),function(_3,_4){
with(_3){
return _node;
}
}),new objj_method(sel_getUid("setNode:"),function(_5,_6,_7){
with(_5){
_node=_7;
}
}),new objj_method(sel_getUid("domain"),function(_8,_9){
with(_8){
return _domain;
}
}),new objj_method(sel_getUid("setDomain:"),function(_a,_b,_c){
with(_a){
_domain=_c;
}
}),new objj_method(sel_getUid("resource"),function(_d,_e){
with(_d){
return _resource;
}
}),new objj_method(sel_getUid("setResource:"),function(_f,_10,_11){
with(_f){
_resource=_11;
}
}),new objj_method(sel_getUid("isServer"),function(_12,_13){
with(_12){
return _isServer;
}
}),new objj_method(sel_getUid("_setIsServer:"),function(_14,_15,_16){
with(_14){
_isServer=_16;
}
}),new objj_method(sel_getUid("initWithNode:domain:resource:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("TNStropheJID").super_class},"init")){
_node=_19;
_domain=_1a;
_resource=_1b;
_isServer=(!_1a&&!_1b);
}
return _17;
}
}),new objj_method(sel_getUid("initWithNode:domain:"),function(_1c,_1d,_1e,_1f){
with(_1c){
return objj_msgSend(_1c,"initWithNode:domain:resource:",_1e,_1f,nil);
}
}),new objj_method(sel_getUid("initWithString:"),function(_20,_21,_22){
with(_20){
var _23=_22.split("@")[0],_24,_25;
if(_22.indexOf("@")!=-1){
_24=_22.split("@")[1].split("/")[0],_25=_22.split("/")[1];
}
if(!_23){
objj_msgSend(CPException,"raise:reason:",TNStropheJIDExceptionJID,_22+" is not a valid JID");
}
return objj_msgSend(_20,"initWithNode:domain:resource:",_23,_24,_25);
}
}),new objj_method(sel_getUid("bare"),function(_26,_27){
with(_26){
if(_domain){
return _node+"@"+_domain;
}else{
return _node;
}
}
}),new objj_method(sel_getUid("setBare:"),function(_28,_29,_2a){
with(_28){
var _2b=_2a.split("@")[0],_2c=_2a.split("@")[1].split("/")[0];
if(!_2b||!_2c){
objj_msgSend(CPException,"raise:reason:",TNStropheJIDExceptionJID,_2a+" is not a valid JID");
}
_node=_2b;
_domain=_2c;
}
}),new objj_method(sel_getUid("full"),function(_2d,_2e){
with(_2d){
if(_resource){
return objj_msgSend(_2d,"bare")+"/"+_resource;
}else{
return objj_msgSend(_2d,"bare");
}
}
}),new objj_method(sel_getUid("setFull:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"setBare:",_31);
var _32=_31.split("/")[1];
if(!_32){
objj_msgSend(CPException,"raise:reason:",TNStropheJIDExceptionJID,_31+" is not a valid JID");
}
_resource=_32;
}
}),new objj_method(sel_getUid("description"),function(_33,_34){
with(_33){
return objj_msgSend(_33,"stringValue");
}
}),new objj_method(sel_getUid("stringValue"),function(_35,_36){
with(_35){
return objj_msgSend(_35,"full");
}
}),new objj_method(sel_getUid("uppercaseString"),function(_37,_38){
with(_37){
return objj_msgSend(objj_msgSend(_37,"stringValue"),"uppercaseString");
}
}),new objj_method(sel_getUid("lowercaseString"),function(_39,_3a){
with(_39){
return objj_msgSend(objj_msgSend(_39,"stringValue"),"lowercaseString");
}
}),new objj_method(sel_getUid("equals:"),function(_3b,_3c,_3d){
with(_3b){
return objj_msgSend(_3b,"fullEquals:",_3d);
}
}),new objj_method(sel_getUid("fullEquals:"),function(_3e,_3f,_40){
with(_3e){
return (objj_msgSend(_3e,"bareEquals:",_40)&&(objj_msgSend(objj_msgSend(_40,"resource"),"uppercaseString")===objj_msgSend(objj_msgSend(_3e,"resource"),"uppercaseString")));
}
}),new objj_method(sel_getUid("bareEquals:"),function(_41,_42,_43){
with(_41){
return ((objj_msgSend(objj_msgSend(_43,"node"),"uppercaseString")===objj_msgSend(objj_msgSend(_41,"node"),"uppercaseString"))&&(objj_msgSend(objj_msgSend(_43,"domain"),"uppercaseString")===objj_msgSend(objj_msgSend(_41,"domain"),"uppercaseString")));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("stropheJIDWithNode:domain:resource:"),function(_44,_45,_46,_47,_48){
with(_44){
return objj_msgSend(objj_msgSend(TNStropheJID,"alloc"),"initWithNode:domain:resource:",_46,_47,_48);
}
}),new objj_method(sel_getUid("stropheJIDWithNode:domain:"),function(_49,_4a,_4b,_4c){
with(_49){
return objj_msgSend(objj_msgSend(TNStropheJID,"alloc"),"initWithNode:domain:",_4b,_4c);
}
}),new objj_method(sel_getUid("stropheJIDWithString:"),function(_4d,_4e,_4f){
with(_4d){
return objj_msgSend(objj_msgSend(TNStropheJID,"alloc"),"initWithString:",_4f);
}
})]);
var _1=objj_getClass("TNStropheJID");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"TNStropheJID\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_50,_51,_52){
with(_50){
if(_50=objj_msgSendSuper({receiver:_50,super_class:objj_getClass("TNStropheJID").super_class},"init")){
_node=objj_msgSend(_52,"decodeObjectForKey:","_node");
_domain=objj_msgSend(_52,"decodeObjectForKey:","_domain");
_resource=objj_msgSend(_52,"decodeObjectForKey:","_resource");
}
return _50;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_55,"encodeObject:forKey:",_node,"_node");
if(_domain){
objj_msgSend(_55,"encodeObject:forKey:",_domain,"_domain");
}
if(_resource){
objj_msgSend(_55,"encodeObject:forKey:",_resource,"_resource");
}
}
})]);
p;17;TNStropheRoster.jt;12516;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;21;TNStropheRosterBase.jt;12423;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNStropheRosterBase.j",YES);
var _1=objj_allocateClassPair(TNStropheRosterBase,"TNStropheRoster"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_groups"),new objj_ivar("_pendingPresence")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("groups"),function(_3,_4){
with(_3){
return _groups;
}
}),new objj_method(sel_getUid("_setGroups:"),function(_5,_6,_7){
with(_5){
_groups=_7;
}
}),new objj_method(sel_getUid("pendingPresence"),function(_8,_9){
with(_8){
return _pendingPresence;
}
}),new objj_method(sel_getUid("_setPendingPresence:"),function(_a,_b,_c){
with(_a){
_pendingPresence=_c;
}
}),new objj_method(sel_getUid("initWithConnection:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("TNStropheRoster").super_class},"initWithConnection:",_f)){
_groups=objj_msgSend(CPArray,"array");
_pendingPresence=objj_msgSend(CPArray,"array");
}
return _d;
}
}),new objj_method(sel_getUid("clear"),function(_10,_11){
with(_10){
objj_msgSend(_groups,"removeAllObjects");
objj_msgSend(_pendingPresence,"removeAllObjects");
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("TNStropheRoster").super_class},"clear");
}
}),new objj_method(sel_getUid("getRoster"),function(_12,_13){
with(_12){
var uid=objj_msgSend(_connection,"getUniqueIdWithSuffix:","roster"),_14=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"id":uid,"type":"get"}),_15=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","iq","name","result","type",uid,"id"),_16=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","presence","name",objj_msgSend(objj_msgSend(_connection,"JID"),"bare"),"to");
pushParams=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","iq","name","set","type");
objj_msgSend(_14,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.ROSTER});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceiveRoster:"),_12,_15);
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceivePresence:"),_12,_16);
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceiveRosterPush:"),_12,pushParams);
objj_msgSend(_connection,"send:",_14);
}
}),new objj_method(sel_getUid("_didReceiveRoster:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"_processRoster:andNotifyOnNewContacts:",_19,NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheRosterRetrievedNotification,_17);
return NO;
}
}),new objj_method(sel_getUid("_processRoster:andNotifyOnNewContacts:"),function(_1a,_1b,_1c,_1d){
with(_1a){
var _1e=objj_msgSend(_1c,"firstChildWithName:","query");
if(objj_msgSend(_1e,"namespace")!=Strophe.NS.ROSTER){
return;
}
var _1f=objj_msgSend(_1e,"childrenWithName:","item");
for(var i=0;i<objj_msgSend(_1f,"count");i++){
objj_msgSend(_1a,"_processRosterItem:andNotifyIfNewContact:",objj_msgSend(_1f,"objectAtIndex:",i),_1d);
}
}
}),new objj_method(sel_getUid("_processRosterItem:andNotifyIfNewContact:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(_22,"valueForAttribute:","jid")),_25=objj_msgSend(_24,"node"),_26=(objj_msgSend(_22,"containsChildrenWithName:","group"))?objj_msgSend(objj_msgSend(_22,"firstChildWithName:","group"),"text"):"General",_27=objj_msgSend(_20,"groupWithName:orCreate:",_26,YES),_28=objj_msgSend(_22,"valueForAttribute:","subscription"),_29=NO,_2a;
if(objj_msgSend(_22,"valueForAttribute:","name")){
_25=objj_msgSend(_22,"valueForAttribute:","name");
}
if(objj_msgSend(_20,"containsJID:",_24)){
_2a=objj_msgSend(_20,"contactWithJID:",_24);
if(_28==="remove"){
objj_msgSend(_contacts,"removeObject:",_2a);
objj_msgSend(objj_msgSend(_20,"groupOfContact:",_2a),"removeContact:",_2a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheRosterRemovedContactNotification,_2a);
return;
}
}else{
if(_28==="remove"){
return;
}
_29=YES;
_2a=objj_msgSend(TNStropheContact,"contactWithConnection:JID:groupName:",_connection,_24,_26);
}
if(objj_msgSend(_20,"groupOfContact:",_2a)!=_27){
objj_msgSend(objj_msgSend(_20,"groupOfContact:",_2a),"removeContact:",_2a);
objj_msgSend(_27,"addContact:",_2a);
if(!_29){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactGroupUpdatedNotification,_2a);
}
}
if(objj_msgSend(_2a,"nickname")!=_25){
objj_msgSend(_2a,"setNickname:",_25);
if(!_29){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheContactNicknameUpdatedNotification,_2a);
}
}
objj_msgSend(_2a,"setSubscription:",_28);
if(_29){
objj_msgSend(_contacts,"addObject:",_2a);
var _2b=objj_msgSend(_20,"pendingPresenceForJID:",_24);
for(var j=0;j<objj_msgSend(_2b,"count");j++){
objj_msgSend(_2a,"_didReceiveStatus:",objj_msgSend(_2b,"objectAtIndex:",j));
}
objj_msgSend(_2a,"getMessages");
if(_23){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheRosterAddedContactNotification,_2a);
}
}
return _2a;
}
}),new objj_method(sel_getUid("_didReceivePresence:"),function(_2c,_2d,_2e){
with(_2c){
if(objj_msgSend(_2e,"type")==="subscribe"){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("roster:receiveSubscriptionRequest:"))){
objj_msgSend(_delegate,"roster:receiveSubscriptionRequest:",_2c,_2e);
}
}else{
if(objj_msgSend(_2c,"containsJID:",objj_msgSend(_2e,"from"))){
objj_msgSend(objj_msgSend(_2c,"contactWithJID:",objj_msgSend(_2e,"from")),"_didReceivePresence:",_2e);
}else{
objj_msgSend(_pendingPresence,"addObject:",_2e);
}
}
return YES;
}
}),new objj_method(sel_getUid("_didReceiveRosterPush:"),function(_2f,_30,_31){
with(_2f){
objj_msgSend(_2f,"_processRoster:andNotifyOnNewContacts:",_31,YES);
return YES;
}
}),new objj_method(sel_getUid("pendingPresenceForJID:"),function(_32,_33,_34){
with(_32){
var _35=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_pendingPresence,"count");i++){
var _36=objj_msgSend(_pendingPresence,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_36,"from"),"bareEquals:",_34)){
objj_msgSend(_35,"addObject:",_36);
}
}
return _35;
}
}),new objj_method(sel_getUid("addGroup:"),function(_37,_38,_39){
with(_37){
objj_msgSend(_groups,"addObject:",_39);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheRosterAddedGroupNotification,_39);
return _39;
}
}),new objj_method(sel_getUid("addGroupWithName:"),function(_3a,_3b,_3c){
with(_3a){
if(objj_msgSend(_3a,"containsGroupWithName:",_3c)){
return nil;
}
return objj_msgSend(_3a,"addGroup:",objj_msgSend(TNStropheGroup,"stropheGroupWithName:",_3c));
}
}),new objj_method(sel_getUid("removeGroup:"),function(_3d,_3e,_3f){
with(_3d){
for(var i=0;i<objj_msgSend(_3f,"count");i++){
objj_msgSend(_3d,"changeGroup:ofContact:",_defaultGroup,objj_msgSend(objj_msgSend(_3f,"contacts"),"objectAtIndex:",i));
}
objj_msgSend(_groups,"removeObject:",_3f);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStropheRosterRemovedGroupNotification,_3f);
}
}),new objj_method(sel_getUid("containsGroup:"),function(_40,_41,_42){
with(_40){
for(var i=0;i<objj_msgSend(_groups,"count");i++){
if(objj_msgSend(_groups,"objectAtIndex:",i)==_42){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("containsGroupWithName:"),function(_43,_44,_45){
with(_43){
return objj_msgSend(_43,"containsGroup:",objj_msgSend(_43,"groupWithName:",_45));
}
}),new objj_method(sel_getUid("groupWithName:"),function(_46,_47,_48){
with(_46){
for(var i=0;i<objj_msgSend(_groups,"count");i++){
var _49=objj_msgSend(_groups,"objectAtIndex:",i);
if(objj_msgSend(_49,"name")==_48){
return _49;
}
}
return nil;
}
}),new objj_method(sel_getUid("groupWithName:orCreate:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=objj_msgSend(_4a,"groupWithName:",_4c);
if(_4d&&!_4e){
return objj_msgSend(_4a,"addGroupWithName:",_4c);
}
return _4e;
}
}),new objj_method(sel_getUid("groupOfContact:"),function(_4f,_50,_51){
with(_4f){
for(var i=0;i<objj_msgSend(_groups,"count");i++){
var _52=objj_msgSend(_groups,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_52,"contacts"),"containsObject:",_51)){
return _52;
}
}
return nil;
}
}),new objj_method(sel_getUid("populatedGroupsCount"),function(_53,_54){
with(_53){
return objj_msgSend(objj_msgSend(_53,"populatedGroups"),"count");
}
}),new objj_method(sel_getUid("populatedGroups"),function(_55,_56){
with(_55){
var _57=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(_groups,"count");i++){
var _58=objj_msgSend(_groups,"objectAtIndex:",i);
if(objj_msgSend(_58,"count")>0){
objj_msgSend(_57,"addObject:",_58);
}
}
return _57;
}
}),new objj_method(sel_getUid("addContact:withName:inGroupWithName:"),function(_59,_5a,_5b,_5c,_5d){
with(_59){
if(objj_msgSend(_59,"containsJID:",_5b)==YES){
return;
}
if(!_5c){
_5c=objj_msgSend(_5b,"node");
}
if(!_5d){
_5d="General";
}
var uid=objj_msgSend(_connection,"getUniqueId"),_5e=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"set","id":uid}),_5f=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_5e,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.ROSTER});
objj_msgSend(_5e,"addChildWithName:andAttributes:","item",{"JID":objj_msgSend(_5b,"full"),"name":_5c});
objj_msgSend(_5e,"addChildWithName:andAttributes:","group",nil);
objj_msgSend(_5e,"addTextNode:",_5d);
objj_msgSend(_connection,"registerSelector:ofObject:withDict:userInfo:",sel_getUid("_didAddContact:userInfo:"),_59,_5f,_5b);
objj_msgSend(_connection,"send:",_5e);
}
}),new objj_method(sel_getUid("_didAddContact:userInfo:"),function(_60,_61,_62,_63){
with(_60){
if(objj_msgSend(_62,"type")==="result"){
CPLog.debug("Contact with JID "+_63+" was added to roster!");
}else{
CPLog.error("Error adding contact with JID "+_63+" to roster!");
}
return NO;
}
}),new objj_method(sel_getUid("removeContact:"),function(_64,_65,_66){
with(_64){
var uid=objj_msgSend(_connection,"getUniqueIdWithSuffix:","roster"),_67=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"set","id":uid});
params=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_67,"addChildWithName:andAttributes:","query",{"xmlns":Strophe.NS.ROSTER});
objj_msgSend(_67,"addChildWithName:andAttributes:","item",{"jid":objj_msgSend(objj_msgSend(_66,"JID"),"bare"),"subscription":"remove"});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:userInfo:",sel_getUid("_didRemoveContact:userInfo:"),_64,params,_66);
objj_msgSend(_connection,"send:",_67);
}
}),new objj_method(sel_getUid("_didRemoveContact:userInfo:"),function(_68,_69,_6a,_6b){
with(_68){
if(objj_msgSend(_6a,"type")==="result"){
CPLog.debug("Contact was removed from roster!");
}else{
CPLog.error("Error removing contact from roster!");
CPLog.error(_6b);
}
return NO;
}
}),new objj_method(sel_getUid("removeContactWithJID:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(_6c,"removeContact:",objj_msgSend(_6c,"contactWithJID:",_6e));
}
}),new objj_method(sel_getUid("authorizeJID:"),function(_6f,_70,_71){
with(_6f){
var _72=objj_msgSend(_6f,"contactWithJID:",_71);
if(!_72){
_72=objj_msgSend(_6f,"addContact:withName:inGroupWithName:",_71,objj_msgSend(_71,"node"),"General");
}
objj_msgSend(_72,"subscribe");
}
}),new objj_method(sel_getUid("unauthorizeJID:"),function(_73,_74,_75){
with(_73){
objj_msgSend(objj_msgSend(_73,"contactWithJID:",_75),"unsubscribe");
}
}),new objj_method(sel_getUid("askAuthorizationTo:"),function(_76,_77,_78){
with(_76){
objj_msgSend(objj_msgSend(_76,"contactWithJID:",_78),"askSubscription");
}
}),new objj_method(sel_getUid("answerAuthorizationRequest:answer:"),function(_79,_7a,_7b,_7c){
with(_79){
var _7d=objj_msgSend(_7b,"from");
if(_7c==YES){
objj_msgSend(_79,"authorizeJID:",_7d);
objj_msgSend(_79,"askAuthorizationTo:",_7d);
}else{
objj_msgSend(_79,"unauthorizeJID:",_7d);
}
if(!objj_msgSend(_79,"containsJID:",_7d)){
objj_msgSend(_79,"addContact:withName:inGroupWithName:",_7d,objj_msgSend(_7d,"node"),nil);
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("rosterWithConnection:"),function(_7e,_7f,_80){
with(_7e){
return objj_msgSend(objj_msgSend(TNStropheRoster,"alloc"),"initWithConnection:",_80);
}
})]);
p;21;TNStropheRosterBase.jt;4832;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;21;TNStropheConnection.ji;17;TNStropheStanza.ji;16;TNStropheGroup.ji;18;TNStropheContact.ji;18;TNStropheGlobals.jt;4651;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNStropheConnection.j",YES);
objj_executeFile("TNStropheStanza.j",YES);
objj_executeFile("TNStropheGroup.j",YES);
objj_executeFile("TNStropheContact.j",YES);
objj_executeFile("TNStropheGlobals.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNStropheRosterBase"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_contacts"),new objj_ivar("_delegate"),new objj_ivar("_connection"),new objj_ivar("_defaultGroup")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("contacts"),function(_3,_4){
with(_3){
return _contacts;
}
}),new objj_method(sel_getUid("_setContacts:"),function(_5,_6,_7){
with(_5){
_contacts=_7;
}
}),new objj_method(sel_getUid("delegate"),function(_8,_9){
with(_8){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_a,_b,_c){
with(_a){
_delegate=_c;
}
}),new objj_method(sel_getUid("connection"),function(_d,_e){
with(_d){
return _connection;
}
}),new objj_method(sel_getUid("_setConnection:"),function(_f,_10,_11){
with(_f){
_connection=_11;
}
}),new objj_method(sel_getUid("initWithConnection:"),function(_12,_13,_14){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("TNStropheRosterBase").super_class},"init")){
_connection=_14;
_contacts=objj_msgSend(CPArray,"array");
_defaultGroup=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","General");
}
return _12;
}
}),new objj_method(sel_getUid("disconnect"),function(_15,_16){
with(_15){
objj_msgSend(_connection,"disconnect");
}
}),new objj_method(sel_getUid("clear"),function(_17,_18){
with(_17){
objj_msgSend(_contacts,"removeAllObjects");
}
}),new objj_method(sel_getUid("groupOfContact:"),function(_19,_1a,_1b){
with(_19){
CPLog.error("TNStropheRosterBase groupOfContact must be implemented in sub-classes.");
return;
}
}),new objj_method(sel_getUid("removeContact:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_contacts,"removeObject:",_1e);
objj_msgSend(objj_msgSend(_1c,"groupOfContact:",_1e),"removeContact:",_1e);
}
}),new objj_method(sel_getUid("removeContactWithJID:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"removeContact:",objj_msgSend(_1f,"contactWithJID:",_21));
}
}),new objj_method(sel_getUid("contactWithJID:"),function(_22,_23,_24){
with(_22){
return objj_msgSend(_22,"contactWithFullJID:",_24)||objj_msgSend(_22,"contactWithBareJID:",_24);
}
}),new objj_method(sel_getUid("contactWithFullJID:"),function(_25,_26,_27){
with(_25){
for(var i=0;i<objj_msgSend(_contacts,"count");i++){
var _28=objj_msgSend(_contacts,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_28,"JID"),"equals:",_27)){
return _28;
}
}
}
}),new objj_method(sel_getUid("contactWithBareJID:"),function(_29,_2a,_2b){
with(_29){
for(var i=0;i<objj_msgSend(_contacts,"count");i++){
var _2c=objj_msgSend(_contacts,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_2c,"JID"),"bareEquals:",_2b)){
return _2c;
}
}
return nil;
}
}),new objj_method(sel_getUid("firstContactWithBareJID:"),function(_2d,_2e,_2f){
with(_2d){
for(var i=0;i<objj_msgSend(_contacts,"count");i++){
var _30=objj_msgSend(_contacts,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_30,"JID"),"bareEquals:",_2f)){
return _30;
}
}
return nil;
}
}),new objj_method(sel_getUid("containsJID:"),function(_31,_32,_33){
with(_31){
return objj_msgSend(_31,"containsBareJID:",_33)||objj_msgSend(_31,"containsFullJID:",_33);
}
}),new objj_method(sel_getUid("containsFullJID:"),function(_34,_35,_36){
with(_34){
for(var i=0;i<objj_msgSend(_contacts,"count");i++){
if(objj_msgSend(objj_msgSend(objj_msgSend(_contacts,"objectAtIndex:",i),"JID"),"equals:",_36)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("containsBareJID:"),function(_37,_38,_39){
with(_37){
for(var i=0;i<objj_msgSend(_contacts,"count");i++){
if(objj_msgSend(objj_msgSend(objj_msgSend(_contacts,"objectAtIndex:",i),"JID"),"bareEquals:",_39)){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("changeNickname:ofContact:"),function(_3a,_3b,_3c,_3d){
with(_3a){
objj_msgSend(_3d,"changeNickname:",_3c);
}
}),new objj_method(sel_getUid("changeNickname:ofContactWithJID:"),function(_3e,_3f,_40,_41){
with(_3e){
objj_msgSend(_3e,"changeNickname:ofContact:",_40,objj_msgSend(_3e,"contactWithJID:",_41));
}
}),new objj_method(sel_getUid("changeGroup:ofContact:"),function(_42,_43,_44,_45){
with(_42){
objj_msgSend(_45,"changeGroup:",_44);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("rosterWithConnection:"),function(_46,_47,_48){
with(_46){
return objj_msgSend(objj_msgSend(TNStropheRosterBase,"alloc"),"initWithConnection:",_48);
}
})]);
p;17;TNStropheStanza.jt;7230;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;11;TNXMLNode.jt;7148;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("TNStropheJID.j",YES);
objj_executeFile("TNXMLNode.j",YES);
var _1=objj_allocateClassPair(TNXMLNode,"TNStropheStanza"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithName:to:attributes:bare:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
if(_6&&!_7){
_7={};
}
if(_7){
if(_7.isa){
objj_msgSend(_7,"setValue:forKey:",((_8)?objj_msgSend(_6,"bare"):_6),"to");
}else{
_7.to=((_8)?objj_msgSend(_6,"bare"):objj_msgSend(_6,"full"));
}
}
return objj_msgSendSuper({receiver:_3,super_class:objj_getClass("TNStropheStanza").super_class},"initWithName:andAttributes:",_5,_7);
}
}),new objj_method(sel_getUid("from"),function(_9,_a){
with(_9){
while(objj_msgSend(_9,"up")){
}
return objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(_9,"valueForAttribute:","from"));
}
}),new objj_method(sel_getUid("setFrom:"),function(_b,_c,_d){
with(_b){
if(objj_msgSend(_d,"class")==CPString){
_d=objj_msgSend(TNStropheJID,"stropheJIDWithString:",_d);
}
while(objj_msgSend(_b,"up")){
}
objj_msgSend(_b,"setValue:forAttribute:",objj_msgSend(_d,"full"),"from");
}
}),new objj_method(sel_getUid("fromBare"),function(_e,_f){
with(_e){
return objj_msgSend(objj_msgSend(_e,"from"),"bare");
}
}),new objj_method(sel_getUid("fromUser"),function(_10,_11){
with(_10){
return objj_msgSend(objj_msgSend(_10,"from"),"node");
}
}),new objj_method(sel_getUid("fromDomain"),function(_12,_13){
with(_12){
return objj_msgSend(objj_msgSend(_12,"from"),"domain");
}
}),new objj_method(sel_getUid("fromResource"),function(_14,_15){
with(_14){
return objj_msgSend(objj_msgSend(_14,"from"),"resource");
}
}),new objj_method(sel_getUid("to"),function(_16,_17){
with(_16){
while(objj_msgSend(_16,"up")){
}
return objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(_16,"valueForAttribute:","to"));
}
}),new objj_method(sel_getUid("setTo:"),function(_18,_19,aTo){
with(_18){
if(objj_msgSend(aTo,"class")==CPString){
aTo=objj_msgSend(TNStropheJID,"stropheJIDWithString:",aTo);
}
while(objj_msgSend(_18,"up")){
}
objj_msgSend(_18,"setValue:forAttribute:",objj_msgSend(aTo,"full"),"to");
}
}),new objj_method(sel_getUid("type"),function(_1a,_1b){
with(_1a){
return objj_msgSend(_1a,"valueForAttribute:","type");
}
}),new objj_method(sel_getUid("setType:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"setValue:forAttribute:",_1e,"type");
}
}),new objj_method(sel_getUid("ID"),function(_1f,_20){
with(_1f){
return objj_msgSend(_1f,"valueForAttribute:","id");
}
}),new objj_method(sel_getUid("setID:"),function(_21,_22,_23){
with(_21){
while(objj_msgSend(_21,"up")){
}
objj_msgSend(_21,"setValue:forAttribute:",_23,"id");
}
}),new objj_method(sel_getUid("delayTime"),function(_24,_25){
with(_24){
if(objj_msgSend(_24,"containsChildrenWithName:","delay")&&objj_msgSend(objj_msgSend(_24,"firstChildWithName:","delay"),"namespace")==Strophe.NS.DELAY){
var _26=objj_msgSend(objj_msgSend(_24,"firstChildWithName:","delay"),"valueForAttribute:","stamp"),_27=_26.match(new RegExp(/(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2})Z/));
if(!_27||_27.length!=3){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"delayTime: the string must be of YYYY-MM-DDTHH:MM:SSZ format");
}
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithString:",(_27[1]+" "+_27[2]+" +0000"));
}
return objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("stanzaWithStanza:"),function(_28,_29,_2a){
with(_28){
return objj_msgSend(objj_msgSend(TNStropheStanza,"alloc"),"initWithNode:",_2a);
}
}),new objj_method(sel_getUid("stanzaWithName:andAttributes:"),function(_2b,_2c,_2d,_2e){
with(_2b){
return objj_msgSend(objj_msgSend(TNStropheStanza,"alloc"),"initWithName:andAttributes:",_2d,_2e);
}
}),new objj_method(sel_getUid("stanzaWithName:to:attributes:"),function(_2f,_30,_31,_32,_33){
with(_2f){
return objj_msgSend(objj_msgSend(TNStropheStanza,"alloc"),"initWithName:to:attributes:bare:",_31,_32,_33,NO);
}
}),new objj_method(sel_getUid("stanzaWithName:to:attributes:bare:"),function(_34,_35,_36,_37,_38,_39){
with(_34){
return objj_msgSend(objj_msgSend(TNStropheStanza,"alloc"),"initWithName:to:attributes:bare:",_36,_37,_38,_39);
}
}),new objj_method(sel_getUid("iqWithAttributes:"),function(_3a,_3b,_3c){
with(_3a){
return objj_msgSend(TNStropheStanza,"stanzaWithName:andAttributes:","iq",_3c);
}
}),new objj_method(sel_getUid("iq"),function(_3d,_3e){
with(_3d){
return objj_msgSend(TNStropheStanza,"iqWithAttributes:",nil);
}
}),new objj_method(sel_getUid("iqTo:"),function(_3f,_40,_41){
with(_3f){
return objj_msgSend(TNStropheStanza,"iqTo:withAttributes:",_41,nil);
}
}),new objj_method(sel_getUid("iqWithType:"),function(_42,_43,_44){
with(_42){
return objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":_44});
}
}),new objj_method(sel_getUid("iqTo:withType:"),function(_45,_46,_47,_48){
with(_45){
return objj_msgSend(TNStropheStanza,"iqTo:withAttributes:",_47,{"type":_48});
}
}),new objj_method(sel_getUid("iqTo:withAttributes:"),function(_49,_4a,_4b,_4c){
with(_49){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:bare:","iq",_4b,_4c,NO);
}
}),new objj_method(sel_getUid("iqTo:withAttributes:bare:"),function(_4d,_4e,_4f,_50,_51){
with(_4d){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:bare:","iq",_4f,_50,_51);
}
}),new objj_method(sel_getUid("presenceWithAttributes:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(TNStropheStanza,"stanzaWithName:andAttributes:","presence",_54);
}
}),new objj_method(sel_getUid("presence"),function(_55,_56){
with(_55){
return objj_msgSend(TNStropheStanza,"presenceWithAttributes:",nil);
}
}),new objj_method(sel_getUid("presenceTo:"),function(_57,_58,_59){
with(_57){
return objj_msgSend(TNStropheStanza,"presenceTo:withAttributes:",_59,nil);
}
}),new objj_method(sel_getUid("presenceTo:withAttributes:"),function(_5a,_5b,_5c,_5d){
with(_5a){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:bare:","presence",_5c,_5d,NO);
}
}),new objj_method(sel_getUid("presenceTo:withAttributes:bare:"),function(_5e,_5f,_60,_61,_62){
with(_5e){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:bare:","presence",_60,_61,_62);
}
}),new objj_method(sel_getUid("messageWithAttributes:"),function(_63,_64,_65){
with(_63){
return objj_msgSend(TNStropheStanza,"stanzaWithName:andAttributes:","message",_65);
}
}),new objj_method(sel_getUid("message"),function(_66,_67){
with(_66){
return objj_msgSend(TNStropheStanza,"messageWithAttributes:",nil);
}
}),new objj_method(sel_getUid("messageTo:"),function(_68,_69,_6a){
with(_68){
return objj_msgSend(TNStropheStanza,"messageTo:withAttributes:",_6a,nil);
}
}),new objj_method(sel_getUid("messageTo:withAttributes:"),function(_6b,_6c,_6d,_6e){
with(_6b){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:","message",_6d,_6e);
}
}),new objj_method(sel_getUid("messageTo:withAttributes:bare:"),function(_6f,_70,_71,_72,_73){
with(_6f){
return objj_msgSend(TNStropheStanza,"stanzaWithName:to:attributes:bare:","message",_71,_72,_73);
}
})]);
p;11;TNXMLNode.jt;5053;@STATIC;1.0;I;23;Foundation/Foundation.jt;5006;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=objj_allocateClassPair(CPObject,"TNXMLNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_xmlNode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("xmlNode"),function(_3,_4){
with(_3){
return _xmlNode;
}
}),new objj_method(sel_getUid("initWithNode:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("TNXMLNode").super_class},"init")){
if((_7.c)&&(_7.c)!=undefined){
_xmlNode=_7;
}else{
_xmlNode=new Strophe.Builder("msg");
_xmlNode.nodeTree=_7;
_xmlNode.node=_7;
}
}
return _5;
}
}),new objj_method(sel_getUid("initWithName:andAttributes:"),function(_8,_9,_a,_b){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("TNXMLNode").super_class},"init")){
_xmlNode=new Strophe.Builder(_a,_b);
}
return _8;
}
}),new objj_method(sel_getUid("copy"),function(_c,_d){
with(_c){
return objj_msgSend(TNXMLNode,"nodeWithXMLNode:",Strophe.copyElement(objj_msgSend(_c,"tree")));
}
}),new objj_method(sel_getUid("addNode:"),function(_e,_f,_10){
with(_e){
_xmlNode.cnode(objj_msgSend(_10,"tree"));
}
}),new objj_method(sel_getUid("addTextNode:"),function(_11,_12,_13){
with(_11){
_xmlNode=_xmlNode.t(_13);
}
}),new objj_method(sel_getUid("text"),function(_14,_15){
with(_14){
return Strophe.getText(objj_msgSend(_14,"tree"));
}
}),new objj_method(sel_getUid("tree"),function(_16,_17){
with(_16){
return _xmlNode.tree();
}
}),new objj_method(sel_getUid("up"),function(_18,_19){
with(_18){
if(_xmlNode.node&&_xmlNode.node.parentNode){
ret=_xmlNode.up();
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("stringValue"),function(_1a,_1b){
with(_1a){
return Strophe.serialize(_xmlNode);
}
}),new objj_method(sel_getUid("description"),function(_1c,_1d){
with(_1c){
return objj_msgSend(_1c,"stringValue");
}
}),new objj_method(sel_getUid("valueForAttribute:"),function(_1e,_1f,_20){
with(_1e){
return objj_msgSend(_1e,"tree").getAttribute(_20);
}
}),new objj_method(sel_getUid("setValue:forAttribute:"),function(_21,_22,_23,_24){
with(_21){
var _25={};
_25[_24]=_23;
_xmlNode.attrs(_25);
}
}),new objj_method(sel_getUid("name"),function(_26,_27){
with(_26){
return objj_msgSend(_26,"tree").tagName;
}
}),new objj_method(sel_getUid("namespace"),function(_28,_29){
with(_28){
return objj_msgSend(_28,"valueForAttribute:","xmlns");
}
}),new objj_method(sel_getUid("setNamespace:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"setValue:forAttribute:",_2c,"xmlns");
}
}),new objj_method(sel_getUid("addChildWithName:andAttributes:"),function(_2d,_2e,_2f,_30){
with(_2d){
_xmlNode=_xmlNode.c(_2f,_30);
}
}),new objj_method(sel_getUid("addChildWithName:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"addChildWithName:andAttributes:",_33,{});
}
}),new objj_method(sel_getUid("childrenWithName:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(CPArray,"array"),_38=objj_msgSend(_34,"tree").getElementsByTagName(_36);
for(var i=0;i<_38.length;i++){
objj_msgSend(_37,"addObject:",objj_msgSend(TNXMLNode,"nodeWithXMLNode:",_38[i]));
}
return _37;
}
}),new objj_method(sel_getUid("ownChildrenWithName:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(CPArray,"array"),_3d=objj_msgSend(_39,"tree").childNodes;
for(var i=0;i<_3d.length;i++){
if((_3b===nil)||(_3b&&_3d[i].tagName==_3b)){
objj_msgSend(_3c,"addObject:",objj_msgSend(TNXMLNode,"nodeWithXMLNode:",_3d[i]));
}
}
return _3c;
}
}),new objj_method(sel_getUid("firstChildWithName:"),function(_3e,_3f,_40){
with(_3e){
var _41=objj_msgSend(_3e,"tree").getElementsByTagName(_40);
if(_41&&(_41.length>0)){
return objj_msgSend(TNXMLNode,"nodeWithXMLNode:",_41[0]);
}else{
return nil;
}
}
}),new objj_method(sel_getUid("children"),function(_42,_43){
with(_42){
return objj_msgSend(_42,"ownChildrenWithName:",nil);
}
}),new objj_method(sel_getUid("containsChildrenWithName:"),function(_44,_45,_46){
with(_44){
return (objj_msgSend(_44,"firstChildWithName:",_46))?YES:NO;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("nodeWithXMLNode:"),function(_47,_48,_49){
with(_47){
return objj_msgSend(objj_msgSend(TNXMLNode,"alloc"),"initWithNode:",_49);
}
}),new objj_method(sel_getUid("nodeWithName:"),function(_4a,_4b,_4c){
with(_4a){
return objj_msgSend(objj_msgSend(TNXMLNode,"alloc"),"initWithName:andAttributes:",_4c,nil);
}
}),new objj_method(sel_getUid("nodeWithName:andAttributes:"),function(_4d,_4e,_4f,_50){
with(_4d){
return objj_msgSend(objj_msgSend(TNXMLNode,"alloc"),"initWithName:andAttributes:",_4f,_50);
}
})]);
var _1=objj_getClass("TNXMLNode");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"TNXMLNode\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_51,_52,_53){
with(_51){
_51=objj_msgSendSuper({receiver:_51,super_class:objj_getClass("TNXMLNode").super_class},"initWithCoder:",_53);
if(_51){
}
return _51;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_54,_55,_56){
with(_54){
}
})]);
p;22;MUC/TNStropheMUCRoom.jt;6500;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;17;../TNStropheJID.ji;24;../TNStropheConnection.ji;20;../TNStropheStanza.ji;20;TNStropheMUCRoster.jt;6326;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("../TNStropheGlobals.j",YES);
objj_executeFile("../TNStropheJID.j",YES);
objj_executeFile("../TNStropheConnection.j",YES);
objj_executeFile("../TNStropheStanza.j",YES);
objj_executeFile("TNStropheMUCRoster.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNStropheMUCRoom"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_messages"),new objj_ivar("_subject"),new objj_ivar("_delegate"),new objj_ivar("_roomJID"),new objj_ivar("_roster"),new objj_ivar("_handlerIDs"),new objj_ivar("_connection")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("messages"),function(_3,_4){
with(_3){
return _messages;
}
}),new objj_method(sel_getUid("_setMessages:"),function(_5,_6,_7){
with(_5){
_messages=_7;
}
}),new objj_method(sel_getUid("subject"),function(_8,_9){
with(_8){
return _subject;
}
}),new objj_method(sel_getUid("_setSubject:"),function(_a,_b,_c){
with(_a){
_subject=_c;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f,_10,_11){
with(_f){
_delegate=_11;
}
}),new objj_method(sel_getUid("roomJID"),function(_12,_13){
with(_12){
return _roomJID;
}
}),new objj_method(sel_getUid("_setRoomJID:"),function(_14,_15,_16){
with(_14){
_roomJID=_16;
}
}),new objj_method(sel_getUid("roster"),function(_17,_18){
with(_17){
return _roster;
}
}),new objj_method(sel_getUid("_setRoster:"),function(_19,_1a,_1b){
with(_19){
_roster=_1b;
}
}),new objj_method(sel_getUid("initWithRoom:onService:usingConnection:withNick:"),function(_1c,_1d,_1e,_1f,_20,_21){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("TNStropheMUCRoom").super_class},"init")){
_connection=_20;
_roomJID=objj_msgSend(TNStropheJID,"stropheJIDWithNode:domain:resource:",_1e,_1f,_21);
_handlerIDs=objj_msgSend(CPArray,"array");
_messages=objj_msgSend(CPArray,"array");
_roster=objj_msgSend(TNStropheMUCRoster,"rosterWithConnection:forRoom:",_connection,_1c);
}
return _1c;
}
}),new objj_method(sel_getUid("directedPresence"),function(_22,_23){
with(_22){
return objj_msgSend(TNStropheStanza,"presenceTo:",_roomJID);
}
}),new objj_method(sel_getUid("join"),function(_24,_25){
with(_24){
var _26=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","message","name",objj_msgSend(_roomJID,"full"),"from","groupchat","type",{matchBare:true},"options"),_27=objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("receiveMessage:"),_24,_26);
objj_msgSend(_handlerIDs,"addObject:",_27);
var _28=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","message","name",objj_msgSend(_roomJID,"full"),"from","chat","type",{matchBare:true},"options"),_29=objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("receivePrivateMessage:"),_24,_28);
objj_msgSend(_handlerIDs,"addObject:",_29);
objj_msgSend(_connection,"send:",objj_msgSend(_24,"directedPresence"));
}
}),new objj_method(sel_getUid("leave"),function(_2a,_2b){
with(_2a){
var _2c=objj_msgSend(_2a,"directedPresence");
objj_msgSend(_2c,"setType:","unavailable");
objj_msgSend(_connection,"send:",_2c);
for(var i=0;i<objj_msgSend(_handlerIDs,"count");i++){
objj_msgSend(_connection,"deleteRegisteredSelector:",objj_msgSend(_handlerIDs,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("setSubject:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(TNStropheStanza,"message");
objj_msgSend(_30,"setType:","groupchat");
objj_msgSend(_30,"addChildWithName:","subject");
objj_msgSend(_30,"addTextNode:",_2f);
objj_msgSend(_2d,"sendStanzaToRoom:",_30);
}
}),new objj_method(sel_getUid("sayToRoom:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(TNStropheStanza,"message");
objj_msgSend(_34,"setType:","groupchat");
objj_msgSend(_34,"addChildWithName:","body");
objj_msgSend(_34,"addTextNode:",_33);
objj_msgSend(_31,"sendStanzaToRoom:",_34);
}
}),new objj_method(sel_getUid("sendStanzaToRoom:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_37,"setTo:",objj_msgSend(_roomJID,"bare"));
objj_msgSend(_connection,"send:",_37);
}
}),new objj_method(sel_getUid("receiveMessage:"),function(_38,_39,_3a){
with(_38){
if(objj_msgSend(_3a,"containsChildrenWithName:","subject")){
_subject=objj_msgSend(objj_msgSend(_3a,"firstChildWithName:","subject"),"text");
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("mucRoom:receivedNewSubject:"))){
objj_msgSend(_delegate,"mucRoom:receivedNewSubject:",_38,_subject);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheMUCSubjectWasUpdatedNotification,_38,_3a);
}
if(objj_msgSend(_3a,"containsChildrenWithName:","body")){
var _3b=objj_msgSend(objj_msgSend(_3a,"firstChildWithName:","body"),"text"),_3c=objj_msgSend(_roster,"contactWithJID:",objj_msgSend(_3a,"from")),_3d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_3b,"body",_3c,"from",objj_msgSend(_3a,"delayTime"),"time");
objj_msgSend(_messages,"addObject:",_3d);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("mucRoom:receivedMessage:"))){
objj_msgSend(_delegate,"mucRoom:receivedMessage:",_38,_3d);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheMUCConversationWasUpdatedNotification,_38,_3a);
}
var _3e=objj_msgSend(_3a,"children");
objj_msgSend(_3e,"removeObjectsInArray:",objj_msgSend(_3a,"childrenWithName:","body"));
objj_msgSend(_3e,"removeObjectsInArray:",objj_msgSend(_3a,"childrenWithName:","subject"));
if(objj_msgSend(_3e,"count")>0){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("mucRoom:receivedData:"))){
objj_msgSend(_delegate,"mucRoom:receivedData:",_38,_3a);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheMUCDataReceivedNotification,_38,_3a);
}
return YES;
}
}),new objj_method(sel_getUid("receivePrivateMessage:"),function(_3f,_40,_41){
with(_3f){
return YES;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("joinRoom:onService:usingConnection:withNick:"),function(_42,_43,_44,_45,_46,_47){
with(_42){
return objj_msgSend(objj_msgSend(TNStropheMUCRoom,"alloc"),"initWithRoom:onService:usingConnection:withNick:",_44,_45,_46,_47);
}
})]);
p;24;MUC/TNStropheMUCRoster.jt;5267;@STATIC;1.0;I;23;Foundation/Foundation.ji;24;../TNStropheRosterBase.jt;5191;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("../TNStropheRosterBase.j",YES);
var _1=objj_allocateClassPair(TNStropheRosterBase,"TNStropheMUCRoster"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_admins"),new objj_ivar("_moderators"),new objj_ivar("_owners"),new objj_ivar("_participants"),new objj_ivar("_visitors"),new objj_ivar("_room")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("admins"),function(_3,_4){
with(_3){
return _admins;
}
}),new objj_method(sel_getUid("_setAdmins:"),function(_5,_6,_7){
with(_5){
_admins=_7;
}
}),new objj_method(sel_getUid("moderators"),function(_8,_9){
with(_8){
return _moderators;
}
}),new objj_method(sel_getUid("_setModerators:"),function(_a,_b,_c){
with(_a){
_moderators=_c;
}
}),new objj_method(sel_getUid("owners"),function(_d,_e){
with(_d){
return _owners;
}
}),new objj_method(sel_getUid("_setOwners:"),function(_f,_10,_11){
with(_f){
_owners=_11;
}
}),new objj_method(sel_getUid("participants"),function(_12,_13){
with(_12){
return _participants;
}
}),new objj_method(sel_getUid("_setParticipants:"),function(_14,_15,_16){
with(_14){
_participants=_16;
}
}),new objj_method(sel_getUid("visitors"),function(_17,_18){
with(_17){
return _visitors;
}
}),new objj_method(sel_getUid("_setVisitors:"),function(_19,_1a,_1b){
with(_19){
_visitors=_1b;
}
}),new objj_method(sel_getUid("room"),function(_1c,_1d){
with(_1c){
return _room;
}
}),new objj_method(sel_getUid("_setRoom:"),function(_1e,_1f,_20){
with(_1e){
_room=_20;
}
}),new objj_method(sel_getUid("initWithConnection:forRoom:"),function(_21,_22,_23,_24){
with(_21){
if(_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("TNStropheMUCRoster").super_class},"initWithConnection:",_23)){
_room=_24;
_visitors=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","Visitors");
_participants=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","Participants");
_moderators=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","Moderators");
_admins=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","Admins");
_owners=objj_msgSend(TNStropheGroup,"stropheGroupWithName:","Owners");
var _25=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","presence","name",objj_msgSend(objj_msgSend(_room,"roomJID"),"full"),"from",{matchBare:true},"options");
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceivePresence:"),_21,_25);
}
return _21;
}
}),new objj_method(sel_getUid("_didReceivePresence:"),function(_26,_27,_28){
with(_26){
var _29=objj_msgSend(_26,"contactWithFullJID:",objj_msgSend(_28,"from")),_2a=objj_msgSend(_28,"firstChildWithName:","x"),_2b;
if(_2a&&objj_msgSend(_2a,"namespace")=="http://jabber.org/protocol/muc#user"){
switch(objj_msgSend(objj_msgSend(_2a,"firstChildWithName:","item"),"valueForAttribute:","role")){
case "visitor":
_2b=_visitors;
break;
case "participant":
_2b=_participants;
break;
case "moderator":
_2b=_moderators;
break;
}
}
if(_29){
objj_msgSend(_29,"_didReceivePresence:",_28);
}else{
_29=objj_msgSend(_26,"addContact:withName:inGroup:",objj_msgSend(_28,"from"),objj_msgSend(objj_msgSend(_28,"from"),"resource"),_2b);
}
if(objj_msgSend(_28,"type")==="unavailable"){
var _2c;
if(objj_msgSend(_2a,"containsChildrenWithName:","status")){
_2c=objj_msgSend(objj_msgSend(_2a,"firstChildWithName:","status"),"valueForAttribute:","code");
}
objj_msgSend(_26,"removeContact:withStatusCode:",_29,_2c);
}
return YES;
}
}),new objj_method(sel_getUid("addContact:withName:inGroup:"),function(_2d,_2e,_2f,_30,_31){
with(_2d){
if(objj_msgSend(_2d,"containsFullJID:",_2f)){
return;
}
if(!_31){
_31=_visitors;
}
var _32=objj_msgSend(TNStropheContact,"contactWithConnection:JID:groupName:",_connection,_2f,objj_msgSend(_31,"name"));
objj_msgSend(_32,"setNickname:",_30);
objj_msgSend(_31,"addContact:",_32);
objj_msgSend(_contacts,"addObject:",_32);
var _33=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_32,"contact");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheMUCContactJoinedNotification,_2d,_33);
return _32;
}
}),new objj_method(sel_getUid("removeContact:withStatusCode:"),function(_34,_35,_36,_37){
with(_34){
objj_msgSendSuper({receiver:_34,super_class:objj_getClass("TNStropheMUCRoster").super_class},"removeContact:",_36);
var _38=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_37,"statusCode",_36,"contact");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStropheMUCContactLeftNotification,_34,_38);
}
}),new objj_method(sel_getUid("groupOfContact:"),function(_39,_3a,_3b){
with(_39){
var _3c=objj_msgSend(CPArray,"arrayWithObjects:",_visitors,_participants,_moderators,_admins,_owners);
for(var i=0;i<objj_msgSend(_3c,"count");i++){
var _3d=objj_msgSend(_3c,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_3d,"contacts"),"containsObject:",_3b)){
return _3d;
}
}
return nil;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("rosterWithConnection:forRoom:"),function(_3e,_3f,_40,_41){
with(_3e){
return objj_msgSend(objj_msgSend(TNStropheMUCRoster,"alloc"),"initWithConnection:forRoom:",_40,_41);
}
})]);
p;27;PubSub/TNPubSubController.jt;10224;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;24;../TNStropheConnection.ji;14;TNPubSubNode.jt;10102;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("../TNStropheGlobals.j",YES);
objj_executeFile("../TNStropheConnection.j",YES);
objj_executeFile("TNPubSubNode.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNPubSubController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_nodes"),new objj_ivar("_servers"),new objj_ivar("_delegate"),new objj_ivar("_connection"),new objj_ivar("_subscriptionBatches"),new objj_ivar("_unsubscriptionBatches"),new objj_ivar("_numberOfPromptedServers")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("nodes"),function(_3,_4){
with(_3){
return _nodes;
}
}),new objj_method(sel_getUid("_setNodes:"),function(_5,_6,_7){
with(_5){
_nodes=_7;
}
}),new objj_method(sel_getUid("servers"),function(_8,_9){
with(_8){
return _servers;
}
}),new objj_method(sel_getUid("setServers:"),function(_a,_b,_c){
with(_a){
_servers=_c;
}
}),new objj_method(sel_getUid("delegate"),function(_d,_e){
with(_d){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_f,_10,_11){
with(_f){
_delegate=_11;
}
}),new objj_method(sel_getUid("initWithConnection:pubSubServer:"),function(_12,_13,_14,_15){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("TNPubSubController").super_class},"init")){
_connection=_14;
_servers=objj_msgSend(CPArray,"arrayWithObject:",(_15||objj_msgSend(TNStropheJID,"stropheJIDWithString:","pubsub."+objj_msgSend(objj_msgSend(_14,"JID"),"domain"))));
_numberOfPromptedServers=0;
_nodes=objj_msgSend(CPArray,"array");
_subscriptionBatches=objj_msgSend(CPDictionary,"dictionary");
_unsubscriptionBatches=objj_msgSend(CPDictionary,"dictionary");
}
return _12;
}
}),new objj_method(sel_getUid("_didSubscribeToNode:"),function(_16,_17,_18){
with(_16){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubController:subscribedToNode:"))){
objj_msgSend(_delegate,"pubSubController:subscribedToNode:",_16,objj_msgSend(_18,"object"));
}
}
}),new objj_method(sel_getUid("_didUnsubscribeToNode:"),function(_19,_1a,_1b){
with(_19){
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubController:unsubscribedFromNode:"))){
objj_msgSend(_delegate,"pubSubController:unsubscribedFromNode:",_19,objj_msgSend(_1b,"object"));
}
}
}),new objj_method(sel_getUid("_didBatchSubscribe:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(_1e,"object"),_20=objj_msgSend(_1e,"useInfo"),_21=objj_msgSend(_subscriptionBatches,"valueForKey:",_20),_22=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_20,"batchID");
objj_msgSend(_21,"removeObjectIdenticalTo:",objj_msgSend(_1f,"name"));
if(objj_msgSend(_21,"count")===0){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStrophePubSubBatchSubscribeComplete,_1c,_22);
}
}
}),new objj_method(sel_getUid("_didBatchUnsubscribe:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_25,"object"),_27=objj_msgSend(_25,"useInfo"),_28=objj_msgSend(_unsubscriptionBatches,"valueForKey:",_27),_29=objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_27,"batchID");
objj_msgSend(_28,"removeObjectIdenticalTo:",objj_msgSend(_26,"name"));
if(objj_msgSend(_28,"count")===0){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStrophePubSubBatchUnsubscribeComplete,_23,_29);
}
}
}),new objj_method(sel_getUid("containsServerJID:"),function(_2a,_2b,_2c){
with(_2a){
for(var i=0;i<objj_msgSend(_servers,"count");i++){
if(objj_msgSend(objj_msgSend(_servers,"objectAtIndex:",i),"node")==objj_msgSend(_2c,"node")){
return YES;
}
}
return NO;
}
}),new objj_method(sel_getUid("nodeWithName:server:"),function(_2d,_2e,_2f,_30){
with(_2d){
for(var i=0;i<objj_msgSend(_nodes,"count");i++){
var _31=objj_msgSend(_nodes,"objectAtIndex:",i);
if((objj_msgSend(_31,"name")===_2f)&&(!_30||objj_msgSend(objj_msgSend(_31,"server"),"equals:",_30))){
return _31;
}
}
return nil;
}
}),new objj_method(sel_getUid("nodeWithName:"),function(_32,_33,_34){
with(_32){
return objj_msgSend(_32,"nodeWithName:server:",_34,nil);
}
}),new objj_method(sel_getUid("findOrCreateNodeWithName:server:"),function(_35,_36,_37,_38){
with(_35){
var _39=objj_msgSend(_35,"nodeWithName:server:",_37,_38);
if(!objj_msgSend(_35,"containsServerJID:",_38)){
objj_msgSend(_servers,"addObject:",_38);
}
if(!_39){
_39=objj_msgSend(TNPubSubNode,"pubSubNodeWithNodeName:connection:pubSubServer:",_37,_connection,_38);
objj_msgSend(_nodes,"addObject:",_39);
}
return _39;
}
}),new objj_method(sel_getUid("retrieveSubscriptions"),function(_3a,_3b){
with(_3a){
_numberOfPromptedServers=0;
for(var i=0;i<objj_msgSend(_servers,"count");i++){
var uid=objj_msgSend(_connection,"getUniqueId"),_3c=objj_msgSend(TNStropheStanza,"iqWithAttributes:",{"type":"get","to":objj_msgSend(_servers,"objectAtIndex:",i),"id":uid}),_3d=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_3c,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_3c,"addChildWithName:","subscriptions");
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didRetrieveSubscriptions:"),_3a,_3d);
objj_msgSend(_connection,"send:",_3c);
}
}
}),new objj_method(sel_getUid("_didRetrieveSubscriptions:"),function(_3e,_3f,_40){
with(_3e){
if(objj_msgSend(_40,"type")=="result"){
var _41=objj_msgSend(_40,"childrenWithName:","subscription"),_42=objj_msgSend(_40,"from");
for(var i=0;i<objj_msgSend(_41,"count");i++){
var _43=objj_msgSend(_41,"objectAtIndex:",i),_44=objj_msgSend(_43,"valueForAttribute:","node"),_45=objj_msgSend(_43,"valueForAttribute:","subid"),_46=objj_msgSend(_3e,"findOrCreateNodeWithName:server:",_44,_42);
objj_msgSend(_46,"addSubscriptionID:",_45);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_3e,sel_getUid("_didSubscribeToNode:"),TNStrophePubSubNodeSubscribedNotification,_46);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_3e,sel_getUid("_didUnsubscribeToNode:"),TNStrophePubSubNodeUnsubscribedNotification,_46);
}
_numberOfPromptedServers++;
if(_numberOfPromptedServers>=objj_msgSend(_servers,"count")){
_numberOfPromptedServers=0;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubSubscriptionsRetrievedNotification,_3e);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubController:retrievedSubscriptions:"))){
objj_msgSend(_delegate,"pubSubController:retrievedSubscriptions:",_3e,YES);
}
}
}else{
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubController:retrievedSubscriptions:"))){
objj_msgSend(_delegate,"pubSubController:retrievedSubscriptions:",_3e,NO);
}
CPLog.error("Cannot retrieve the contents of pubsub node");
CPLog.error(_40);
}
return NO;
}
}),new objj_method(sel_getUid("subscribeToNodeWithName:server:nodeDelegate:"),function(_47,_48,_49,_4a,_4b){
with(_47){
var _4c=objj_msgSend(_47,"findOrCreateNodeWithName:server:",_49,_4a);
objj_msgSend(_4c,"setDelegate:",_4b);
objj_msgSend(_4c,"subscribe");
return _4c;
}
}),new objj_method(sel_getUid("subscribeToNodeWithName:server:"),function(_4d,_4e,_4f,_50){
with(_4d){
return objj_msgSend(_4d,"subscribeToNodeWithName:server:nodeDelegate:",_4f,_50,nil);
}
}),new objj_method(sel_getUid("subscribeToNodesWithNames:nodesDelegate:"),function(_51,_52,_53,_54){
with(_51){
var _55=objj_msgSend(_connection,"getUniqueId"),_56=objj_msgSend(_53,"allKeys");
objj_msgSend(_subscriptionBatches,"setValue:forKey:",_53,_55);
for(var k=0;k<objj_msgSend(_56,"count");k++){
var _57=objj_msgSend(_56,"objectAtIndex:",k),_58=objj_msgSend(_56,"valueForKey:",_57);
for(var i=0;i<objj_msgSend(_58,"count");i++){
var _59=objj_msgSend(_58,"objectAtIndex:",i),_5a=objj_msgSend(_51,"subscribeToNodeWithName:server:nodeDelegate:",_59,_57,_54);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:userInfo:",_51,sel_getUid("_didBatchSubscribe:"),TNStrophePubSubNodeSubscribedNotification,_5a,_55);
}
}
return _55;
}
}),new objj_method(sel_getUid("unsubscribeFromNodeWithName:server:nodeDelegate:"),function(_5b,_5c,_5d,_5e,_5f){
with(_5b){
var _60=objj_msgSend(_5b,"findOrCreateNodeWithName:server:",_5d,_5e);
objj_msgSend(_60,"setDelegate:",_5f);
objj_msgSend(_60,"unsubscribe");
return _60;
}
}),new objj_method(sel_getUid("unsubscribeFromNodeWithName:server:"),function(_61,_62,_63,_64){
with(_61){
return objj_msgSend(_61,"unsubscribeFromNodeWithName:server:nodeDelegate:",_63,_64,nil);
}
}),new objj_method(sel_getUid("unsubscribeFromNodesWithNames:nodesDelegate:"),function(_65,_66,_67,_68){
with(_65){
var _69=objj_msgSend(_connection,"getUniqueId"),_6a=objj_msgSend(_67,"allKeys");
objj_msgSend(_unsubscriptionBatches,"setValue:forKey:",_67,_69);
for(var k=0;k<objj_msgSend(_6a,"count");k++){
var _6b=objj_msgSend(_6a,"objectAtIndex:",k),_6c=objj_msgSend(_6a,"valueForKey:",_6b);
for(var i=0;i<objj_msgSend(_6c,"count");i++){
var _6d=objj_msgSend(_6c,"objectAtIndex:",i),_6e=objj_msgSend(_65,"unsubscribeFromNodeWithName:server:nodeDelegate:",_6d,_6b,_68);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:userInfo:",_65,sel_getUid("_didBatchUnsubscribe:"),TNStrophePubSubNodeUnsubscribedNotification,_6e,_69);
}
}
return _69;
}
}),new objj_method(sel_getUid("unsubscribeFromAllNodes"),function(_6f,_70){
with(_6f){
for(var i=0;i<objj_msgSend(_nodes,"count");i++){
objj_msgSend(objj_msgSend(_nodes,"objectAtIndex:",i),"unsubscribe");
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("pubSubControllerWithConnection:pubSubServer:"),function(_71,_72,_73,_74){
with(_71){
return objj_msgSend(objj_msgSend(TNPubSubController,"alloc"),"initWithConnection:pubSubServer:",_73,_74);
}
}),new objj_method(sel_getUid("pubSubControllerWithConnection:"),function(_75,_76,_77){
with(_75){
return objj_msgSend(objj_msgSend(TNPubSubController,"alloc"),"initWithConnection:pubSubServer:",_77,nil);
}
})]);
p;21;PubSub/TNPubSubNode.jt;18909;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;24;../TNStropheConnection.ji;20;../TNStropheStanza.jt;18781;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("../TNStropheGlobals.j",YES);
objj_executeFile("../TNStropheConnection.j",YES);
objj_executeFile("../TNStropheStanza.j",YES);
var _1=objj_allocateClassPair(CPObject,"TNPubSubNode"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_content"),new objj_ivar("_delegate"),new objj_ivar("_nodeName"),new objj_ivar("_pubSubServer"),new objj_ivar("_connection"),new objj_ivar("_eventSelectorID"),new objj_ivar("_subscriptionIDs")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return _content;
}
}),new objj_method(sel_getUid("_setContent:"),function(_5,_6,_7){
with(_5){
_content=_7;
}
}),new objj_method(sel_getUid("delegate"),function(_8,_9){
with(_8){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_a,_b,_c){
with(_a){
_delegate=_c;
}
}),new objj_method(sel_getUid("name"),function(_d,_e){
with(_d){
return _nodeName;
}
}),new objj_method(sel_getUid("_setNodeName:"),function(_f,_10,_11){
with(_f){
_nodeName=_11;
}
}),new objj_method(sel_getUid("server"),function(_12,_13){
with(_12){
return _pubSubServer;
}
}),new objj_method(sel_getUid("_setPubSubServer:"),function(_14,_15,_16){
with(_14){
_pubSubServer=_16;
}
}),new objj_method(sel_getUid("initWithNodeName:connection:pubSubServer:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("TNPubSubNode").super_class},"init")){
_nodeName=_19;
_connection=_1a;
_pubSubServer=_1b?_1b:objj_msgSend(TNStropheJID,"stropheJIDWithSring:","pubsub."+objj_msgSend(objj_msgSend(_connection,"JID"),"domain"));
_subscriptionIDs=objj_msgSend(CPArray,"array");
objj_msgSend(_17,"_setEventHandler");
}
return _17;
}
}),new objj_method(sel_getUid("initWithNodeName:connection:pubSubServer:subscriptionIDs:"),function(_1c,_1d,_1e,_1f,_20,_21){
with(_1c){
if(_1c=objj_msgSend(_1c,"initWithNodeName:connection:pubSubServer:",_1e,_1f,_20)){
_subscriptionIDs=_21;
}
return _1c;
}
}),new objj_method(sel_getUid("retrieveItems"),function(_22,_23){
with(_22){
var uid=objj_msgSend(_connection,"getUniqueId"),_24=objj_msgSend(TNStropheStanza,"iq"),_25=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_24,"setTo:",_pubSubServer);
objj_msgSend(_24,"setType:","get");
objj_msgSend(_24,"setID:",uid);
objj_msgSend(_24,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_24,"addChildWithName:andAttributes:","items",{"node":_nodeName});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didRetrievePubSubNode:"),_22,_25);
objj_msgSend(_connection,"send:",_24);
}
}),new objj_method(sel_getUid("_didRetrievePubSubNode:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_28,"type")=="result"){
_content=objj_msgSend(_28,"childrenWithName:","item");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeRetrievedNotification,_26);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:retrievedItems:"))){
objj_msgSend(_delegate,"pubSubNode:retrievedItems:",_26,YES);
}
}else{
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:retrievedItems:"))){
objj_msgSend(_delegate,"pubSubNode:retrievedItems:",_26,NO);
}
CPLog.error("Cannot retrieve the contents of pubsub node");
CPLog.error(_28);
}
return NO;
}
}),new objj_method(sel_getUid("create"),function(_29,_2a){
with(_29){
var uid=objj_msgSend(_connection,"getUniqueId"),_2b=objj_msgSend(TNStropheStanza,"iq"),_2c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_2b,"setTo:",_pubSubServer);
objj_msgSend(_2b,"setType:","set");
objj_msgSend(_2b,"setID:",uid);
objj_msgSend(_2b,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_2b,"addChildWithName:andAttributes:","create",{"node":_nodeName});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didCreatePubSubNode:"),_29,_2c);
objj_msgSend(_connection,"send:",_2b);
}
}),new objj_method(sel_getUid("_didCreatePubSubNode:"),function(_2d,_2e,_2f){
with(_2d){
if(objj_msgSend(_2f,"type")=="result"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeCreatedNotification,_2d);
}else{
CPLog.error("Cannot create the pubsub node");
CPLog.error(_2f);
}
return NO;
}
}),new objj_method(sel_getUid("delete"),function(_30,_31){
with(_30){
var uid=objj_msgSend(_connection,"getUniqueId"),_32=objj_msgSend(TNStropheStanza,"iq"),_33=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_32,"setTo:",_pubSubServer);
objj_msgSend(_32,"setType:","set");
objj_msgSend(_32,"setID:",uid);
objj_msgSend(_32,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB_OWNER});
objj_msgSend(_32,"addChildWithName:andAttributes:","delete",{"node":_nodeName});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("didDeletePubSubNode:"),_30,_33);
objj_msgSend(_connection,"send:",_32);
}
}),new objj_method(sel_getUid("_didCreatePubSubNode:"),function(_34,_35,_36){
with(_34){
if(objj_msgSend(_36,"type")=="result"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeDeletedNotification,_34);
}else{
CPLog.error("Cannot delete the pubsub node");
CPLog.error(_36);
}
return NO;
}
}),new objj_method(sel_getUid("configureWithDict:"),function(_37,_38,_39){
with(_37){
var uid=objj_msgSend(_connection,"getUniqueId"),_3a=objj_msgSend(TNStropheStanza,"iq"),_3b=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_3a,"setTo:",_pubSubServer);
objj_msgSend(_3a,"setType:","set");
objj_msgSend(_3a,"setID:",uid);
objj_msgSend(_3a,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB_OWNER});
objj_msgSend(_3a,"addChildWithName:andAttributes:","configure",{"node":_nodeName});
objj_msgSend(_3a,"addChildWithName:andAttributes:","x",{"xmlns":"jabber:x:data","type":"submit"});
objj_msgSend(_3a,"addChildWithName:andAttributes:","field",{"var":"FORM_TYPE","type":"hidden"});
objj_msgSend(_3a,"addChildWithName:","value");
objj_msgSend(_3a,"addTextNode:",Strophe.NS.PUBSUB_NODE_CONFIG);
objj_msgSend(_3a,"up");
objj_msgSend(_3a,"up");
for(var i=0;i<objj_msgSend(objj_msgSend(_39,"allKeys"),"count");i++){
var key=objj_msgSend(objj_msgSend(_39,"allKeys"),"objectAtIndex:",i),_3c=objj_msgSend(_39,"objectForKey:",key);
objj_msgSend(_3a,"addChildWithName:andAttributes:","field",{"var":key});
if(objj_msgSend(_3c,"class")==CPArray){
for(var j=0;j<objj_msgSend(_3c,"count");j++){
objj_msgSend(_3a,"addChildWithName:","value");
objj_msgSend(_3a,"addTextNode:",""+objj_msgSend(_3c,"objectAtIndex:",j)+"");
objj_msgSend(_3a,"up");
}
}else{
objj_msgSend(_3a,"addChildWithName:","value");
objj_msgSend(_3a,"addTextNode:",""+_3c+"");
objj_msgSend(_3a,"up");
}
objj_msgSend(_3a,"up");
}
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didConfigurePubSubNode:"),_37,_3b);
objj_msgSend(_connection,"send:",_3a);
}
}),new objj_method(sel_getUid("_didConfigurePubSubNode:"),function(_3d,_3e,_3f){
with(_3d){
if(objj_msgSend(_3f,"type")=="result"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeConfiguredNotification,_3d);
}else{
CPLog.error("Cannot configure the pubsub node");
CPLog.error(_3f);
}
return NO;
}
}),new objj_method(sel_getUid("publishItem:"),function(_40,_41,_42){
with(_40){
var uid=objj_msgSend(_connection,"getUniqueId"),_43=objj_msgSend(TNStropheStanza,"iq"),_44=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_43,"setTo:",_pubSubServer);
objj_msgSend(_43,"setType:","set");
objj_msgSend(_43,"setID:",uid);
objj_msgSend(_43,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_43,"addChildWithName:andAttributes:","publish",{"node":_nodeName});
objj_msgSend(_43,"addChildWithName:","item");
objj_msgSend(_43,"addNode:",_42);
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didPublishPubSubItem:"),_40,_44);
objj_msgSend(_connection,"send:",_43);
}
}),new objj_method(sel_getUid("_didPublishPubSubItem:"),function(_45,_46,_47){
with(_45){
if(objj_msgSend(_47,"type")=="result"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_45,sel_getUid("_didUpdateContentAfterPublishing:"),TNStrophePubSubNodeRetrievedNotification,_45);
objj_msgSend(_45,"retrieveItems");
}else{
CPLog.error("Cannot publish the pubsub item in node");
CPLog.error(_47);
}
return NO;
}
}),new objj_method(sel_getUid("_didUpdateContentAfterPublishing:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_48,TNStrophePubSubNodeRetrievedNotification,_48);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubItemPublishedNotification,_48);
}
}),new objj_method(sel_getUid("retractItemWithID:"),function(_4b,_4c,_4d){
with(_4b){
var uid=objj_msgSend(_connection,"getUniqueId"),_4e=objj_msgSend(TNStropheStanza,"iq"),_4f=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_4e,"setTo:",_pubSubServer);
objj_msgSend(_4e,"setType:","set");
objj_msgSend(_4e,"setID:",uid);
objj_msgSend(_4e,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_4e,"addChildWithName:andAttributes:","retract",{"node":_nodeName});
objj_msgSend(_4e,"addChildWithName:andAttributes:","item",{"id":_4d});
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didRetractPubSubItem:"),_4b,_4f);
objj_msgSend(_connection,"send:",_4e);
}
}),new objj_method(sel_getUid("_didRetractPubSubItem:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_52,"type")=="result"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_50,sel_getUid("_didUpdateContentAfterRetracting:"),TNStrophePubSubNodeRetrievedNotification,_50);
objj_msgSend(_50,"retrieveItems");
}else{
CPLog.error("Cannot remove the pubsub item in node");
CPLog.error(_52);
}
return NO;
}
}),new objj_method(sel_getUid("_didUpdateContentAfterRetracting:"),function(_53,_54,_55){
with(_53){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_53,TNStrophePubSubNodeRetrievedNotification,_53);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubItemRetractedNotification,_53);
}
}),new objj_method(sel_getUid("subscribe"),function(_56,_57){
with(_56){
objj_msgSend(_56,"subscribeWithOptions:",nil);
}
}),new objj_method(sel_getUid("subscribeWithOptions:"),function(_58,_59,_5a){
with(_58){
var uid=objj_msgSend(_connection,"getUniqueId"),_5b=objj_msgSend(TNStropheStanza,"iq"),_5c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_5b,"setType:","set");
objj_msgSend(_5b,"setID:",uid);
objj_msgSend(_5b,"setTo:",_pubSubServer);
objj_msgSend(_5b,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_5b,"addChildWithName:andAttributes:","subscribe",{"node":_nodeName,"jid":objj_msgSend(objj_msgSend(_connection,"JID"),"bare")});
if(_5a&&objj_msgSend(_5a,"count")>0){
objj_msgSend(subscribeStanza,"up");
objj_msgSend(subscribeStanza,"addChildWithName:","options");
objj_msgSend(subscribeStanza,"addChildWithName:andAttributes:","x",{"xmlns":Strophe.NS.X_DATA,"type":"submit"});
objj_msgSend(subscribeStanza,"addChildWithName:andAttributes:","field",{"var":"FORM_TYPE","type":"hidden"});
objj_msgSend(subscribeStanza,"addChildWithName:","value");
objj_msgSend(subscribeStanza,"addTextNode:",Strophe.NS.PUBSUB_SUBSCRIBE_OPTIONS);
objj_msgSend(subscribeStanza,"up");
objj_msgSend(subscribeStanza,"up");
var _5d=objj_msgSend(_5a,"allKeys");
for(var i=0;i<objj_msgSend(_5d,"count");i++){
var key=objj_msgSend(_5d,"objectAtIndex:",i),_5e=objj_msgSend(_5a,"valueForKey:",key);
objj_msgSend(subscribeStanza,"addChildWithName:andAttributes:","field",{"var":key});
objj_msgSend(subscribeStanza,"addChildWithName:","value");
objj_msgSend(subscribeStanza,"addTextNode:",_5e);
objj_msgSend(subscribeStanza,"up");
objj_msgSend(subscribeStanza,"up");
}
}
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didSubscribe:"),_58,_5c);
objj_msgSend(_connection,"send:",_5b);
}
}),new objj_method(sel_getUid("_didSubscribe:"),function(_5f,_60,_61){
with(_5f){
if(objj_msgSend(_61,"type")=="result"){
var _62=objj_msgSend(_61,"firstChildWithName:","subscription"),_63=objj_msgSend(_62,"valueForAttribute:","subid"),_64=objj_msgSend(_62,"valueForAttribute:","subscription");
if(objj_msgSend(_63,"length")>0){
objj_msgSend(_subscriptionIDs,"addObject:",_63);
}
if(_64==="subscribed"){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeSubscribedNotification,_5f);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:subscribed:"))){
objj_msgSend(_delegate,"pubSubNode:subscribed:",_5f,YES);
}
}
objj_msgSend(_5f,"_setEventHandler");
}else{
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:subscribed:"))){
objj_msgSend(_delegate,"pubSubNode:subscribed:",_5f,NO);
}
CPLog.error("Cannot subscribe the pubsub node");
CPLog.error(_61);
}
return NO;
}
}),new objj_method(sel_getUid("addSubscriptionID:"),function(_65,_66,_67){
with(_65){
objj_msgSend(_subscriptionIDs,"addObject:",_67);
}
}),new objj_method(sel_getUid("unsubscribeWithSubID:"),function(_68,_69,_6a){
with(_68){
var uid=objj_msgSend(_connection,"getUniqueId"),_6b=objj_msgSend(TNStropheStanza,"iq"),_6c=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",uid,"id");
objj_msgSend(_6b,"setType:","set");
objj_msgSend(_6b,"setID:",uid);
objj_msgSend(_6b,"setTo:",_pubSubServer);
objj_msgSend(_6b,"addChildWithName:andAttributes:","pubsub",{"xmlns":Strophe.NS.PUBSUB});
objj_msgSend(_6b,"addChildWithName:andAttributes:","unsubscribe",{"node":_nodeName,"jid":objj_msgSend(objj_msgSend(_connection,"JID"),"bare")});
if(_6a){
objj_msgSend(_6b,"setValue:forAttribute:",_6a,"subid");
}
objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didUnsubscribe:"),_68,_6c);
objj_msgSend(_connection,"send:",_6b);
}
}),new objj_method(sel_getUid("unsubscribe"),function(_6d,_6e){
with(_6d){
if(objj_msgSend(_subscriptionIDs,"count")>0){
for(var i=0;i<objj_msgSend(_subscriptionIDs,"count");i++){
objj_msgSend(_6d,"unsubscribeWithSubID:",objj_msgSend(_subscriptionIDs,"objectAtIndex:",i));
}
}else{
objj_msgSend(_6d,"unsubscribeWithSubID:",nil);
}
}
}),new objj_method(sel_getUid("_didUnsubscribe:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(_71,"type")=="result"){
var _72=objj_msgSend(CPDictionary,"dictionary"),_73=objj_msgSend(objj_msgSend(objj_msgSend(_71,"firstChildWithName:","pubsub"),"firstChildWithName:","subscription"),"valueForAttribute:","subid");
if(objj_msgSend(_73,"length")>0){
objj_msgSend(_subscriptionIDs,"removeObject:",_73);
objj_msgSend(_72,"setObject:forKey:",_73,"subscriptionID");
}else{
if(objj_msgSend(_subscriptionIDs,"count")===1){
objj_msgSend(_subscriptionIDs,"removeAllObjects");
}
}
if(objj_msgSend(_subscriptionIDs,"count")===0){
if(_eventSelectorID){
objj_msgSend(_connection,"deleteRegisteredSelector:",_eventSelectorID);
_eventSelectorID=nil;
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStrophePubSubNodeUnsubscribedNotification,_6f,_72);
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:unsubscribed:"))){
objj_msgSend(_delegate,"pubSubNode:unsubscribed:",_6f,YES);
}
}else{
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:unsubscribed:"))){
objj_msgSend(_delegate,"pubSubNode:unsubscribed:",_6f,NO);
}
CPLog.error("Cannot unsubscribe the pubsub node");
CPLog.error(_71);
}
return NO;
}
}),new objj_method(sel_getUid("numberOfSubscriptions"),function(_74,_75){
with(_74){
return objj_msgSend(_subscriptionIDs,"count");
}
}),new objj_method(sel_getUid("_setEventHandler"),function(_76,_77){
with(_76){
var _78=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","message","name",objj_msgSend(_pubSubServer,"node"),"from");
_eventSelectorID=objj_msgSend(_connection,"registerSelector:ofObject:withDict:",sel_getUid("_didReceiveEvent:"),_76,_78);
}
}),new objj_method(sel_getUid("_didReceiveEvent:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(_7b,"firstChildWithName:","event");
if(objj_msgSend(_7c,"namespace")!=Strophe.NS.PUBSUB_EVENT){
return YES;
}
if(objj_msgSend(_7c,"containsChildrenWithName:","subscription")){
var _7d=objj_msgSend(_7c,"firstChildWithName:","subscription"),_7e=objj_msgSend(_7d,"valueForAttribute:","subscription"),_7f=objj_msgSend(_7d,"valueForAttribute:","node");
if(_7e==="subscribed"&&_7f===_nodeName){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",TNStrophePubSubNodeSubscribedNotification,_79);
}
return YES;
}
if(_nodeName!=objj_msgSend(objj_msgSend(_7c,"firstChildWithName:","items"),"valueForAttribute:","node")){
return YES;
}
if(_delegate&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pubSubNode:receivedEvent:"))){
objj_msgSend(_delegate,"pubSubNode:receivedEvent:",_79,_7b);
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",TNStrophePubSubNodeEventNotification,_79,_7b);
return YES;
}
}),new objj_method(sel_getUid("description"),function(_80,_81){
with(_80){
return _nodeName;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("registerSelector:ofObject:forPubSubEventWithConnection:"),function(_82,_83,_84,_85,_86){
with(_82){
var _87=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","message","name","headline","type",{"matchBare":YES},"options",Strophe.NS.PUBSUB_EVENT,"namespace");
return objj_msgSend(_86,"registerSelector:ofObject:withDict:",_84,_85,_87);
}
}),new objj_method(sel_getUid("pubSubNodeWithNodeName:connection:pubSubServer:"),function(_88,_89,_8a,_8b,_8c){
with(_88){
return objj_msgSend(objj_msgSend(TNPubSubNode,"alloc"),"initWithNodeName:connection:pubSubServer:",_8a,_8b,_8c);
}
}),new objj_method(sel_getUid("pubSubNodeWithNodeName:connection:pubSubServer:subscriptionIDs:"),function(_8d,_8e,_8f,_90,_91,_92){
with(_8d){
return objj_msgSend(objj_msgSend(TNPubSubNode,"alloc"),"initWithNodeName:connection:pubSubServer:subscriptionIDs:",_8f,_90,_91,_92);
}
})]);
e;