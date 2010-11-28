@STATIC;1.0;p;19;StropheCappuccino.jt;1163;@STATIC;1.0;i;28;Resources/Strophe/strophe.jsi;25;Resources/Strophe/sha1.jsi;14;TNStropheJID.ji;17;TNStropheStanza.ji;16;TNStropheGroup.ji;21;TNStropheConnection.ji;18;TNStropheContact.ji;17;TNStropheRoster.ji;15;TNBase64Image.ji;10;TNPubSub.ji;22;MUC/TNStropheMUCRoom.jt;887;objj_executeFile("Resources/Strophe/strophe.js", YES);
objj_executeFile("Resources/Strophe/sha1.js", YES);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNStropheStanza.j", YES);
objj_executeFile("TNStropheGroup.j", YES);
objj_executeFile("TNStropheConnection.j", YES);
objj_executeFile("TNStropheContact.j", YES);
objj_executeFile("TNStropheRoster.j", YES);
objj_executeFile("TNBase64Image.j", YES);
objj_executeFile("TNPubSub.j", YES);
objj_executeFile("MUC/TNStropheMUCRoom.j", YES);
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "CAPS", "http://jabber.org/protocol/caps");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "DELAY", "urn:xmpp:delay");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "X_DATA", "jabber:x:data");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PING", "urn:xmpp:ping");

p;15;TNBase64Image.jt;2579;@STATIC;1.0;I;23;Foundation/Foundation.jt;2532;objj_executeFile("Foundation/Foundation.j", NO);
{var the_class = objj_allocateClassPair(CPImage, "TNBase64Image"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_base64EncodedData"), new objj_ivar("_contentType")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_base64EncodedData"), function $TNBase64Image___base64EncodedData(self, _cmd)
{ with(self)
{
return _base64EncodedData;
}
},["id"]),
new objj_method(sel_getUid("setBase64EncodedData:"), function $TNBase64Image__setBase64EncodedData_(self, _cmd, newValue)
{ with(self)
{
_base64EncodedData = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_contentType"), function $TNBase64Image___contentType(self, _cmd)
{ with(self)
{
return _contentType;
}
},["id"]),
new objj_method(sel_getUid("setContentType:"), function $TNBase64Image__setContentType_(self, _cmd, newValue)
{ with(self)
{
_contentType = newValue;
}
},["void","id"]), new objj_method(sel_getUid("load"), function $TNBase64Image__load(self, _cmd)
{ with(self)
{
    if (_loadStatus == CPImageLoadStatusLoading || _loadStatus == CPImageLoadStatusCompleted)
        return;
    var data = "data:" + _contentType + ";base64," + _base64EncodedData;
    _loadStatus = CPImageLoadStatusLoading;
    _image = new Image();
    _image.addEventListener('load', function(){
        objj_msgSend(self, "_imageDidLoad");
    });
    _filename = data;
    _image.src = data;
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("base64ImageWithContentType:andData:"), function $TNBase64Image__base64ImageWithContentType_andData_(self, _cmd, aContentType, someBase64Data)
{ with(self)
{
    var img = objj_msgSend(objj_msgSend(TNBase64Image, "alloc"), "init");
    objj_msgSend(img, "setBase64EncodedData:", someBase64Data);
    objj_msgSend(img, "setContentType:", aContentType);
    objj_msgSend(img, "load");
    return img;
}
},["TNBase64Image","CPString","CPString"]), new objj_method(sel_getUid("base64ImageWithContentType:data:delegate:"), function $TNBase64Image__base64ImageWithContentType_data_delegate_(self, _cmd, aContentType, someBase64Data, aDelegate)
{ with(self)
{
    var img = objj_msgSend(objj_msgSend(TNBase64Image, "alloc"), "init");
    objj_msgSend(img, "setBase64EncodedData:", someBase64Data);
    objj_msgSend(img, "setContentType:", aContentType);
    objj_msgSend(img, "setDelegate:", aDelegate);
    objj_msgSend(img, "load");
    return img;
}
},["TNBase64Image","CPString","CPString","id"])]);
}

p;10;TNPubSub.jt;955;@STATIC;1.0;i;21;PubSub/TNPubSubNode.ji;27;PubSub/TNPubSubController.jt;879;objj_executeFile("PubSub/TNPubSubNode.j", YES);
objj_executeFile("PubSub/TNPubSubController.j", YES);
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB", "http://jabber.org/protocol/pubsub");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB_EVENT", "http://jabber.org/protocol/pubsub#event");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB_OWNER", "http://jabber.org/protocol/pubsub#owner");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB_NODE_CONFIG", "http://jabber.org/protocol/pubsub#node_config");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB_NOTIFY", "http://jabber.org/protocol/pubsub+notify");
objj_msgSend(TNStropheConnection, "addNamespaceWithName:value:", "PUBSUB_SUBSCRIBE OPTIONS", "http://jabber.org/protocol/pubsub#subscribe_options");

p;21;TNStropheConnection.jt;21959;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;17;TNStropheStanza.ji;25;Resources/Strophe/sha1.jsi;18;TNStropheGlobals.jt;21817;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNStropheStanza.j", YES);
objj_executeFile("Resources/Strophe/sha1.js", YES);
objj_executeFile("TNStropheGlobals.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNStropheConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_connected"), new objj_ivar("_features"), new objj_ivar("_clientNode"), new objj_ivar("_identityCategory"), new objj_ivar("_identityName"), new objj_ivar("_identityType"), new objj_ivar("_JID"), new objj_ivar("_password"), new objj_ivar("_delegate"), new objj_ivar("_maxConnections"), new objj_ivar("_connectionTimeout"), new objj_ivar("_registeredHandlerDict"), new objj_ivar("_boshService"), new objj_ivar("_connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("isConnected"), function $TNStropheConnection__isConnected(self, _cmd)
{ with(self)
{
return _connected;
}
},["id"]),
new objj_method(sel_getUid("_setConnected:"), function $TNStropheConnection___setConnected_(self, _cmd, newValue)
{ with(self)
{
_connected = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("_features"), function $TNStropheConnection___features(self, _cmd)
{ with(self)
{
return _features;
}
},["id"]),
new objj_method(sel_getUid("clientNode"), function $TNStropheConnection__clientNode(self, _cmd)
{ with(self)
{
return _clientNode;
}
},["id"]),
new objj_method(sel_getUid("setClientNode:"), function $TNStropheConnection__setClientNode_(self, _cmd, newValue)
{ with(self)
{
_clientNode = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("identityCategory"), function $TNStropheConnection__identityCategory(self, _cmd)
{ with(self)
{
return _identityCategory;
}
},["id"]),
new objj_method(sel_getUid("setIdentityCategory:"), function $TNStropheConnection__setIdentityCategory_(self, _cmd, newValue)
{ with(self)
{
_identityCategory = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("identityName"), function $TNStropheConnection__identityName(self, _cmd)
{ with(self)
{
return _identityName;
}
},["id"]),
new objj_method(sel_getUid("setIdentityName:"), function $TNStropheConnection__setIdentityName_(self, _cmd, newValue)
{ with(self)
{
_identityName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("identityType"), function $TNStropheConnection__identityType(self, _cmd)
{ with(self)
{
return _identityType;
}
},["id"]),
new objj_method(sel_getUid("setIdentityType:"), function $TNStropheConnection__setIdentityType_(self, _cmd, newValue)
{ with(self)
{
_identityType = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("JID"), function $TNStropheConnection__JID(self, _cmd)
{ with(self)
{
return _JID;
}
},["id"]),
new objj_method(sel_getUid("setJID:"), function $TNStropheConnection__setJID_(self, _cmd, newValue)
{ with(self)
{
_JID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("password"), function $TNStropheConnection__password(self, _cmd)
{ with(self)
{
return _password;
}
},["id"]),
new objj_method(sel_getUid("setPassword:"), function $TNStropheConnection__setPassword_(self, _cmd, newValue)
{ with(self)
{
_password = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $TNStropheConnection__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $TNStropheConnection__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("maxConnections"), function $TNStropheConnection__maxConnections(self, _cmd)
{ with(self)
{
return _maxConnections;
}
},["id"]),
new objj_method(sel_getUid("setMaxConnections:"), function $TNStropheConnection__setMaxConnections_(self, _cmd, newValue)
{ with(self)
{
_maxConnections = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("connectionTimeout"), function $TNStropheConnection__connectionTimeout(self, _cmd)
{ with(self)
{
return _connectionTimeout;
}
},["id"]),
new objj_method(sel_getUid("setConnectionTimeout:"), function $TNStropheConnection__setConnectionTimeout_(self, _cmd, newValue)
{ with(self)
{
_connectionTimeout = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("connection"), function $TNStropheConnection__connection(self, _cmd)
{ with(self)
{
return _connection;
}
},["id"]),
new objj_method(sel_getUid("_setConnection:"), function $TNStropheConnection___setConnection_(self, _cmd, newValue)
{ with(self)
{
_connection = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithService:"), function $TNStropheConnection__initWithService_(self, _cmd, aService)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheConnection").super_class }, "init"))
    {
        _boshService = aService;
        _registeredHandlerDict = objj_msgSend(CPDictionary, "dictionary");
        _connected = NO;
        _maxConnections = 10;
        _connectionTimeout = 3600;
        _connection = new Strophe.Connection(_boshService);
        _clientNode = "http://cappuccino.org";
        _identityCategory = "client";
        _identityName = "StropheCappuccino";
        _identityType = "web";
        _features = [ Strophe.NS.CAPS,
                                    Strophe.NS.DISCO_INFO,
                                    Strophe.NS.DISCO_ITEMS];
    }
    return self;
}
},["id","CPString"]), new objj_method(sel_getUid("initWithService:JID:password:"), function $TNStropheConnection__initWithService_JID_password_(self, _cmd, aService, aJID, aPassword)
{ with(self)
{
    if (self = objj_msgSend(self, "initWithService:", aService))
    {
        _JID = aJID;
        _password = aPassword;
    }
    return self;
}
},["id","CPString","TNStropheJID","CPString"]), new objj_method(sel_getUid("connect"), function $TNStropheConnection__connect(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "registerSelector:ofObject:withDict:", sel_getUid("_didReceivePing:"), self, objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "iq", "name", "get", "type"));
    _connection.connect(objj_msgSend(_JID, "full"), _password, function (status, errorCond)
    {
        var selector,
            notificationName;
        switch (status)
        {
            case Strophe.Status.ERROR:
                selector = sel_getUid("onStropheError:");
                notificationName = TNStropheConnectionStatusError;
                break;
            case Strophe.Status.CONNECTING:
                selector = sel_getUid("onStropheConnecting:");
                notificationName = TNStropheConnectionStatusConnecting;
                break;
            case Strophe.Status.CONNFAIL:
                selector = sel_getUid("onStropheConnectFail:");
                notificationName = TNStropheConnectionStatusConnectionFailure;
                break;
            case Strophe.Status.AUTHENTICATING:
                selector = sel_getUid("onStropheAuthenticating:");
                notificationName = TNStropheConnectionStatusAuthenticating;
                break;
            case Strophe.Status.AUTHFAIL:
                selector = sel_getUid("onStropheAuthFail:");
                notificationName = TNStropheConnectionStatusAuthFailure;
                break;
            case Strophe.Status.DISCONNECTING:
                selector = sel_getUid("onStropheDisconnecting:");
                notificationName = TNStropheConnectionStatusDisconnecting;
                break;
            case Strophe.Status.DISCONNECTED:
                selector = sel_getUid("onStropheDisconnected:");
                notificationName = TNStropheConnectionStatusDisconnected;
                _connected = NO;
                break;
            case Strophe.Status.CONNECTED:
                _connection.send($pres().tree());
                objj_msgSend(self, "sendCAPS");
                selector = sel_getUid("onStropheConnected:");
                notificationName = TNStropheConnectionStatusConnected;
                _connected = YES;
                break;
        }
        if (objj_msgSend(_delegate, "respondsToSelector:", selector))
            objj_msgSend(_delegate, "performSelector:withObject:", selector, self);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", notificationName, self);
    }, _connectionTimeout, _maxConnections);
}
},["void"]), new objj_method(sel_getUid("disconnect"), function $TNStropheConnection__disconnect(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheConnectionStatusWillDisconnect, self);
    _connection.disconnect();
}
},["void"]), new objj_method(sel_getUid("reset"), function $TNStropheConnection__reset(self, _cmd)
{ with(self)
{
    if (_connection)
        _connection.reset();
}
},["void"]), new objj_method(sel_getUid("pause"), function $TNStropheConnection__pause(self, _cmd)
{ with(self)
{
    if (_connection)
        _connection.pause();
}
},["void"]), new objj_method(sel_getUid("resume"), function $TNStropheConnection__resume(self, _cmd)
{ with(self)
{
    if (_connection)
        _connection.pause();
}
},["void"]), new objj_method(sel_getUid("flush"), function $TNStropheConnection__flush(self, _cmd)
{ with(self)
{
    _connection.flush();
}
},["void"]), new objj_method(sel_getUid("_didReceivePing:"), function $TNStropheConnection___didReceivePing_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "ping") && objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "ping"), "namespace") == Strophe.NS.PING)
    {
        CPLog.debug("Ping received. Sending pong.");
        objj_msgSend(self, "send:", objj_msgSend(TNStropheStanza, "iqWithAttributes:", {'to': objj_msgSend(objj_msgSend(aStanza, "from"), "bare"), 'id': objj_msgSend(aStanza, "ID"), 'type': 'result'}));
    }
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("addFeature:"), function $TNStropheConnection__addFeature_(self, _cmd, aFeatureNamespace)
{ with(self)
{
    objj_msgSend(_features, "addObject:", aFeatureNamespace);
}
},["void","CPString"]), new objj_method(sel_getUid("removeFeature:"), function $TNStropheConnection__removeFeature_(self, _cmd, aFeatureNamespace)
{ with(self)
{
    objj_msgSend(_features, "removeObjectIdenticalTo:", aFeatureNamespace);
}
},["void","CPString"]), new objj_method(sel_getUid("_clientVer"), function $TNStropheConnection___clientVer(self, _cmd)
{ with(self)
{
    return SHA1.b64_sha1(_features.join());
}
},["CPString"]), new objj_method(sel_getUid("sendCAPS"), function $TNStropheConnection__sendCAPS(self, _cmd)
{ with(self)
{
    var caps = objj_msgSend(TNStropheStanza, "presence");
    objj_msgSend(caps, "addChildWithName:andAttributes:", "c", { "xmlns":Strophe.NS.CAPS, "node":_clientNode, "hash":"sha-1", "ver":objj_msgSend(self, "_clientVer") });
    objj_msgSend(self, "registerSelector:ofObject:withDict:", sel_getUid("handleFeaturesDisco:"), self, objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "iq", "name", "get", "type", Strophe.NS.DISCO_INFO, "namespace"));
    objj_msgSend(self, "send:", caps);
}
},["void"]), new objj_method(sel_getUid("handleFeaturesDisco:"), function $TNStropheConnection__handleFeaturesDisco_(self, _cmd, aStanza)
{ with(self)
{
    var resp = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"id":objj_msgSend(self, "getUniqueId"), "type":"result"});
    objj_msgSend(resp, "setTo:", objj_msgSend(aStanza, "from"));
    objj_msgSend(resp, "addChildWithName:andAttributes:", "query", {"xmlns":Strophe.NS.DISCO_INFO, "node":(_clientNode + '#' + objj_msgSend(self, "_clientVer"))});
    objj_msgSend(resp, "addChildWithName:andAttributes:", "identity", {"category":_identityCategory, "name":_identityName, "type":_identityType});
    objj_msgSend(resp, "up");
    for (var i = 0; i < objj_msgSend(_features, "count"); i++)
    {
        objj_msgSend(resp, "addChildWithName:andAttributes:", "feature", {"var":objj_msgSend(_features, "objectAtIndex:", i)});
        objj_msgSend(resp, "up");
    }
    objj_msgSend(self, "send:", resp);
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("send:"), function $TNStropheConnection__send_(self, _cmd, aStanza)
{ with(self)
{
    CPLog.trace("StropheCappuccino Stanza Send:")
    CPLog.trace(aStanza);
    _connection.send(objj_msgSend(aStanza, "tree"));
}
},["void","TNStropheStanza"]), new objj_method(sel_getUid("publishPEPPayload:toNode:"), function $TNStropheConnection__publishPEPPayload_toNode_(self, _cmd, aPayload, aNode)
{ with(self)
{
    var uid = objj_msgSend(self, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type":"set", "id":uid}),
        params = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", uid, "id");
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns":Strophe.NS.PUBSUB})
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "publish", {"node":aNode});
    objj_msgSend(stanza, "addChildWithName:", "item");
    objj_msgSend(stanza, "addNode:", aPayload);
    objj_msgSend(self, "registerSelector:ofObject:withDict:", sel_getUid("_didPublishPEP:"), self, params)
    objj_msgSend(self, "send:", stanza);
}
},["void","TNXMLNode","CPString"]), new objj_method(sel_getUid("_didPublishPEP:"), function $TNStropheConnection___didPublishPEP_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
        CPLog.debug("Publish succeeded!");
    else
        CPLog.error("Cannot publish the pubsub item in node with name: " + _nodeName);
    return NO;
}
},["void","TNStropheStanza"]), new objj_method(sel_getUid("getUniqueId"), function $TNStropheConnection__getUniqueId(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "getUniqueIdWithSuffix:", null);
}
},["CPString"]), new objj_method(sel_getUid("getUniqueIdWithSuffix:"), function $TNStropheConnection__getUniqueIdWithSuffix_(self, _cmd, suffix)
{ with(self)
{
    return _connection.getUniqueId(suffix);
}
},["CPString","CPString"]), new objj_method(sel_getUid("registerSelector:ofObject:withDict:"), function $TNStropheConnection__registerSelector_ofObject_withDict_(self, _cmd, aSelector, anObject, aDict)
{ with(self)
{
    var from = (objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "class") == CPString) ? objj_msgSend(aDict, "valueForKey:", "from") : objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "stringValue"),
        handlerId = _connection.addHandler(function(stanza) {
                var stanzaObject = objj_msgSend(TNStropheStanza, "stanzaWithStanza:", stanza);
                CPLog.trace("StropheCappuccino stanza received that trigger selector : " + objj_msgSend(anObject, "class") + "." + aSelector);
                CPLog.trace(stanzaObject);
                return objj_msgSend(anObject, "performSelector:withObject:", aSelector, stanzaObject);
            },
            objj_msgSend(aDict, "valueForKey:", "namespace"),
            objj_msgSend(aDict, "valueForKey:", "name"),
            objj_msgSend(aDict, "valueForKey:", "type"),
            objj_msgSend(aDict, "valueForKey:", "id"),
            from,
            objj_msgSend(aDict, "valueForKey:", "options"));
    return handlerId;
}
},["id","SEL","CPObject","id"]), new objj_method(sel_getUid("registerSelector:ofObject:withDict:userInfo:"), function $TNStropheConnection__registerSelector_ofObject_withDict_userInfo_(self, _cmd, aSelector, anObject, aDict, someUserInfo)
{ with(self)
{
    var from = (objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "class") == CPString) ? objj_msgSend(aDict, "valueForKey:", "from") : objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "stringValue"),
        handlerId = _connection.addHandler(function(stanza) {
                var stanzaObject = objj_msgSend(TNStropheStanza, "stanzaWithStanza:", stanza);
                CPLog.trace("StropheCappuccino stanza received that trigger selector : " + objj_msgSend(anObject, "class") + "." + aSelector);
                CPLog.trace(stanzaObject);
                return objj_msgSend(anObject, "performSelector:withObject:withObject:", aSelector, stanzaObject, someUserInfo);
            },
            objj_msgSend(aDict, "valueForKey:", "namespace"),
            objj_msgSend(aDict, "valueForKey:", "name"),
            objj_msgSend(aDict, "valueForKey:", "type"),
            objj_msgSend(aDict, "valueForKey:", "id"),
            from,
            objj_msgSend(aDict, "valueForKey:", "options"));
    return handlerId;
}
},["id","SEL","CPObject","id","id"]), new objj_method(sel_getUid("registerTimeoutSelector:ofObject:withDict:forTimeout:"), function $TNStropheConnection__registerTimeoutSelector_ofObject_withDict_forTimeout_(self, _cmd, aTimeoutSelector, anObject, aDict, aTimeout)
{ with(self)
{
    var from = (objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "class") == CPString) ? objj_msgSend(aDict, "valueForKey:", "from") : objj_msgSend(objj_msgSend(aDict, "valueForKey:", "from"), "stringValue"),
        handlerId = _connection.addTimedHandler(aTimeout, function(stanza) {
                if (!stanza)
                {
                    CPLog.trace("StropheCappuccino stanza timeout that trigger selector : " + objj_msgSend(anObject, "class") + "." + aTimeoutSelector);
                    return objj_msgSend(anObject, "performSelector:", aTimeoutSelector);
                }
                return NO;
            },
            objj_msgSend(aDict, "valueForKey:", "namespace"),
            objj_msgSend(aDict, "valueForKey:", "name"),
            objj_msgSend(aDict, "valueForKey:", "type"),
            objj_msgSend(aDict, "valueForKey:", "id"),
            from,
            objj_msgSend(aDict, "valueForKey:", "options"));
    return handlerId;
}
},["id","SEL","CPObject","id","float"]), new objj_method(sel_getUid("deleteRegisteredSelector:"), function $TNStropheConnection__deleteRegisteredSelector_(self, _cmd, aHandlerId)
{ with(self)
{
    _connection.deleteHandler(aHandlerId)
}
},["void","id"]), new objj_method(sel_getUid("deleteRegisteredTimedSelector:"), function $TNStropheConnection__deleteRegisteredTimedSelector_(self, _cmd, aTimedHandlerId)
{ with(self)
{
    _connection.deleteTimedHandler(aTimedHandlerId)
}
},["void","id"]), new objj_method(sel_getUid("rawInputRegisterSelector:ofObject:"), function $TNStropheConnection__rawInputRegisterSelector_ofObject_(self, _cmd, aSelector, anObject)
{ with(self)
{
    _connection.xmlInput = function(elem){
        objj_msgSend(anObject, "performSelector:withObject:", aSelector, objj_msgSend(TNStropheStanza, "nodeWithXMLNode:", elem));
    }
}
},["void","SEL","id"]), new objj_method(sel_getUid("rawOutputRegisterSelector:ofObject:"), function $TNStropheConnection__rawOutputRegisterSelector_ofObject_(self, _cmd, aSelector, anObject)
{ with(self)
{
    _connection.xmlOutput = function(elem){
        objj_msgSend(anObject, "performSelector:withObject:", aSelector, objj_msgSend(TNStropheStanza, "nodeWithXMLNode:", elem));
    }
}
},["void","SEL","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("addNamespaceWithName:value:"), function $TNStropheConnection__addNamespaceWithName_value_(self, _cmd, aName, aValue)
{ with(self)
{
    Strophe.addNamespace(aName, aValue);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("connectionWithService:"), function $TNStropheConnection__connectionWithService_(self, _cmd, aService)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheConnection, "alloc"), "initWithService:", aService);
}
},["TNStropheConnection","CPString"]), new objj_method(sel_getUid("connectionWithService:JID:password:"), function $TNStropheConnection__connectionWithService_JID_password_(self, _cmd, aService, aJID, aPassword)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheConnection, "alloc"), "initWithService:JID:password:", aService, aJID, aPassword);
}
},["TNStropheConnection","CPString","TNStropheJID","CPString"])]);
}
{
var the_class = objj_getClass("TNStropheConnection")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"TNStropheConnection\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $TNStropheConnection__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheConnection").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        _JID = objj_msgSend(aCoder, "decodeObjectForKey:", "_JID");
        _password = objj_msgSend(aCoder, "decodeObjectForKey:", "_password");
        _delegate = objj_msgSend(aCoder, "decodeObjectForKey:", "_delegate");
        _boshService = objj_msgSend(aCoder, "decodeObjectForKey:", "_boshService");
        _connection = objj_msgSend(aCoder, "decodeObjectForKey:", "_connection");
        _audioTagReceive = objj_msgSend(aCoder, "decodeObjectForKey:", "_audioTagReceive");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TNStropheConnection__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _JID, "_JID");
    objj_msgSend(aCoder, "encodeObject:forKey:", _password, "_password");
    objj_msgSend(aCoder, "encodeObject:forKey:", _boshService, "_boshService");
    objj_msgSend(aCoder, "encodeObject:forKey:", _connection, "_connection");
    objj_msgSend(aCoder, "encodeObject:forKey:", _registeredHandlerDict, "_registeredHandlerDict");
    objj_msgSend(aCoder, "encodeObject:forKey:", _audioTagReceive, "_audioTagReceive");
}
},["void","CPCoder"])]);
}

p;18;TNStropheContact.jt;27706;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;16;TNStropheGroup.ji;21;TNStropheConnection.ji;15;TNBase64Image.ji;18;TNStropheGlobals.jt;27549;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNStropheGroup.j", YES);
objj_executeFile("TNStropheConnection.j", YES);
objj_executeFile("TNBase64Image.j", YES);
objj_executeFile("TNStropheGlobals.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNStropheContact"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_messagesQueue"), new objj_ivar("_resources"), new objj_ivar("_statusIcon"), new objj_ivar("_numberOfEvents"), new objj_ivar("_JID"), new objj_ivar("_groupName"), new objj_ivar("_nickname"), new objj_ivar("_nodeName"), new objj_ivar("_type"), new objj_ivar("_vCard"), new objj_ivar("_XMPPShow"), new objj_ivar("_XMPPStatus"), new objj_ivar("_subscription"), new objj_ivar("_avatar"), new objj_ivar("_connection"), new objj_ivar("_isComposing"), new objj_ivar("_askingVCard"), new objj_ivar("_imageAway"), new objj_ivar("_imageNewError"), new objj_ivar("_imageNewMessage"), new objj_ivar("_imageOffline"), new objj_ivar("_imageOnline"), new objj_ivar("_statusReminder")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("messagesQueue"), function $TNStropheContact__messagesQueue(self, _cmd)
{ with(self)
{
return _messagesQueue;
}
},["id"]),
new objj_method(sel_getUid("setMessagesQueue:"), function $TNStropheContact__setMessagesQueue_(self, _cmd, newValue)
{ with(self)
{
_messagesQueue = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("resources"), function $TNStropheContact__resources(self, _cmd)
{ with(self)
{
return _resources;
}
},["id"]),
new objj_method(sel_getUid("setResources:"), function $TNStropheContact__setResources_(self, _cmd, newValue)
{ with(self)
{
_resources = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("statusIcon"), function $TNStropheContact__statusIcon(self, _cmd)
{ with(self)
{
return _statusIcon;
}
},["id"]),
new objj_method(sel_getUid("setStatusIcon:"), function $TNStropheContact__setStatusIcon_(self, _cmd, newValue)
{ with(self)
{
_statusIcon = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("numberOfEvents"), function $TNStropheContact__numberOfEvents(self, _cmd)
{ with(self)
{
return _numberOfEvents;
}
},["id"]),
new objj_method(sel_getUid("setNumberOfEvents:"), function $TNStropheContact__setNumberOfEvents_(self, _cmd, newValue)
{ with(self)
{
_numberOfEvents = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("JID"), function $TNStropheContact__JID(self, _cmd)
{ with(self)
{
return _JID;
}
},["id"]),
new objj_method(sel_getUid("setJID:"), function $TNStropheContact__setJID_(self, _cmd, newValue)
{ with(self)
{
_JID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("groupName"), function $TNStropheContact__groupName(self, _cmd)
{ with(self)
{
return _groupName;
}
},["id"]),
new objj_method(sel_getUid("setGroupName:"), function $TNStropheContact__setGroupName_(self, _cmd, newValue)
{ with(self)
{
_groupName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("nickname"), function $TNStropheContact__nickname(self, _cmd)
{ with(self)
{
return _nickname;
}
},["id"]),
new objj_method(sel_getUid("setNickname:"), function $TNStropheContact__setNickname_(self, _cmd, newValue)
{ with(self)
{
_nickname = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("nodeName"), function $TNStropheContact__nodeName(self, _cmd)
{ with(self)
{
return _nodeName;
}
},["id"]),
new objj_method(sel_getUid("setNodeName:"), function $TNStropheContact__setNodeName_(self, _cmd, newValue)
{ with(self)
{
_nodeName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("type"), function $TNStropheContact__type(self, _cmd)
{ with(self)
{
return _type;
}
},["id"]),
new objj_method(sel_getUid("setType:"), function $TNStropheContact__setType_(self, _cmd, newValue)
{ with(self)
{
_type = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("vCard"), function $TNStropheContact__vCard(self, _cmd)
{ with(self)
{
return _vCard;
}
},["id"]),
new objj_method(sel_getUid("setVCard:"), function $TNStropheContact__setVCard_(self, _cmd, newValue)
{ with(self)
{
_vCard = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("XMPPShow"), function $TNStropheContact__XMPPShow(self, _cmd)
{ with(self)
{
return _XMPPShow;
}
},["id"]),
new objj_method(sel_getUid("setXMPPShow:"), function $TNStropheContact__setXMPPShow_(self, _cmd, newValue)
{ with(self)
{
_XMPPShow = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("XMPPStatus"), function $TNStropheContact__XMPPStatus(self, _cmd)
{ with(self)
{
return _XMPPStatus;
}
},["id"]),
new objj_method(sel_getUid("setXMPPStatus:"), function $TNStropheContact__setXMPPStatus_(self, _cmd, newValue)
{ with(self)
{
_XMPPStatus = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("subscription"), function $TNStropheContact__subscription(self, _cmd)
{ with(self)
{
return _subscription;
}
},["id"]),
new objj_method(sel_getUid("setSubscription:"), function $TNStropheContact__setSubscription_(self, _cmd, newValue)
{ with(self)
{
_subscription = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("avatar"), function $TNStropheContact__avatar(self, _cmd)
{ with(self)
{
return _avatar;
}
},["id"]),
new objj_method(sel_getUid("setAvatar:"), function $TNStropheContact__setAvatar_(self, _cmd, newValue)
{ with(self)
{
_avatar = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("connection"), function $TNStropheContact__connection(self, _cmd)
{ with(self)
{
return _connection;
}
},["id"]),
new objj_method(sel_getUid("setConnection:"), function $TNStropheContact__setConnection_(self, _cmd, newValue)
{ with(self)
{
_connection = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithConnection:JID:groupName:"), function $TNStropheContact__initWithConnection_JID_groupName_(self, _cmd, aConnection, aJID, aGroupName)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheContact").super_class }, "init"))
    {
        var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
        _imageOffline = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Offline.png"));
        _imageOnline = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Available.png"));
        _imageBusy = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Away.png"));
        _imageAway = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Idle.png"));
        _imageDND = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Blocked.png"));
        _imageNewMessage = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "NewMessage.png"));
        _imageNewError = objj_msgSend(objj_msgSend(CPImage, "alloc"), "initWithContentsOfFile:", objj_msgSend(bundle, "pathForResource:", "Error.png"));
        _type = "contact";
        _statusIcon = _imageOffline;
        _XMPPShow = TNStropheContactStatusOffline;
        _connection = aConnection;
        _messagesQueue = objj_msgSend(CPArray, "array");
        _numberOfEvents = 0;
        _isComposing = NO;
        _askingVCard = NO;
        _resources = objj_msgSend(CPArray, "array");
        _JID = aJID;
        _groupName = aGroupName;
    }
    return self;
}
},["id","TNStropheConnection","TNStropheJID","CPString"]), new objj_method(sel_getUid("_didReceivePresence:"), function $TNStropheContact___didReceivePresence_(self, _cmd, aStanza)
{ with(self)
{
    var resource = objj_msgSend(aStanza, "fromResource"),
        presenceStatus = objj_msgSend(aStanza, "firstChildWithName:", "status");
    objj_msgSend(_JID, "setResource:", objj_msgSend(objj_msgSend(aStanza, "from"), "resource"))
    if (objj_msgSend(_JID, "resource") && (objj_msgSend(_JID, "resource") != "") && !objj_msgSend(_resources, "containsObject:", resource))
        objj_msgSend(_resources, "addObject:", resource);
    switch (objj_msgSend(aStanza, "type"))
    {
        case "error":
            var errorCode = objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "error"), "valueForAttribute:", "code");
            _XMPPShow = TNStropheContactStatusOffline;
            _XMPPStatus = "Error code: " + errorCode;
            _statusIcon = _imageNewError;
            _statusReminder = _imageNewError;
            return NO;
        case "unavailable":
            objj_msgSend(_resources, "removeObject:", resource);
            CPLogConsole("contact become unavailable from resource: " + resource + ". Resources left : " + _resources )
            if (objj_msgSend(_resources, "count") == 0)
            {
                _XMPPShow = TNStropheContactStatusOffline;
                _statusIcon = _imageOffline;
                _statusReminder = _imageOffline;
                if (presenceStatus)
                    _XMPPStatus = objj_msgSend(presenceStatus, "text");
            }
            break;
        case "subscribe":
            _XMPPStatus = "Asking subscribtion";
            break;
        case "subscribed":
            break;
        case "unsubscribe":
            break;
        case "unsubscribed":
            _XMPPStatus = "Unauthorized";
            break;
        default:
            _XMPPShow = TNStropheContactStatusOnline;
            _statusReminder = _imageOnline;
            _statusIcon = _imageOnline;
            if (objj_msgSend(aStanza, "firstChildWithName:", "show"))
            {
                _XMPPShow = objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "show"), "text");
                switch (_XMPPShow)
                {
                    case TNStropheContactStatusBusy:
                        _statusIcon = _imageBusy;
                        _statusReminder = _imageBusy;
                        break;
                    case TNStropheContactStatusAway:
                        _statusIcon = _imageAway;
                        _statusReminder = _imageAway;
                        break;
                    case TNStropheContactStatusDND:
                        _statusIcon = _imageDND;
                        _statusReminder = _imageDND;
                        break;
                }
            }
            if (_numberOfEvents > 0)
                _statusIcon = _imageNewMessage
            if (presenceStatus)
                _XMPPStatus = objj_msgSend(presenceStatus, "text");
            if (objj_msgSend(aStanza, "firstChildWithName:", "x") && objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "x"), "valueForAttribute:", "xmlns") == "vcard-temp:x:update")
                objj_msgSend(self, "getVCard");
            if (!_vCard && !_askingVCard)
                objj_msgSend(self, "getVCard");
            break;
    }
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactPresenceUpdatedNotification, self);
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("sendStatus:"), function $TNStropheContact__sendStatus_(self, _cmd, aStatus)
{ with(self)
{
    var statusStanza = objj_msgSend(TNStropheStanza, "messageTo:withAttributes:", _JID, {"type": "chat"});
    objj_msgSend(statusStanza, "addChildWithName:andAttributes:", aStatus, {"xmlns": "http://jabber.org/protocol/chatstates"});
    objj_msgSend(self, "sendStanza:andRegisterSelector:ofObject:", statusStanza, sel_getUid("_didSendMessage:"), self);
}
},["void","CPString"]), new objj_method(sel_getUid("sendComposing"), function $TNStropheContact__sendComposing(self, _cmd)
{ with(self)
{
    if (!_isComposing)
    {
        objj_msgSend(self, "sendStatus:", "composing");
        _isComposing = YES;
    }
}
},["void"]), new objj_method(sel_getUid("sendComposePaused"), function $TNStropheContact__sendComposePaused(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "sendStatus:", "paused");
    _isComposing = NO;
}
},["void"]), new objj_method(sel_getUid("subscribe"), function $TNStropheContact__subscribe(self, _cmd)
{ with(self)
{
    objj_msgSend(_connection, "send:", objj_msgSend(TNStropheStanza, "presenceTo:withAttributes:bare:", _JID, {"type": "subscribed"}, YES));
}
},["void"]), new objj_method(sel_getUid("unsubscribe"), function $TNStropheContact__unsubscribe(self, _cmd)
{ with(self)
{
    objj_msgSend(_connection, "send:", objj_msgSend(TNStropheStanza, "presenceTo:WwthAttributes:bare:", _JID, {"type": "unsubscribed"}, YES));
}
},["void"]), new objj_method(sel_getUid("askSubscription"), function $TNStropheContact__askSubscription(self, _cmd)
{ with(self)
{
    objj_msgSend(_connection, "send:", objj_msgSend(TNStropheStanza, "presenceTo:withAttributes:bare:", _JID, {"type": "subscribe"}, YES));
}
},["void"]), new objj_method(sel_getUid("setSubscription:"), function $TNStropheContact__setSubscription_(self, _cmd, aSubscription)
{ with(self)
{
    _subcription = aSubscription;
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactSubscriptionUpdatedNotification, self);
}
},["CPString","CPString"]), new objj_method(sel_getUid("description"), function $TNStropheContact__description(self, _cmd)
{ with(self)
{
    return _nickname;
}
},["CPString"]), new objj_method(sel_getUid("getVCard"), function $TNStropheContact__getVCard(self, _cmd)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        vcardStanza = objj_msgSend(TNStropheStanza, "iqTo:withAttributes:bare:", _JID, {"type": "get", "id": uid}, YES),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:",  uid, "id");
    objj_msgSend(vcardStanza, "addChildWithName:andAttributes:", "vCard", {"xmlns": "vcard-temp"});
    _askingVCard = YES;
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceiveVCard:"), self, params);
    objj_msgSend(_connection, "send:", vcardStanza);
}
},["void"]), new objj_method(sel_getUid("_didReceiveVCard:"), function $TNStropheContact___didReceiveVCard_(self, _cmd, aStanza)
{ with(self)
{
    var aVCard = objj_msgSend(aStanza, "firstChildWithName:", "vCard");
    _askingVCard = NO;
    if (aVCard)
    {
        _vCard = aVCard;
        if (!_nickname || (_nickname == objj_msgSend(_JID, "node")))
        {
            if (objj_msgSend(aVCard, "firstChildWithName:", "NAME"))
                _nickname = objj_msgSend(objj_msgSend(aVCard, "firstChildWithName:", "NAME"), "text");
            else
                _nickname = objj_msgSend(_JID, "node")
        }
        var photoNode;
        if (photoNode = objj_msgSend(aVCard, "firstChildWithName:", "PHOTO"))
        {
            var contentType = objj_msgSend(objj_msgSend(photoNode, "firstChildWithName:", "TYPE"), "text"),
                data = objj_msgSend(objj_msgSend(photoNode, "firstChildWithName:", "BINVAL"), "text");
            _avatar = objj_msgSend(TNBase64Image, "base64ImageWithContentType:data:delegate:", contentType, data, self);
        }
        else
        {
            _avatar = nil;
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactVCardReceivedNotification, self);
        }
    }
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("changeNickname:"), function $TNStropheContact__changeNickname_(self, _cmd, newNickname)
{ with(self)
{
    _nickname = newNickname;
    var stanza = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": "set"});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "query",  {'xmlns':Strophe.NS.ROSTER});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "item", {"JID": objj_msgSend(_JID, "bare"), "name": _nickname});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "group", nil);
    objj_msgSend(stanza, "addTextNode:", _groupName);
    objj_msgSend(_connection, "send:", stanza);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactNicknameUpdatedNotification, self);
}
},["void","CPString"]), new objj_method(sel_getUid("changeGroup:"), function $TNStropheContact__changeGroup_(self, _cmd, newGroup)
{ with(self)
{
    objj_msgSend(self, "changeGroupName:", objj_msgSend(newGroup, "name"));
}
},["void","TNStropheGroup"]), new objj_method(sel_getUid("changeGroupName:"), function $TNStropheContact__changeGroupName_(self, _cmd, aNewName)
{ with(self)
{
    var stanza = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": "set"});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "query",  {'xmlns':Strophe.NS.ROSTER});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "item", {"JID": objj_msgSend(_JID, "bare"), "name": _nickname});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "group", nil);
    objj_msgSend(stanza, "addTextNode:", aNewName);
    objj_msgSend(_connection, "send:", stanza);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactGroupUpdatedNotification, self);
}
},["void","CPString"]), new objj_method(sel_getUid("sendStanza:"), function $TNStropheContact__sendStanza_(self, _cmd, aStanza)
{ with(self)
{
    objj_msgSend(self, "sendStanza:withUserInfo:", aStanza, nil);
}
},["void","TNStropheStanza"]), new objj_method(sel_getUid("sendStanza:withUserInfo:"), function $TNStropheContact__sendStanza_withUserInfo_(self, _cmd, aStanza, userInfo)
{ with(self)
{
    objj_msgSend(aStanza, "setTo:", _JID);
    objj_msgSend(_connection, "send:", aStanza);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheContactStanzaSentNotification, self, userInfo);
}
},["void","TNStropheStanza","CPDictionary"]), new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:"), function $TNStropheContact__sendStanza_andRegisterSelector_ofObject_withSpecificID_userInfo_(self, _cmd, aStanza, aSelector, anObject, anId, someUserInfo)
{ with(self)
{
    var params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", anId, "id"),
        userInfo = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", aStanza, "stanza", anId, "id"),
        ret;
    objj_msgSend(aStanza, "setID:", anId);
    if (aSelector && !someUserInfo)
        ret = objj_msgSend(_connection, "registerSelector:ofObject:withDict:", aSelector, anObject, params);
    else if (aSelector && someUserInfo)
        ret = objj_msgSend(_connection, "registerSelector:ofObject:withDict:userInfo:", aSelector, anObject, params, someUserInfo);
    objj_msgSend(self, "sendStanza:withUserInfo:", aStanza, userInfo);
    return ret;
}
},["id","TNStropheStanza","SEL","id","id","id"]), new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:"), function $TNStropheContact__sendStanza_andRegisterSelector_ofObject_(self, _cmd, aStanza, aSelector, anObject)
{ with(self)
{
    return objj_msgSend(self, "sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:", aStanza, aSelector, anObject, objj_msgSend(_connection, "getUniqueId"), nil);
}
},["id","TNStropheStanza","SEL","id"]), new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:withSpecificID:"), function $TNStropheContact__sendStanza_andRegisterSelector_ofObject_withSpecificID_(self, _cmd, aStanza, aSelector, anObject, anId)
{ with(self)
{
    return objj_msgSend(self, "sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:", aStanza, aSelector, anObject, anId, nil);
}
},["id","TNStropheStanza","SEL","id","int"]), new objj_method(sel_getUid("sendStanza:andRegisterSelector:ofObject:userInfo:"), function $TNStropheContact__sendStanza_andRegisterSelector_ofObject_userInfo_(self, _cmd, aStanza, aSelector, anObject, someUserInfo)
{ with(self)
{
    return objj_msgSend(self, "sendStanza:andRegisterSelector:ofObject:withSpecificID:userInfo:", aStanza, aSelector, anObject, objj_msgSend(_connection, "getUniqueId"), someUserInfo);
}
},["id","TNStropheStanza","SEL","id","id"]), new objj_method(sel_getUid("getMessages"), function $TNStropheContact__getMessages(self, _cmd)
{ with(self)
{
    var params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "message", "name",
                                                            objj_msgSend(_JID, "bare"), "from",
                                                            {matchBare: true}, "options");
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceiveMessage:"), self, params);
}
},["void"]), new objj_method(sel_getUid("_didReceiveMessage:"), function $TNStropheContact___didReceiveMessage_(self, _cmd, aStanza)
{ with(self)
{
    var center = objj_msgSend(CPNotificationCenter, "defaultCenter"),
        userInfo = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", aStanza, "stanza", objj_msgSend(CPDate, "date"), "date");
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "composing"))
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessageComposing, self, userInfo);
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "paused"))
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessagePaused, self, userInfo);
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "active"))
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessageActive, self, userInfo);
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "inactive"))
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessageInactive, self, userInfo);
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "gone"))
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessageGone, self, userInfo);
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "body"))
    {
        _statusIcon = _imageNewMessage;
        objj_msgSend(_messagesQueue, "addObject:", aStanza);
        _numberOfEvents++;
        objj_msgSend(center, "postNotificationName:object:userInfo:", TNStropheContactMessageReceivedNotification, self, userInfo);
    }
    return YES;
}
},["BOOL","id"]), new objj_method(sel_getUid("sendMessage:"), function $TNStropheContact__sendMessage_(self, _cmd, aMessage)
{ with(self)
{
    objj_msgSend(self, "sendMessage:withType:", aMessage, "chat");
}
},["void","CPString"]), new objj_method(sel_getUid("sendMessage:withType:"), function $TNStropheContact__sendMessage_withType_(self, _cmd, aMessage, aType)
{ with(self)
{
    var messageStanza = objj_msgSend(TNStropheStanza, "messageWithAttributes:", {"type":aType});
    objj_msgSend(messageStanza, "addChildWithName:", "body");
    objj_msgSend(messageStanza, "addTextNode:", aMessage);
    objj_msgSend(self, "sendStanza:", messageStanza);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("popMessagesQueue"), function $TNStropheContact__popMessagesQueue(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_messagesQueue, "count") == 0)
        return Nil;
    var message = objj_msgSend(_messagesQueue, "objectAtIndex:", 0);
    _numberOfEvents--;
    if (_numberOfEvents === 0)
        _statusIcon = _statusReminder;
    objj_msgSend(_messagesQueue, "removeObjectAtIndex:", 0);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactMessageTreatedNotification, self);
    return message;
}
},["TNStropheStanza"]), new objj_method(sel_getUid("freeMessagesQueue"), function $TNStropheContact__freeMessagesQueue(self, _cmd)
{ with(self)
{
    _numberOfEvents = 0;
    _statusIcon = _statusReminder;
    objj_msgSend(_messagesQueue, "removeAllObjects");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactMessageTreatedNotification, self);
}
},["void"]), new objj_method(sel_getUid("imageDidLoad:"), function $TNStropheContact__imageDidLoad_(self, _cmd, anImage)
{ with(self)
{
    objj_msgSend(anImage, "setDelegate:", nil);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactVCardReceivedNotification, self);
}
},["void","TNBase64Image"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("contactWithConnection:JID:groupName:"), function $TNStropheContact__contactWithConnection_JID_groupName_(self, _cmd, aConnection, aJID, aGroupName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheContact, "alloc"), "initWithConnection:JID:groupName:", aConnection, aJID, aGroupName);
}
},["TNStropheContact","TNStropheConnection","CPString","CPString"])]);
}
{
var the_class = objj_getClass("TNStropheContact")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"TNStropheContact\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $TNStropheContact__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheContact").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        _JID = objj_msgSend(aCoder, "decodeObjectForKey:", "_JID");
        _nodeName = objj_msgSend(aCoder, "decodeObjectForKey:", "_nodeName");
        _groupName = objj_msgSend(aCoder, "decodeObjectForKey:", "_groupName");
        _nickname = objj_msgSend(aCoder, "decodeObjectForKey:", "_nickname");
        _XMPPStatus = objj_msgSend(aCoder, "decodeObjectForKey:", "_XMPPStatus");
        _resources = objj_msgSend(aCoder, "decodeObjectForKey:", "_resources");
        _XMPPShow = objj_msgSend(aCoder, "decodeObjectForKey:", "_XMPPShow");
        _statusIcon = objj_msgSend(aCoder, "decodeObjectForKey:", "_statusIcon");
        _type = objj_msgSend(aCoder, "decodeObjectForKey:", "_type");
        _vCard = objj_msgSend(aCoder, "decodeObjectForKey:", "_vCard");
        _messageQueue = objj_msgSend(aCoder, "decodeObjectForKey:", "_messagesQueue");
        _numberOfEvents = objj_msgSend(aCoder, "decodeObjectForKey:", "_numberOfEvents");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TNStropheContact__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _JID, "_JID");
    objj_msgSend(aCoder, "encodeObject:forKey:", _nodeName, "_nodeName");
    objj_msgSend(aCoder, "encodeObject:forKey:", _groupName, "_groupName");
    objj_msgSend(aCoder, "encodeObject:forKey:", _nickname, "_nickname");
    objj_msgSend(aCoder, "encodeObject:forKey:", _XMPPStatus, "_XMPPStatus");
    objj_msgSend(aCoder, "encodeObject:forKey:", _XMPPShow, "_XMPPShow");
    objj_msgSend(aCoder, "encodeObject:forKey:", _type, "_type");
    objj_msgSend(aCoder, "encodeObject:forKey:", _statusIcon, "_statusIcon");
    objj_msgSend(aCoder, "encodeObject:forKey:", _messagesQueue, "_messagesQueue");
    objj_msgSend(aCoder, "encodeObject:forKey:", _numberOfEvents, "_numberOfEvents");
    if (_resources)
        objj_msgSend(aCoder, "encodeObject:forKey:", _resources, "_resources");
    if (_vCard)
        objj_msgSend(aCoder, "encodeObject:forKey:", _vCard, "_vCard");
}
},["void","CPCoder"])]);
}

p;18;TNStropheGlobals.jt;5873;@STATIC;1.0;t;5854;       
       
TNStropheConnectionStatusConnecting = "TNStropheConnectionStatusConnecting";
TNStropheConnectionStatusConnected = "TNStropheConnectionStatusConnected";
TNStropheConnectionStatusConnectionFailure = "TNStropheConnectionStatusConnectionFailure";
TNStropheConnectionStatusAuthenticating = "TNStropheConnectionStatusAuthenticating"
TNStropheConnectionStatusAuthFailure = "TNStropheConnectionStatusAuthFailure";
TNStropheConnectionStatusWillDisconnect = "TNStropheConnectionStatusWillDisconnect";
TNStropheConnectionStatusDisconnecting = "TNStropheConnectionStatusDisconnecting";
TNStropheConnectionStatusDisconnected = "TNStropheConnectionStatusDisconnected";
TNStropheConnectionStatusError = "TNStropheConnectionStatusError";
       
       
TNStropheContactStatusAway = "away";
TNStropheContactStatusBusy = "xa";
TNStropheContactStatusDND = "dnd";
TNStropheContactStatusOffline = "offline";
TNStropheContactStatusOnline = "online";
TNStropheContactNicknameUpdatedNotification = "TNStropheContactNicknameUpdatedNotification";
TNStropheContactGroupUpdatedNotification = "TNStropheContactGroupUpdatedNotification";
TNStropheContactPresenceUpdatedNotification = "TNStropheContactPresenceUpdatedNotification";
TNStropheContactSubscriptionUpdatedNotification = "TNStropheContactSubscriptionUpdatedNotification";
TNStropheContactVCardReceivedNotification = "TNStropheContactVCardReceivedNotification";
TNStropheContactMessageReceivedNotification = "TNStropheContactMessageReceivedNotification";
TNStropheContactMessageTreatedNotification = "TNStropheContactMessageTreatedNotification";
TNStropheContactMessageSentNotification = "TNStropheContactMessageSentNotification";
TNStropheContactStanzaSentNotification = "TNStropheContactStanzaSentNotification"
TNStropheContactMessageComposing = "TNStropheContactMessageComposing";
TNStropheContactMessagePaused = "TNStropheContactMessagePaused";
TNStropheContactMessageActive = "TNStropheContactMessageActive";
TNStropheContactMessageInactive = "TNStropheContactMessageInactive";
TNStropheContactMessageGone = "TNStropheContactMessageGone";
       
       
TNStropheRosterRetrievedNotification = "TNStropheRosterRetrievedNotification";
TNStropheRosterAddedContactNotification = "TNStropheRosterAddedContactNotification";
TNStropheRosterRemovedContactNotification = "TNStropheRosterRemovedContactNotification";
TNStropheRosterAddedGroupNotification = "TNStropheRosterAddedGroupNotification";
TNStropheRosterRemovedGroupNotification = "TNStropheRosterRemovedGroupNotification";
       
       
TNStropheGroupRenamedNotification = "TNStropheGroupRenamed";
TNStropheGroupRemovedNotification = "TNStropheGroupRemoved";
       
       
TNStrophePubSubVarTitle = "pubsub#title";
TNStrophePubSubVarDeliverNotification = "pubsub#deliver_notifications";
TNStrophePubSubVarDeliverPayloads = "pubsub#deliver_payloads";
TNStrophePubSubVarPersistItems = "pubsub#persist_items";
TNStrophePubSubVarMaxItems = "pubsub#max_items";
TNStrophePubSubVarItemExpire = "pubsub#item_expire";
TNStrophePubSubVarAccessModel = "pubsub#access_model";
TNStrophePubSubVarRosterGroupAllowed = "pubsub#roster_groups_allowed";
TNStrophePubSubVarPublishModel = "pubsub#publish_model";
TNStrophePubSubVarPurgeOffline = "pubsub#purge_offline";
TNStrophePubSubVarSendLastPublishedItem = "pubsub#send_last_published_item";
TNStrophePubSubVarPresenceBasedDelivery = "pubsub#presence_based_delivery";
TNStrophePubSubVarNotificationType = "pubsub#notification_type";
TNStrophePubSubVarNotifyConfig = "pubsub#notify_config";
TNStrophePubSubVarNotifyDelete = "pubsub#notify_delete";
TNStrophePubSubVarNotifyRectract = "pubsub#notify_retract";
TNStrophePubSubVarNotifySub = "pubsub#notify_sub";
TNStrophePubSubVarMaxPayloadSize = "pubsub#max_payload_size";
TNStrophePubSubVarType = "pubsub#type";
TNStrophePubSubVarBodyXSLT = "pubsub#body_xslt";
TNStrophePubSubVarAccessModelOpen = "open";
TNStrophePubSubVarAccessModelRoster = "roster";
TNStrophePubSubVarAccessModelAuthorize = "authorize";
TNStrophePubSubVarAccessModelWhitelist = "whitelist";
TNStrophePubSubNodeRetrievedNotification = "TNStrophePubSubNodeRetrievedNotification";
TNStrophePubSubNodeCreatedNotification = "TNStrophePubSubNodeCreatedNotification";
TNStrophePubSubNodeDeletedNotification = "TNStrophePubSubNodeDeletedNotification";
TNStrophePubSubNodeConfiguredNotification = "TNStrophePubSubNodeConfiguredNotification";
TNStrophePubSubItemPublishedNotification = "TNStrophePubSubItemPublishedNotification";
TNStrophePubSubItemRetractedNotification = "TNStrophePubSubItemRetractedNotification";
TNStrophePubSubNodeSubscribedNotification = "TNStrophePubSubNodeSubscribedNotification";
TNStrophePubSubNodeUnsubscribedNotification = "TNStrophePubSubNodeUnsubscribedNotification";
TNStrophePubSubNodeEventNotification = "TNStrophePubSubNodeEventNotification"
       
       
TNStrophePubSubSubscriptionsRetrievedNotification = "TNStrophePubSubSubscriptionsReceivedNotification";
TNStrophePubSubNoOldSubscriptionsLeftNotification = "TNStrophePubSubNoOldSubscriptionsLeft";
TNStrophePubSubBatchSubscribeComplete = "TNStrophePubSubBatchSubscribeComplete";
TNStrophePubSubBatchUnsubscribeComplete = "TNStrophePubSubBatchUnsubscribeComplete";
       
       
TNStropheMUCRosterWasUpdatedNotification = "TNStropheMUCRosterWasUpdatedNotification";
TNStropheMUCConversationWasUpdatedNotification = "TNStropheMUCConversationWasUpdatedNotification";
TNStropheMUCSubjectWasUpdatedNotification = "TNStropheMUCSubjectWasUpdatedNotification";
TNStropheMUCDataReceivedNotification = "TNStropheMUCDataReceivedNotification";
TNStropheMUCPrivateMessageWasReceivedNotification = "TNStropheMUCPrivateMessageWasReceivedNotification";
       
       
TNStropheMUCContactJoinedNotification = "TNStropheMUCContactJoinedNotification";
TNStropheMUCContactLeftNotification = "TNStropheMUCContactLeftNotification";

p;16;TNStropheGroup.jt;3964;@STATIC;1.0;I;23;Foundation/Foundation.ji;18;TNStropheGlobals.jt;3894;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheGlobals.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNStropheGroup"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contacts"), new objj_ivar("_name")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contacts"), function $TNStropheGroup__contacts(self, _cmd)
{ with(self)
{
return _contacts;
}
},["id"]),
new objj_method(sel_getUid("_setContacts:"), function $TNStropheGroup___setContacts_(self, _cmd, newValue)
{ with(self)
{
_contacts = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $TNStropheGroup__name(self, _cmd)
{ with(self)
{
return _name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $TNStropheGroup__setName_(self, _cmd, newValue)
{ with(self)
{
_name = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithName:"), function $TNStropheGroup__initWithName_(self, _cmd, aName)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheGroup").super_class }, "init"))
    {
        _contacts = objj_msgSend(CPArray, "array");
        _name = aName;
    }
    return self;
}
},["TNStropheGroup","CPString"]), new objj_method(sel_getUid("description"), function $TNStropheGroup__description(self, _cmd)
{ with(self)
{
    return _name;
}
},["CPString"]), new objj_method(sel_getUid("changeName:"), function $TNStropheGroup__changeName_(self, _cmd, aName)
{ with(self)
{
    _name = aName;
    for (var i = 0; i < objj_msgSend(self, "count"); i++)
        objj_msgSend(objj_msgSend(_contacts, "objectAtIndex:", i), "changeGroupName:", aName);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheGroupRenamedNotification, self);
}
},["void","CPString"]), new objj_method(sel_getUid("addContact:"), function $TNStropheGroup__addContact_(self, _cmd, aContact)
{ with(self)
{
    if (objj_msgSend(aContact, "class") != TNStropheContact)
        objj_msgSend(CPException, "raise:reason:", "Invalid Object", "You can only add TNStropheContacts");
    objj_msgSend(_contacts, "addObject:", aContact);
}
},["void","TNStropheContact"]), new objj_method(sel_getUid("removeContact:"), function $TNStropheGroup__removeContact_(self, _cmd, aContact)
{ with(self)
{
    objj_msgSend(_contacts, "removeObject:", aContact);
}
},["void","TNStropheContact"]), new objj_method(sel_getUid("count"), function $TNStropheGroup__count(self, _cmd)
{ with(self)
{
    return objj_msgSend(_contacts, "count");
}
},["int"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stropheGroupWithName:"), function $TNStropheGroup__stropheGroupWithName_(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheGroup, "alloc"), "initWithName:", aName);
}
},["TNStropheGroup","CPString"])]);
}
{
var the_class = objj_getClass("TNStropheGroup")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"TNStropheGroup\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $TNStropheGroup__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheGroup").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        _contacts = objj_msgSend(aCoder, "decodeObjectForKey:", "_contacts");
        _name = objj_msgSend(aCoder, "decodeObjectForKey:", "_name");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TNStropheGroup__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _contacts, "_contacts");
    objj_msgSend(aCoder, "encodeObject:forKey:", _name, "_name");
}
},["void","CPCoder"])]);
}

p;14;TNStropheJID.jt;7999;@STATIC;1.0;I;23;Foundation/Foundation.jt;7952;objj_executeFile("Foundation/Foundation.j", NO);
TNStropheJIDExceptionJID = "TNStropheJIDExceptionJID";
{var the_class = objj_allocateClassPair(CPObject, "TNStropheJID"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_node"), new objj_ivar("_domain"), new objj_ivar("_resource"), new objj_ivar("_isServer")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("node"), function $TNStropheJID__node(self, _cmd)
{ with(self)
{
return _node;
}
},["id"]),
new objj_method(sel_getUid("setNode:"), function $TNStropheJID__setNode_(self, _cmd, newValue)
{ with(self)
{
_node = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("domain"), function $TNStropheJID__domain(self, _cmd)
{ with(self)
{
return _domain;
}
},["id"]),
new objj_method(sel_getUid("setDomain:"), function $TNStropheJID__setDomain_(self, _cmd, newValue)
{ with(self)
{
_domain = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("resource"), function $TNStropheJID__resource(self, _cmd)
{ with(self)
{
return _resource;
}
},["id"]),
new objj_method(sel_getUid("setResource:"), function $TNStropheJID__setResource_(self, _cmd, newValue)
{ with(self)
{
_resource = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isServer"), function $TNStropheJID__isServer(self, _cmd)
{ with(self)
{
return _isServer;
}
},["id"]),
new objj_method(sel_getUid("_setIsServer:"), function $TNStropheJID___setIsServer_(self, _cmd, newValue)
{ with(self)
{
_isServer = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithNode:domain:resource:"), function $TNStropheJID__initWithNode_domain_resource_(self, _cmd, aNode, aDomain, aResource)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheJID").super_class }, "init"))
    {
        _node = aNode;
        _domain = aDomain;
        _resource = aResource;
        _isServer = (!aDomain && !aResource);
    }
    return self;
}
},["TNStropheJID","CPString","CPString","CPString"]), new objj_method(sel_getUid("initWithNode:domain:"), function $TNStropheJID__initWithNode_domain_(self, _cmd, aNode, aDomain)
{ with(self)
{
    return objj_msgSend(self, "initWithNode:domain:resource:", aNode, aDomain, nil);
}
},["TNStropheJID","CPString","CPString"]), new objj_method(sel_getUid("initWithString:"), function $TNStropheJID__initWithString_(self, _cmd, aStringJID)
{ with(self)
{
    var node = aStringJID.split("@")[0],
        domain,
        resource;
    if (aStringJID.indexOf("@") != -1)
    {
        domain = aStringJID.split("@")[1].split("/")[0],
        resource = aStringJID.split("/")[1];
    }
    if (!node)
        objj_msgSend(CPException, "raise:reason:", TNStropheJIDExceptionJID, aStringJID + " is not a valid JID");
    return objj_msgSend(self, "initWithNode:domain:resource:", node, domain, resource);
}
},["TNStropheJID","CPString"]), new objj_method(sel_getUid("bare"), function $TNStropheJID__bare(self, _cmd)
{ with(self)
{
    if (_domain)
        return _node + "@" + _domain;
    else
        return _node;
}
},["CPString"]), new objj_method(sel_getUid("setBare:"), function $TNStropheJID__setBare_(self, _cmd, aBareJID)
{ with(self)
{
    var node = aBareJID.split("@")[0],
        domain = aBareJID.split("@")[1].split("/")[0];
    if (!node || !domain)
        objj_msgSend(CPException, "raise:reason:", TNStropheJIDExceptionJID, aBareJID + " is not a valid JID");
    _node = node;
    _domain = domain;
}
},["void","CPString"]), new objj_method(sel_getUid("full"), function $TNStropheJID__full(self, _cmd)
{ with(self)
{
    if (_resource)
        return objj_msgSend(self, "bare") + "/" + _resource;
    else
        return objj_msgSend(self, "bare");
}
},["CPString"]), new objj_method(sel_getUid("setFull:"), function $TNStropheJID__setFull_(self, _cmd, aFullJID)
{ with(self)
{
    objj_msgSend(self, "setBare:", aFullJID);
    var resource = aFullJID.split("/")[1];
    if (!resource)
        objj_msgSend(CPException, "raise:reason:", TNStropheJIDExceptionJID, aFullJID + " is not a valid JID");
    _resource = resource;
}
},["void","CPString"]), new objj_method(sel_getUid("description"), function $TNStropheJID__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "stringValue");
}
},["CPString"]), new objj_method(sel_getUid("stringValue"), function $TNStropheJID__stringValue(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "full");
}
},["CPString"]), new objj_method(sel_getUid("uppercaseString"), function $TNStropheJID__uppercaseString(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "stringValue"), "uppercaseString");
}
},["CPString"]), new objj_method(sel_getUid("lowercaseString"), function $TNStropheJID__lowercaseString(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "stringValue"), "lowercaseString");
}
},["CPString"]), new objj_method(sel_getUid("equals:"), function $TNStropheJID__equals_(self, _cmd, anotherJID)
{ with(self)
{
    return objj_msgSend(self, "fullEquals:", anotherJID);
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("fullEquals:"), function $TNStropheJID__fullEquals_(self, _cmd, anotherJID)
{ with(self)
{
    return (objj_msgSend(self, "bareEquals:", anotherJID) && (objj_msgSend(objj_msgSend(anotherJID, "resource"), "uppercaseString") === objj_msgSend(objj_msgSend(self, "resource"), "uppercaseString")))
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("bareEquals:"), function $TNStropheJID__bareEquals_(self, _cmd, anotherJID)
{ with(self)
{
    return ((objj_msgSend(objj_msgSend(anotherJID, "node"), "uppercaseString") === objj_msgSend(objj_msgSend(self, "node"), "uppercaseString")) && (objj_msgSend(objj_msgSend(anotherJID, "domain"), "uppercaseString") === objj_msgSend(objj_msgSend(self, "domain"), "uppercaseString")));
}
},["BOOL","TNStropheJID"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stropheJIDWithNode:domain:resource:"), function $TNStropheJID__stropheJIDWithNode_domain_resource_(self, _cmd, aNode, aDomain, aResource)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheJID, "alloc"), "initWithNode:domain:resource:", aNode, aDomain, aResource);
}
},["TNStropheJID","CPString","CPString","CPString"]), new objj_method(sel_getUid("stropheJIDWithNode:domain:"), function $TNStropheJID__stropheJIDWithNode_domain_(self, _cmd, aNode, aDomain)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheJID, "alloc"), "initWithNode:domain:", aNode, aDomain);
}
},["TNStropheJID","CPString","CPString"]), new objj_method(sel_getUid("stropheJIDWithString:"), function $TNStropheJID__stropheJIDWithString_(self, _cmd, aStringJID)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheJID, "alloc"), "initWithString:", aStringJID);
}
},["TNStropheJID","CPString"])]);
}
{
var the_class = objj_getClass("TNStropheJID")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"TNStropheJID\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $TNStropheJID__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheJID").super_class }, "init"))
    {
        _node = objj_msgSend(aCoder, "decodeObjectForKey:", "_node");
        _domain = objj_msgSend(aCoder, "decodeObjectForKey:", "_domain");
        _resource = objj_msgSend(aCoder, "decodeObjectForKey:", "_resource");
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TNStropheJID__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSend(aCoder, "encodeObject:forKey:", _node, "_node");
    if (_domain)
        objj_msgSend(aCoder, "encodeObject:forKey:", _domain, "_domain");
    if (_resource)
        objj_msgSend(aCoder, "encodeObject:forKey:", _resource, "_resource");
}
},["void","CPCoder"])]);
}

p;17;TNStropheRoster.jt;17962;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;21;TNStropheRosterBase.jt;17869;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNStropheRosterBase.j", YES);
{var the_class = objj_allocateClassPair(TNStropheRosterBase, "TNStropheRoster"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_groups"), new objj_ivar("_pendingPresence")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("groups"), function $TNStropheRoster__groups(self, _cmd)
{ with(self)
{
return _groups;
}
},["id"]),
new objj_method(sel_getUid("_setGroups:"), function $TNStropheRoster___setGroups_(self, _cmd, newValue)
{ with(self)
{
_groups = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("pendingPresence"), function $TNStropheRoster__pendingPresence(self, _cmd)
{ with(self)
{
return _pendingPresence;
}
},["id"]),
new objj_method(sel_getUid("_setPendingPresence:"), function $TNStropheRoster___setPendingPresence_(self, _cmd, newValue)
{ with(self)
{
_pendingPresence = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithConnection:"), function $TNStropheRoster__initWithConnection_(self, _cmd, aConnection)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheRoster").super_class }, "initWithConnection:", aConnection))
    {
        _groups = objj_msgSend(CPArray, "array");
        _pendingPresence = objj_msgSend(CPArray, "array");
    }
    return self;
}
},["id","TNStropheConnection"]), new objj_method(sel_getUid("clear"), function $TNStropheRoster__clear(self, _cmd)
{ with(self)
{
    objj_msgSend(_groups, "removeAllObjects");
    objj_msgSend(_pendingPresence, "removeAllObjects");
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheRoster").super_class }, "clear");
}
},["void"]), new objj_method(sel_getUid("getRoster"), function $TNStropheRoster__getRoster(self, _cmd)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueIdWithSuffix:", "roster"),
        rosteriq = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {'id':uid, 'type':'get'}),
        rosterParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "iq", "name",
                                                                     "result", "type",
                                                                     uid, "id"),
        presenceParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "presence", "name",
                                                                     objj_msgSend(objj_msgSend(_connection, "JID"), "bare"), "to");
        pushParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "iq", "name",
                                                                     "set", "type");
    objj_msgSend(rosteriq, "addChildWithName:andAttributes:", "query", {'xmlns':Strophe.NS.ROSTER});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceiveRoster:"), self, rosterParams);
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceivePresence:"), self, presenceParams);
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceiveRosterPush:"), self, pushParams);
    objj_msgSend(_connection, "send:", rosteriq);
}
},["void"]), new objj_method(sel_getUid("_didReceiveRoster:"), function $TNStropheRoster___didReceiveRoster_(self, _cmd, aStanza)
{ with(self)
{
    objj_msgSend(self, "_processRoster:andNotifyOnNewContacts:", aStanza, NO);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheRosterRetrievedNotification, self);
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("_processRoster:andNotifyOnNewContacts:"), function $TNStropheRoster___processRoster_andNotifyOnNewContacts_(self, _cmd, aStanza, notifyOnNewContacts)
{ with(self)
{
    var query = objj_msgSend(aStanza, "firstChildWithName:", "query");
    if (objj_msgSend(query, "namespace") != Strophe.NS.ROSTER)
        return;
    var items = objj_msgSend(query, "childrenWithName:", "item");
    for (var i = 0; i < objj_msgSend(items, "count"); i++)
        objj_msgSend(self, "_processRosterItem:andNotifyIfNewContact:", objj_msgSend(items, "objectAtIndex:", i), notifyOnNewContacts);
}
},["void","TNStropheStanza","BOOL"]), new objj_method(sel_getUid("_processRosterItem:andNotifyIfNewContact:"), function $TNStropheRoster___processRosterItem_andNotifyIfNewContact_(self, _cmd, anItem, notifyIfNewContact)
{ with(self)
{
    var theJID = objj_msgSend(TNStropheJID, "stropheJIDWithString:", objj_msgSend(anItem, "valueForAttribute:", "jid")),
        nickname = objj_msgSend(theJID, "node"),
        groupName = (objj_msgSend(anItem, "containsChildrenWithName:", "group")) ? objj_msgSend(objj_msgSend(anItem, "firstChildWithName:", "group"), "text") : "General",
        newGroup = objj_msgSend(self, "groupWithName:orCreate:", groupName, YES),
        subscription = objj_msgSend(anItem, "valueForAttribute:", "subscription"),
        newContact = NO,
        contact;
    if (objj_msgSend(anItem, "valueForAttribute:", "name"))
        nickname = objj_msgSend(anItem, "valueForAttribute:", "name");
    if (objj_msgSend(self, "containsJID:", theJID))
    {
        contact = objj_msgSend(self, "contactWithJID:", theJID);
        if (subscription === "remove")
        {
            objj_msgSend(_contacts, "removeObject:", contact);
            objj_msgSend(objj_msgSend(self, "groupOfContact:", contact), "removeContact:", contact);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheRosterRemovedContactNotification, contact);
            return;
        }
    }
    else
    {
        if (subscription === "remove")
            return;
        newContact = YES;
        contact = objj_msgSend(TNStropheContact, "contactWithConnection:JID:groupName:", _connection, theJID, groupName);
    }
    if (objj_msgSend(self, "groupOfContact:", contact) != newGroup)
    {
        objj_msgSend(objj_msgSend(self, "groupOfContact:", contact), "removeContact:", contact);
        objj_msgSend(newGroup, "addContact:", contact);
        if (!newContact)
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactGroupUpdatedNotification, contact);
    }
    if (objj_msgSend(contact, "nickname") != nickname)
    {
        objj_msgSend(contact, "setNickname:", nickname);
        if (!newContact)
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheContactNicknameUpdatedNotification, contact);
    }
    objj_msgSend(contact, "setSubscription:", subscription);
    if (newContact)
    {
        objj_msgSend(_contacts, "addObject:", contact);
        var queuedPresence = objj_msgSend(self, "pendingPresenceForJID:", theJID);
        for (var j = 0; j < objj_msgSend(queuedPresence, "count"); j++)
            objj_msgSend(contact, "_didReceiveStatus:", objj_msgSend(queuedPresence, "objectAtIndex:", j));
        objj_msgSend(contact, "getMessages");
        if (notifyIfNewContact)
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheRosterAddedContactNotification, contact);
    }
    return contact;
}
},["TNStropheContact","TNXMLNode","BOOL"]), new objj_method(sel_getUid("_didReceivePresence:"), function $TNStropheRoster___didReceivePresence_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") === "subscribe")
    {
        if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("roster:receiveSubscriptionRequest:")))
            objj_msgSend(_delegate, "roster:receiveSubscriptionRequest:", self, aStanza);
    }
    else
    {
        if (objj_msgSend(self, "containsJID:", objj_msgSend(aStanza, "from")))
            objj_msgSend(objj_msgSend(self, "contactWithJID:", objj_msgSend(aStanza, "from")), "_didReceivePresence:", aStanza);
        else
            objj_msgSend(_pendingPresence, "addObject:", aStanza);
    }
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("_didReceiveRosterPush:"), function $TNStropheRoster___didReceiveRosterPush_(self, _cmd, aStanza)
{ with(self)
{
    objj_msgSend(self, "_processRoster:andNotifyOnNewContacts:", aStanza, YES);
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("pendingPresenceForJID:"), function $TNStropheRoster__pendingPresenceForJID_(self, _cmd, aJID)
{ with(self)
{
    var temp = objj_msgSend(CPArray, "array");
    for (var i = 0; i < objj_msgSend(_pendingPresence, "count"); i++)
    {
        var presence = objj_msgSend(_pendingPresence, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(presence, "from"), "bareEquals:", aJID))
            objj_msgSend(temp, "addObject:", presence);
    }
    return temp;
}
},["CPArray","TNStropheJID"]), new objj_method(sel_getUid("addGroup:"), function $TNStropheRoster__addGroup_(self, _cmd, aGroup)
{ with(self)
{
    objj_msgSend(_groups, "addObject:", aGroup);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheRosterAddedGroupNotification, aGroup);
    return aGroup;
}
},["TNStropheGroup","TNStropheGroup"]), new objj_method(sel_getUid("addGroupWithName:"), function $TNStropheRoster__addGroupWithName_(self, _cmd, aGroupName)
{ with(self)
{
    if (objj_msgSend(self, "containsGroupWithName:", aGroupName))
        return nil;
    return objj_msgSend(self, "addGroup:", objj_msgSend(TNStropheGroup, "stropheGroupWithName:", aGroupName));
}
},["TNStropheGroup","CPString"]), new objj_method(sel_getUid("removeGroup:"), function $TNStropheRoster__removeGroup_(self, _cmd, aGroup)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(aGroup, "count"); i++)
        objj_msgSend(self, "changeGroup:ofContact:", _defaultGroup, objj_msgSend(objj_msgSend(aGroup, "contacts"), "objectAtIndex:", i));
    objj_msgSend(_groups, "removeObject:", aGroup);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStropheRosterRemovedGroupNotification, aGroup);
}
},["void","TNStropheGroup"]), new objj_method(sel_getUid("containsGroup:"), function $TNStropheRoster__containsGroup_(self, _cmd, aGroup)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_groups, "count"); i++)
    {
        if (objj_msgSend(_groups, "objectAtIndex:", i) == aGroup)
            return YES;
    }
    return NO;
}
},["BOOL","TNStropheGroup"]), new objj_method(sel_getUid("containsGroupWithName:"), function $TNStropheRoster__containsGroupWithName_(self, _cmd, aGroupName)
{ with(self)
{
    return objj_msgSend(self, "containsGroup:", objj_msgSend(self, "groupWithName:", aGroupName));
}
},["BOOL","CPString"]), new objj_method(sel_getUid("groupWithName:"), function $TNStropheRoster__groupWithName_(self, _cmd, aGroupName)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_groups, "count"); i++)
    {
        var group = objj_msgSend(_groups, "objectAtIndex:", i);
        if (objj_msgSend(group, "name") == aGroupName)
            return group;
    }
    return nil;
}
},["TNStropheGroup","CPString"]), new objj_method(sel_getUid("groupWithName:orCreate:"), function $TNStropheRoster__groupWithName_orCreate_(self, _cmd, aGroupName, shouldCreate)
{ with(self)
{
    var newGroup = objj_msgSend(self, "groupWithName:", aGroupName);
    if (shouldCreate && !newGroup)
        return objj_msgSend(self, "addGroupWithName:", aGroupName);
    return newGroup;
}
},["TNStropheGroup","CPString","BOOL"]), new objj_method(sel_getUid("groupOfContact:"), function $TNStropheRoster__groupOfContact_(self, _cmd, aContact)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_groups, "count"); i++)
    {
        var group = objj_msgSend(_groups, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(group, "contacts"), "containsObject:", aContact))
            return group;
    }
    return nil;
}
},["TNStropheGroup","TNStropheContact"]), new objj_method(sel_getUid("populatedGroupsCount"), function $TNStropheRoster__populatedGroupsCount(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "populatedGroups"), "count");
}
},["int"]), new objj_method(sel_getUid("populatedGroups"), function $TNStropheRoster__populatedGroups(self, _cmd)
{ with(self)
{
    var tempGroups = objj_msgSend(CPArray, "array");
    for (var i = 0; i < objj_msgSend(_groups, "count"); i++)
    {
        var group = objj_msgSend(_groups, "objectAtIndex:", i);
        if (objj_msgSend(group, "count") > 0)
            objj_msgSend(tempGroups, "addObject:", group);
    }
    return tempGroups;
}
},["CPArray"]), new objj_method(sel_getUid("addContact:withName:inGroupWithName:"), function $TNStropheRoster__addContact_withName_inGroupWithName_(self, _cmd, aJID, aName, aGroupName)
{ with(self)
{
    if (objj_msgSend(self, "containsJID:", aJID) == YES)
        return;
    if (!aName)
        aName = objj_msgSend(aJID, "node");
    if (!aGroupName)
        aGroupName = "General";
    var uid = objj_msgSend(_connection, "getUniqueId"),
        addReq = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": "set", "id": uid}),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(addReq, "addChildWithName:andAttributes:", "query",  {'xmlns':Strophe.NS.ROSTER});
    objj_msgSend(addReq, "addChildWithName:andAttributes:", "item", {"JID": objj_msgSend(aJID, "full"), "name": aName});
    objj_msgSend(addReq, "addChildWithName:andAttributes:", "group", nil);
    objj_msgSend(addReq, "addTextNode:", aGroupName);
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:userInfo:", sel_getUid("_didAddContact:userInfo:"), self, params, aJID);
    objj_msgSend(_connection, "send:", addReq);
}
},["void","TNStropheJID","CPString","CPString"]), new objj_method(sel_getUid("_didAddContact:userInfo:"), function $TNStropheRoster___didAddContact_userInfo_(self, _cmd, aStanza, theJID)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") === "result")
        CPLog.debug("Contact with JID " + theJID + " was added to roster!");
    else
        CPLog.error("Error adding contact with JID " + theJID + " to roster!");
    return NO;
}
},["BOOL","TNStropheStanza","TNStropheJID"]), new objj_method(sel_getUid("removeContact:"), function $TNStropheRoster__removeContact_(self, _cmd, aContact)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueIdWithSuffix:", "roster"),
        removeReq = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": "set", "id": uid});
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(removeReq, "addChildWithName:andAttributes:", "query",  {'xmlns':Strophe.NS.ROSTER});
    objj_msgSend(removeReq, "addChildWithName:andAttributes:", "item", {'jid': objj_msgSend(objj_msgSend(aContact, "JID"), "bare"), 'subscription': 'remove'});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:userInfo:", sel_getUid("_didRemoveContact:userInfo:"), self, params, aContact);
    objj_msgSend(_connection, "send:", removeReq);
}
},["void","TNStropheContact"]), new objj_method(sel_getUid("_didRemoveContact:userInfo:"), function $TNStropheRoster___didRemoveContact_userInfo_(self, _cmd, aStanza, theContact)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") === "result")
        CPLog.debug("Contact was removed from roster!");
    else
    {
        CPLog.error("Error removing contact from roster!");
        CPLog.error(theContact);
    }
    return NO;
}
},["BOOL","TNStropheStanza","TNStropheContact"]), new objj_method(sel_getUid("removeContactWithJID:"), function $TNStropheRoster__removeContactWithJID_(self, _cmd, aJID)
{ with(self)
{
    objj_msgSend(self, "removeContact:", objj_msgSend(self, "contactWithJID:", aJID));
}
},["void","TNStropheJID"]), new objj_method(sel_getUid("authorizeJID:"), function $TNStropheRoster__authorizeJID_(self, _cmd, aJID)
{ with(self)
{
    var contact = objj_msgSend(self, "contactWithJID:", aJID);
    if (!contact)
        contact = objj_msgSend(self, "addContact:withName:inGroupWithName:", aJID, objj_msgSend(aJID, "node"), "General");
    objj_msgSend(contact, "subscribe");
}
},["void","TNStropheJID"]), new objj_method(sel_getUid("unauthorizeJID:"), function $TNStropheRoster__unauthorizeJID_(self, _cmd, aJID)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "contactWithJID:", aJID), "unsubscribe");
}
},["void","TNStropheJID"]), new objj_method(sel_getUid("askAuthorizationTo:"), function $TNStropheRoster__askAuthorizationTo_(self, _cmd, aJID)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "contactWithJID:", aJID), "askSubscription");
}
},["void","TNStropheJID"]), new objj_method(sel_getUid("answerAuthorizationRequest:answer:"), function $TNStropheRoster__answerAuthorizationRequest_answer_(self, _cmd, aStanza, theAnswer)
{ with(self)
{
    var requester = objj_msgSend(aStanza, "from");
    if (theAnswer == YES)
    {
        objj_msgSend(self, "authorizeJID:", requester);
        objj_msgSend(self, "askAuthorizationTo:", requester);
    }
    else
        objj_msgSend(self, "unauthorizeJID:", requester);
    if (!objj_msgSend(self, "containsJID:", requester))
        objj_msgSend(self, "addContact:withName:inGroupWithName:", requester, objj_msgSend(requester, "node"), nil);
}
},["void","id","BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rosterWithConnection:"), function $TNStropheRoster__rosterWithConnection_(self, _cmd, aConnection)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheRoster, "alloc"), "initWithConnection:", aConnection);
}
},["TNStropheRoster","TNStropheConnection"])]);
}

p;21;TNStropheRosterBase.jt;7221;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;21;TNStropheConnection.ji;17;TNStropheStanza.ji;16;TNStropheGroup.ji;18;TNStropheContact.ji;18;TNStropheGlobals.jt;7040;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNStropheConnection.j", YES);;
objj_executeFile("TNStropheStanza.j", YES);;
objj_executeFile("TNStropheGroup.j", YES);
objj_executeFile("TNStropheContact.j", YES);
objj_executeFile("TNStropheGlobals.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNStropheRosterBase"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_contacts"), new objj_ivar("_delegate"), new objj_ivar("_connection"), new objj_ivar("_defaultGroup")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contacts"), function $TNStropheRosterBase__contacts(self, _cmd)
{ with(self)
{
return _contacts;
}
},["id"]),
new objj_method(sel_getUid("_setContacts:"), function $TNStropheRosterBase___setContacts_(self, _cmd, newValue)
{ with(self)
{
_contacts = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $TNStropheRosterBase__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $TNStropheRosterBase__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("connection"), function $TNStropheRosterBase__connection(self, _cmd)
{ with(self)
{
return _connection;
}
},["id"]),
new objj_method(sel_getUid("_setConnection:"), function $TNStropheRosterBase___setConnection_(self, _cmd, newValue)
{ with(self)
{
_connection = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithConnection:"), function $TNStropheRosterBase__initWithConnection_(self, _cmd, aConnection)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheRosterBase").super_class }, "init"))
    {
        _connection = aConnection;
        _contacts = objj_msgSend(CPArray, "array");
        _defaultGroup = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "General");
    }
    return self;
}
},["id","TNStropheConnection"]), new objj_method(sel_getUid("disconnect"), function $TNStropheRosterBase__disconnect(self, _cmd)
{ with(self)
{
    objj_msgSend(_connection, "disconnect");
}
},["void"]), new objj_method(sel_getUid("clear"), function $TNStropheRosterBase__clear(self, _cmd)
{ with(self)
{
    objj_msgSend(_contacts, "removeAllObjects");
}
},["void"]), new objj_method(sel_getUid("groupOfContact:"), function $TNStropheRosterBase__groupOfContact_(self, _cmd, aContact)
{ with(self)
{
    CPLog.error('TNStropheRosterBase groupOfContact must be implemented in sub-classes.');
    return;
}
},["TNStropheGroup","TNStropheContact"]), new objj_method(sel_getUid("removeContact:"), function $TNStropheRosterBase__removeContact_(self, _cmd, aContact)
{ with(self)
{
    objj_msgSend(_contacts, "removeObject:", aContact);
    objj_msgSend(objj_msgSend(self, "groupOfContact:", aContact), "removeContact:", aContact);
}
},["void","TNStropheContact"]), new objj_method(sel_getUid("removeContactWithJID:"), function $TNStropheRosterBase__removeContactWithJID_(self, _cmd, aJID)
{ with(self)
{
    objj_msgSend(self, "removeContact:", objj_msgSend(self, "contactWithJID:", aJID));
}
},["void","TNStropheJID"]), new objj_method(sel_getUid("contactWithJID:"), function $TNStropheRosterBase__contactWithJID_(self, _cmd, aJID)
{ with(self)
{
    return objj_msgSend(self, "contactWithFullJID:", aJID) || objj_msgSend(self, "contactWithBareJID:", aJID);
}
},["TNStropheContact","TNStropheJID"]), new objj_method(sel_getUid("contactWithFullJID:"), function $TNStropheRosterBase__contactWithFullJID_(self, _cmd, aJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_contacts, "count"); i++)
    {
        var contact = objj_msgSend(_contacts, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(contact, "JID"), "equals:", aJID))
            return contact;
    }
}
},["TNStropheContact","TNStropheJID"]), new objj_method(sel_getUid("contactWithBareJID:"), function $TNStropheRosterBase__contactWithBareJID_(self, _cmd, aJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_contacts, "count"); i++)
    {
        var contact = objj_msgSend(_contacts, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(contact, "JID"), "bareEquals:", aJID))
            return contact;
    }
    return nil;
}
},["TNStropheContact","TNStropheJID"]), new objj_method(sel_getUid("firstContactWithBareJID:"), function $TNStropheRosterBase__firstContactWithBareJID_(self, _cmd, aJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_contacts, "count"); i++)
    {
        var contact = objj_msgSend(_contacts, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(contact, "JID"), "bareEquals:", aJID))
            return contact;
    }
    return nil;
}
},["TNStropheContact","TNStropheJID"]), new objj_method(sel_getUid("containsJID:"), function $TNStropheRosterBase__containsJID_(self, _cmd, aJID)
{ with(self)
{
    return objj_msgSend(self, "containsBareJID:", aJID) || objj_msgSend(self, "containsFullJID:", aJID);
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("containsFullJID:"), function $TNStropheRosterBase__containsFullJID_(self, _cmd, aJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_contacts, "count"); i++)
    {
        if (objj_msgSend(objj_msgSend(objj_msgSend(_contacts, "objectAtIndex:", i), "JID"), "equals:", aJID))
            return YES;
    }
    return NO;
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("containsBareJID:"), function $TNStropheRosterBase__containsBareJID_(self, _cmd, aJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_contacts, "count"); i++)
    {
        if (objj_msgSend(objj_msgSend(objj_msgSend(_contacts, "objectAtIndex:", i), "JID"), "bareEquals:", aJID))
            return YES;
    }
    return NO;
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("changeNickname:ofContact:"), function $TNStropheRosterBase__changeNickname_ofContact_(self, _cmd, aName, aContact)
{ with(self)
{
    objj_msgSend(aContact, "changeNickname:", aName);
}
},["void","CPString","TNStropheContact"]), new objj_method(sel_getUid("changeNickname:ofContactWithJID:"), function $TNStropheRosterBase__changeNickname_ofContactWithJID_(self, _cmd, aName, aJID)
{ with(self)
{
    objj_msgSend(self, "changeNickname:ofContact:", aName, objj_msgSend(self, "contactWithJID:", aJID));
}
},["void","CPString","TNStropheJID"]), new objj_method(sel_getUid("changeGroup:ofContact:"), function $TNStropheRosterBase__changeGroup_ofContact_(self, _cmd, newGroup, aContact)
{ with(self)
{
    objj_msgSend(aContact, "changeGroup:", newGroup);
}
},["void","TNStropheGroup","TNStropheContact"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rosterWithConnection:"), function $TNStropheRosterBase__rosterWithConnection_(self, _cmd, aConnection)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheRosterBase, "alloc"), "initWithConnection:", aConnection);
}
},["TNStropheRosterBase","TNStropheConnection"])]);
}

p;17;TNStropheStanza.jt;10929;@STATIC;1.0;I;23;Foundation/Foundation.ji;14;TNStropheJID.ji;11;TNXMLNode.jt;10846;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("TNStropheJID.j", YES);
objj_executeFile("TNXMLNode.j", YES);
{var the_class = objj_allocateClassPair(TNXMLNode, "TNStropheStanza"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithName:to:attributes:bare:"), function $TNStropheStanza__initWithName_to_attributes_bare_(self, _cmd, aName, aJID, someAttributes, sendToBareJID)
{ with(self)
{
    if (aJID && !someAttributes)
        someAttributes = {};
    if (someAttributes)
    {
        if (someAttributes.isa)
            objj_msgSend(someAttributes, "setValue:forKey:", ((sendToBareJID) ? objj_msgSend(aJID, "bare") : aJID), "to")
        else
            someAttributes.to = ((sendToBareJID) ? objj_msgSend(aJID, "bare") : objj_msgSend(aJID, "full"))
    }
    return objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheStanza").super_class }, "initWithName:andAttributes:", aName, someAttributes);
}
},["TNStropheStanza","CPString","TNStropheJID","CPDictionary","BOOL"]), new objj_method(sel_getUid("from"), function $TNStropheStanza__from(self, _cmd)
{ with(self)
{
    while (objj_msgSend(self, "up"));
    return objj_msgSend(TNStropheJID, "stropheJIDWithString:", objj_msgSend(self, "valueForAttribute:", "from"));
}
},["CPString"]), new objj_method(sel_getUid("setFrom:"), function $TNStropheStanza__setFrom_(self, _cmd, aFrom)
{ with(self)
{
    if (objj_msgSend(aFrom, "class") == CPString)
        aFrom = objj_msgSend(TNStropheJID, "stropheJIDWithString:", aFrom);
    while (objj_msgSend(self, "up"));
    objj_msgSend(self, "setValue:forAttribute:", objj_msgSend(aFrom, "full"), "from");
}
},["void","id"]), new objj_method(sel_getUid("fromBare"), function $TNStropheStanza__fromBare(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "from"), "bare");
}
},["CPString"]), new objj_method(sel_getUid("fromUser"), function $TNStropheStanza__fromUser(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "from"), "node");
}
},["CPString"]), new objj_method(sel_getUid("fromDomain"), function $TNStropheStanza__fromDomain(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "from"), "domain");
}
},["CPString"]), new objj_method(sel_getUid("fromResource"), function $TNStropheStanza__fromResource(self, _cmd)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "from"), "resource");
}
},["CPString"]), new objj_method(sel_getUid("to"), function $TNStropheStanza__to(self, _cmd)
{ with(self)
{
    while (objj_msgSend(self, "up"));
    return objj_msgSend(TNStropheJID, "stropheJIDWithString:", objj_msgSend(self, "valueForAttribute:", "to"));
}
},["CPString"]), new objj_method(sel_getUid("setTo:"), function $TNStropheStanza__setTo_(self, _cmd, aTo)
{ with(self)
{
    if (objj_msgSend(aTo, "class") == CPString)
        aTo = objj_msgSend(TNStropheJID, "stropheJIDWithString:", aTo);
    while (objj_msgSend(self, "up"));
    objj_msgSend(self, "setValue:forAttribute:", objj_msgSend(aTo, "full"), "to");
}
},["void","id"]), new objj_method(sel_getUid("type"), function $TNStropheStanza__type(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForAttribute:", "type");
}
},["CPString"]), new objj_method(sel_getUid("setType:"), function $TNStropheStanza__setType_(self, _cmd, aType)
{ with(self)
{
    objj_msgSend(self, "setValue:forAttribute:", aType, "type");
}
},["void","CPString"]), new objj_method(sel_getUid("ID"), function $TNStropheStanza__ID(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForAttribute:", "id");
}
},["CPString"]), new objj_method(sel_getUid("setID:"), function $TNStropheStanza__setID_(self, _cmd, anID)
{ with(self)
{
    while (objj_msgSend(self, "up"));
    objj_msgSend(self, "setValue:forAttribute:", anID, "id");
}
},["void","CPString"]), new objj_method(sel_getUid("delayTime"), function $TNStropheStanza__delayTime(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "containsChildrenWithName:", "delay") && objj_msgSend(objj_msgSend(self, "firstChildWithName:", "delay"), "namespace") == Strophe.NS.DELAY)
    {
        var messageDelay = objj_msgSend(objj_msgSend(self, "firstChildWithName:", "delay"), "valueForAttribute:", "stamp"),
            match = messageDelay.match(new RegExp(/(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2})Z/));
        if (!match || match.length != 3)
            objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, "delayTime: the string must be of YYYY-MM-DDTHH:MM:SSZ format");
        return objj_msgSend(objj_msgSend(CPDate, "alloc"), "initWithString:", (match[1] + " " + match[2] + " +0000"));
    }
    return objj_msgSend(CPDate, "dateWithTimeIntervalSinceNow:", 0);
}
},["CPDate"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("stanzaWithStanza:"), function $TNStropheStanza__stanzaWithStanza_(self, _cmd, aStanza)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheStanza, "alloc"), "initWithNode:", aStanza);
}
},["TNStropheStanza","id"]), new objj_method(sel_getUid("stanzaWithName:andAttributes:"), function $TNStropheStanza__stanzaWithName_andAttributes_(self, _cmd, aName, attributes)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheStanza, "alloc"), "initWithName:andAttributes:", aName, attributes);
}
},["TNStropheStanza","CPString","CPDictionary"]), new objj_method(sel_getUid("stanzaWithName:to:attributes:"), function $TNStropheStanza__stanzaWithName_to_attributes_(self, _cmd, aName, aJID, attributes)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheStanza, "alloc"), "initWithName:to:attributes:bare:", aName, aJID, attributes, NO);
}
},["TNStropheStanza","CPString","TNStropheJID","CPDictionary"]), new objj_method(sel_getUid("stanzaWithName:to:attributes:bare:"), function $TNStropheStanza__stanzaWithName_to_attributes_bare_(self, _cmd, aName, aJID, attributes, sendToBareJID)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheStanza, "alloc"), "initWithName:to:attributes:bare:", aName, aJID, attributes, sendToBareJID);
}
},["TNStropheStanza","CPString","TNStropheJID","CPDictionary","BOOL"]), new objj_method(sel_getUid("iqWithAttributes:"), function $TNStropheStanza__iqWithAttributes_(self, _cmd, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:andAttributes:", "iq", attributes);
}
},["TNStropheStanza","CPDictionary"]), new objj_method(sel_getUid("iq"), function $TNStropheStanza__iq(self, _cmd)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "iqWithAttributes:", nil);
}
},["TNStropheStanza"]), new objj_method(sel_getUid("iqTo:"), function $TNStropheStanza__iqTo_(self, _cmd, aJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "iqTo:withAttributes:", aJID, nil);
}
},["TNStropheStanza","TNStropheJID"]), new objj_method(sel_getUid("iqWithType:"), function $TNStropheStanza__iqWithType_(self, _cmd, aType)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": aType});
}
},["TNStropheStanza","CPString"]), new objj_method(sel_getUid("iqTo:withType:"), function $TNStropheStanza__iqTo_withType_(self, _cmd, aJID, aType)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "iqTo:withAttributes:", aJID, {"type": aType});
}
},["TNStropheStanza","TNStropheJID","CPString"]), new objj_method(sel_getUid("iqTo:withAttributes:"), function $TNStropheStanza__iqTo_withAttributes_(self, _cmd, aJID, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:bare:", "iq", aJID, attributes, NO);
}
},["TNStropheStanza","TNStropheJID","CPDictionary"]), new objj_method(sel_getUid("iqTo:withAttributes:bare:"), function $TNStropheStanza__iqTo_withAttributes_bare_(self, _cmd, aJID, attributes, sendToBareJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:bare:", "iq", aJID, attributes, sendToBareJID);
}
},["TNStropheStanza","TNStropheJID","CPDictionary","BOOL"]), new objj_method(sel_getUid("presenceWithAttributes:"), function $TNStropheStanza__presenceWithAttributes_(self, _cmd, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:andAttributes:", "presence", attributes);
}
},["TNStropheStanza","CPDictionary"]), new objj_method(sel_getUid("presence"), function $TNStropheStanza__presence(self, _cmd)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "presenceWithAttributes:", nil);
}
},["TNStropheStanza"]), new objj_method(sel_getUid("presenceTo:"), function $TNStropheStanza__presenceTo_(self, _cmd, aJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "presenceTo:withAttributes:", aJID, nil);
}
},["TNStropheStanza","TNStropheJID"]), new objj_method(sel_getUid("presenceTo:withAttributes:"), function $TNStropheStanza__presenceTo_withAttributes_(self, _cmd, aJID, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:bare:", "presence", aJID, attributes, NO);
}
},["TNStropheStanza","TNStropheJID","CPDictionary"]), new objj_method(sel_getUid("presenceTo:withAttributes:bare:"), function $TNStropheStanza__presenceTo_withAttributes_bare_(self, _cmd, aJID, attributes, sendToBareJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:bare:", "presence", aJID, attributes, sendToBareJID);
}
},["TNStropheStanza","TNStropheJID","CPDictionary","BOOL"]), new objj_method(sel_getUid("messageWithAttributes:"), function $TNStropheStanza__messageWithAttributes_(self, _cmd, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:andAttributes:", "message", attributes);
}
},["TNStropheStanza","CPDictionary"]), new objj_method(sel_getUid("message"), function $TNStropheStanza__message(self, _cmd)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "messageWithAttributes:", nil);
}
},["TNStropheStanza"]), new objj_method(sel_getUid("messageTo:"), function $TNStropheStanza__messageTo_(self, _cmd, aJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "messageTo:withAttributes:", aJID, nil);
}
},["TNStropheStanza","TNStropheJID"]), new objj_method(sel_getUid("messageTo:withAttributes:"), function $TNStropheStanza__messageTo_withAttributes_(self, _cmd, aJID, attributes)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:", "message", aJID, attributes);
}
},["TNStropheStanza","TNStropheJID","CPDictionary"]), new objj_method(sel_getUid("messageTo:withAttributes:bare:"), function $TNStropheStanza__messageTo_withAttributes_bare_(self, _cmd, aJID, attributes, sendToBareJID)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "stanzaWithName:to:attributes:bare:", "message", aJID, attributes, sendToBareJID);
}
},["TNStropheStanza","TNStropheJID","CPDictionary","BOOL"])]);
}

p;11;TNXMLNode.jt;7524;@STATIC;1.0;I;23;Foundation/Foundation.jt;7477;objj_executeFile("Foundation/Foundation.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "TNXMLNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_xmlNode")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("xmlNode"), function $TNXMLNode__xmlNode(self, _cmd)
{ with(self)
{
return _xmlNode;
}
},["id"]), new objj_method(sel_getUid("initWithNode:"), function $TNXMLNode__initWithNode_(self, _cmd, aNode)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNXMLNode").super_class }, "init"))
    {
        if ((aNode.c) && (aNode.c) != undefined)
        {
            _xmlNode = aNode;
        }
        else
        {
            _xmlNode = new Strophe.Builder('msg');
            _xmlNode.nodeTree = aNode;
            _xmlNode.node = aNode;
        }
    }
    return self;
}
},["TNXMLNode","id"]), new objj_method(sel_getUid("initWithName:andAttributes:"), function $TNXMLNode__initWithName_andAttributes_(self, _cmd, aName, attributes)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNXMLNode").super_class }, "init"))
    {
        _xmlNode = new Strophe.Builder(aName, attributes);
    }
    return self;
}
},["TNXMLNode","CPString","CPDictionary"]), new objj_method(sel_getUid("copy"), function $TNXMLNode__copy(self, _cmd)
{ with(self)
{
    return objj_msgSend(TNXMLNode, "nodeWithXMLNode:", Strophe.copyElement(objj_msgSend(self, "tree")));
}
},["TNXMLNode"]), new objj_method(sel_getUid("addNode:"), function $TNXMLNode__addNode_(self, _cmd, aNode)
{ with(self)
{
    _xmlNode.cnode(objj_msgSend(aNode, "tree"));
}
},["void","TNXMLNode"]), new objj_method(sel_getUid("addTextNode:"), function $TNXMLNode__addTextNode_(self, _cmd, aText)
{ with(self)
{
    _xmlNode = _xmlNode.t(aText);
}
},["void","CPString"]), new objj_method(sel_getUid("text"), function $TNXMLNode__text(self, _cmd)
{ with(self)
{
    return Strophe.getText(objj_msgSend(self, "tree"));
}
},["CPString"]), new objj_method(sel_getUid("tree"), function $TNXMLNode__tree(self, _cmd)
{ with(self)
{
    return _xmlNode.tree();
}
},["id"]), new objj_method(sel_getUid("up"), function $TNXMLNode__up(self, _cmd)
{ with(self)
{
    if (_xmlNode.node && _xmlNode.node.parentNode)
    {
        ret = _xmlNode.up();
        return YES;
    }
    return NO;
}
},["BOOL"]), new objj_method(sel_getUid("stringValue"), function $TNXMLNode__stringValue(self, _cmd)
{ with(self)
{
    return Strophe.serialize(_xmlNode);
}
},["CPString"]), new objj_method(sel_getUid("description"), function $TNXMLNode__description(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "stringValue");
}
},["CPString"]), new objj_method(sel_getUid("valueForAttribute:"), function $TNXMLNode__valueForAttribute_(self, _cmd, anAttribute)
{ with(self)
{
    return objj_msgSend(self, "tree").getAttribute(anAttribute);
}
},["CPString","CPString"]), new objj_method(sel_getUid("setValue:forAttribute:"), function $TNXMLNode__setValue_forAttribute_(self, _cmd, aValue, anAttribute)
{ with(self)
{
    var attr = {};
    attr[anAttribute] = aValue;
    _xmlNode.attrs(attr);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("name"), function $TNXMLNode__name(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "tree").tagName;
}
},["CPString"]), new objj_method(sel_getUid("namespace"), function $TNXMLNode__namespace(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "valueForAttribute:", "xmlns");
}
},["CPString"]), new objj_method(sel_getUid("setNamespace:"), function $TNXMLNode__setNamespace_(self, _cmd, aNamespace)
{ with(self)
{
    objj_msgSend(self, "setValue:forAttribute:", aNamespace, "xmlns");
}
},["void","CPString"]), new objj_method(sel_getUid("addChildWithName:andAttributes:"), function $TNXMLNode__addChildWithName_andAttributes_(self, _cmd, aTagName, attributes)
{ with(self)
{
    _xmlNode = _xmlNode.c(aTagName, attributes);
}
},["void","CPString","CPDictionary"]), new objj_method(sel_getUid("addChildWithName:"), function $TNXMLNode__addChildWithName_(self, _cmd, aTagName)
{ with(self)
{
    objj_msgSend(self, "addChildWithName:andAttributes:", aTagName, {});
}
},["void","CPString"]), new objj_method(sel_getUid("childrenWithName:"), function $TNXMLNode__childrenWithName_(self, _cmd, aName)
{ with(self)
{
    var nodes = objj_msgSend(CPArray, "array"),
        elements = objj_msgSend(self, "tree").getElementsByTagName(aName);
    for (var i = 0; i < elements.length; i++)
        objj_msgSend(nodes, "addObject:", objj_msgSend(TNXMLNode, "nodeWithXMLNode:", elements[i]))
    return nodes;
}
},["CPArray","CPString"]), new objj_method(sel_getUid("ownChildrenWithName:"), function $TNXMLNode__ownChildrenWithName_(self, _cmd, aName)
{ with(self)
{
    var nodes = objj_msgSend(CPArray, "array"),
        elements = objj_msgSend(self, "tree").childNodes;
    for (var i = 0; i < elements.length; i++)
        if ((aName === nil) || (aName && elements [i].tagName == aName))
            objj_msgSend(nodes, "addObject:", objj_msgSend(TNXMLNode, "nodeWithXMLNode:", elements[i]))
    return nodes;
}
},["CPArray","CPString"]), new objj_method(sel_getUid("firstChildWithName:"), function $TNXMLNode__firstChildWithName_(self, _cmd, aName)
{ with(self)
{
    var elements = objj_msgSend(self, "tree").getElementsByTagName(aName);
    if (elements && (elements.length > 0))
        return objj_msgSend(TNXMLNode, "nodeWithXMLNode:", elements[0]);
    else
        return nil;
}
},["TNXMLNode","CPString"]), new objj_method(sel_getUid("children"), function $TNXMLNode__children(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "ownChildrenWithName:", nil);
}
},["CPArray"]), new objj_method(sel_getUid("containsChildrenWithName:"), function $TNXMLNode__containsChildrenWithName_(self, _cmd, aName)
{ with(self)
{
    return (objj_msgSend(self, "firstChildWithName:", aName)) ? YES : NO;
}
},["BOOL","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("nodeWithXMLNode:"), function $TNXMLNode__nodeWithXMLNode_(self, _cmd, aNode)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNXMLNode, "alloc"), "initWithNode:", aNode);
}
},["TNXMLNode","id"]), new objj_method(sel_getUid("nodeWithName:"), function $TNXMLNode__nodeWithName_(self, _cmd, aName)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNXMLNode, "alloc"), "initWithName:andAttributes:", aName, nil);
}
},["TNXMLNode","CPString"]), new objj_method(sel_getUid("nodeWithName:andAttributes:"), function $TNXMLNode__nodeWithName_andAttributes_(self, _cmd, aName, someAttributes)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNXMLNode, "alloc"), "initWithName:andAttributes:", aName, someAttributes);
}
},["TNXMLNode","CPString","CPDictionary"])]);
}
{
var the_class = objj_getClass("TNXMLNode")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"TNXMLNode\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $TNXMLNode__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNXMLNode").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
    }
    return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TNXMLNode__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
}
},["void","CPCoder"])]);
}

p;22;MUC/TNStropheMUCRoom.jt;9390;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;17;../TNStropheJID.ji;24;../TNStropheConnection.ji;20;../TNStropheStanza.ji;20;TNStropheMUCRoster.jt;9216;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("../TNStropheGlobals.j", YES);
objj_executeFile("../TNStropheJID.j", YES);
objj_executeFile("../TNStropheConnection.j", YES);
objj_executeFile("../TNStropheStanza.j", YES);
objj_executeFile("TNStropheMUCRoster.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNStropheMUCRoom"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_messages"), new objj_ivar("_subject"), new objj_ivar("_delegate"), new objj_ivar("_roomJID"), new objj_ivar("_roster"), new objj_ivar("_handlerIDs"), new objj_ivar("_connection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("messages"), function $TNStropheMUCRoom__messages(self, _cmd)
{ with(self)
{
return _messages;
}
},["id"]),
new objj_method(sel_getUid("_setMessages:"), function $TNStropheMUCRoom___setMessages_(self, _cmd, newValue)
{ with(self)
{
_messages = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("subject"), function $TNStropheMUCRoom__subject(self, _cmd)
{ with(self)
{
return _subject;
}
},["id"]),
new objj_method(sel_getUid("_setSubject:"), function $TNStropheMUCRoom___setSubject_(self, _cmd, newValue)
{ with(self)
{
_subject = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $TNStropheMUCRoom__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $TNStropheMUCRoom__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("roomJID"), function $TNStropheMUCRoom__roomJID(self, _cmd)
{ with(self)
{
return _roomJID;
}
},["id"]),
new objj_method(sel_getUid("_setRoomJID:"), function $TNStropheMUCRoom___setRoomJID_(self, _cmd, newValue)
{ with(self)
{
_roomJID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("roster"), function $TNStropheMUCRoom__roster(self, _cmd)
{ with(self)
{
return _roster;
}
},["id"]),
new objj_method(sel_getUid("_setRoster:"), function $TNStropheMUCRoom___setRoster_(self, _cmd, newValue)
{ with(self)
{
_roster = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithRoom:onService:usingConnection:withNick:"), function $TNStropheMUCRoom__initWithRoom_onService_usingConnection_withNick_(self, _cmd, aRoom, aService, aConnection, aNick)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheMUCRoom").super_class }, "init"))
    {
        _connection = aConnection;
        _roomJID = objj_msgSend(TNStropheJID, "stropheJIDWithNode:domain:resource:", aRoom, aService, aNick);
        _handlerIDs = objj_msgSend(CPArray, "array");
        _messages = objj_msgSend(CPArray, "array");
        _roster = objj_msgSend(TNStropheMUCRoster, "rosterWithConnection:forRoom:", _connection, self);
    }
    return self;
}
},["id","CPString","CPString","TNStropheConnection","CPString"]), new objj_method(sel_getUid("directedPresence"), function $TNStropheMUCRoom__directedPresence(self, _cmd)
{ with(self)
{
    return objj_msgSend(TNStropheStanza, "presenceTo:", _roomJID);
}
},["TNStropheStanza"]), new objj_method(sel_getUid("join"), function $TNStropheMUCRoom__join(self, _cmd)
{ with(self)
{
    var messageParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "message", "name",
                                                                     objj_msgSend(_roomJID, "full"), "from",
                                                                     "groupchat", "type",
                                                                     {matchBare: true}, "options"),
        messageHandler = objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("receiveMessage:"), self, messageParams);
    objj_msgSend(_handlerIDs, "addObject:", messageHandler);
    var pmParams = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "message", "name",
                                                                objj_msgSend(_roomJID, "full"), "from",
                                                                 "chat", "type",
                                                                 {matchBare: true}, "options"),
        pmHandler = objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("receivePrivateMessage:"), self, pmParams);
    objj_msgSend(_handlerIDs, "addObject:", pmHandler);
    objj_msgSend(_connection, "send:", objj_msgSend(self, "directedPresence"));
}
},["void"]), new objj_method(sel_getUid("leave"), function $TNStropheMUCRoom__leave(self, _cmd)
{ with(self)
{
    var leavePresence = objj_msgSend(self, "directedPresence");
    objj_msgSend(leavePresence, "setType:", "unavailable");
    objj_msgSend(_connection, "send:", leavePresence);
    for (var i = 0; i < objj_msgSend(_handlerIDs, "count"); i++)
        objj_msgSend(_connection, "deleteRegisteredSelector:", objj_msgSend(_handlerIDs, "objectAtIndex:", i));
}
},["void"]), new objj_method(sel_getUid("setSubject:"), function $TNStropheMUCRoom__setSubject_(self, _cmd, aSubject)
{ with(self)
{
    var message = objj_msgSend(TNStropheStanza, "message");
    objj_msgSend(message, "setType:", "groupchat");
    objj_msgSend(message, "addChildWithName:", "subject");
    objj_msgSend(message, "addTextNode:", aSubject);
    objj_msgSend(self, "sendStanzaToRoom:", message);
}
},["void","CPString"]), new objj_method(sel_getUid("sayToRoom:"), function $TNStropheMUCRoom__sayToRoom_(self, _cmd, aMessage)
{ with(self)
{
    var message = objj_msgSend(TNStropheStanza, "message");
    objj_msgSend(message, "setType:", "groupchat");
    objj_msgSend(message, "addChildWithName:", "body");
    objj_msgSend(message, "addTextNode:", aMessage);
    objj_msgSend(self, "sendStanzaToRoom:", message);
}
},["void","CPString"]), new objj_method(sel_getUid("sendStanzaToRoom:"), function $TNStropheMUCRoom__sendStanzaToRoom_(self, _cmd, aStanza)
{ with(self)
{
    objj_msgSend(aStanza, "setTo:", objj_msgSend(_roomJID, "bare"));
    objj_msgSend(_connection, "send:", aStanza);
}
},["void","TNStropheStanza"]), new objj_method(sel_getUid("receiveMessage:"), function $TNStropheMUCRoom__receiveMessage_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "subject"))
    {
        _subject = objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "subject"), "text");
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("mucRoom:receivedNewSubject:")))
            objj_msgSend(_delegate, "mucRoom:receivedNewSubject:", self, _subject);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheMUCSubjectWasUpdatedNotification, self, aStanza);
    }
    if (objj_msgSend(aStanza, "containsChildrenWithName:", "body"))
    {
        var body = objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "body"), "text"),
            contact = objj_msgSend(_roster, "contactWithJID:", objj_msgSend(aStanza, "from")),
            message = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", body,"body",
                                                                 contact,"from",
                                                                 objj_msgSend(aStanza, "delayTime"),"time");
        objj_msgSend(_messages, "addObject:", message);
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("mucRoom:receivedMessage:")))
            objj_msgSend(_delegate, "mucRoom:receivedMessage:", self, message);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheMUCConversationWasUpdatedNotification, self, aStanza);
    }
    var otherChildren = objj_msgSend(aStanza, "children");
    objj_msgSend(otherChildren, "removeObjectsInArray:", objj_msgSend(aStanza, "childrenWithName:", "body"));
    objj_msgSend(otherChildren, "removeObjectsInArray:", objj_msgSend(aStanza, "childrenWithName:", "subject"));
    if (objj_msgSend(otherChildren, "count") > 0)
    {
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("mucRoom:receivedData:")))
            objj_msgSend(_delegate, "mucRoom:receivedData:", self, aStanza);
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheMUCDataReceivedNotification, self, aStanza);
    }
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("receivePrivateMessage:"), function $TNStropheMUCRoom__receivePrivateMessage_(self, _cmd, aMessage)
{ with(self)
{
    return YES;
}
},["BOOL","TNStropheStanza"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("joinRoom:onService:usingConnection:withNick:"), function $TNStropheMUCRoom__joinRoom_onService_usingConnection_withNick_(self, _cmd, aRoom, aService, aConnection, aNick)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheMUCRoom, "alloc"), "initWithRoom:onService:usingConnection:withNick:", aRoom, aService, aConnection, aNick);
}
},["TNStropheMUCRoom","CPString","CPString","TNStropheConnection","CPString"])]);
}

p;24;MUC/TNStropheMUCRoster.jt;7746;@STATIC;1.0;I;23;Foundation/Foundation.ji;24;../TNStropheRosterBase.jt;7670;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("../TNStropheRosterBase.j", YES);
{var the_class = objj_allocateClassPair(TNStropheRosterBase, "TNStropheMUCRoster"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_admins"), new objj_ivar("_moderators"), new objj_ivar("_owners"), new objj_ivar("_participants"), new objj_ivar("_visitors"), new objj_ivar("_room")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("admins"), function $TNStropheMUCRoster__admins(self, _cmd)
{ with(self)
{
return _admins;
}
},["id"]),
new objj_method(sel_getUid("_setAdmins:"), function $TNStropheMUCRoster___setAdmins_(self, _cmd, newValue)
{ with(self)
{
_admins = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("moderators"), function $TNStropheMUCRoster__moderators(self, _cmd)
{ with(self)
{
return _moderators;
}
},["id"]),
new objj_method(sel_getUid("_setModerators:"), function $TNStropheMUCRoster___setModerators_(self, _cmd, newValue)
{ with(self)
{
_moderators = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("owners"), function $TNStropheMUCRoster__owners(self, _cmd)
{ with(self)
{
return _owners;
}
},["id"]),
new objj_method(sel_getUid("_setOwners:"), function $TNStropheMUCRoster___setOwners_(self, _cmd, newValue)
{ with(self)
{
_owners = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("participants"), function $TNStropheMUCRoster__participants(self, _cmd)
{ with(self)
{
return _participants;
}
},["id"]),
new objj_method(sel_getUid("_setParticipants:"), function $TNStropheMUCRoster___setParticipants_(self, _cmd, newValue)
{ with(self)
{
_participants = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("visitors"), function $TNStropheMUCRoster__visitors(self, _cmd)
{ with(self)
{
return _visitors;
}
},["id"]),
new objj_method(sel_getUid("_setVisitors:"), function $TNStropheMUCRoster___setVisitors_(self, _cmd, newValue)
{ with(self)
{
_visitors = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("room"), function $TNStropheMUCRoster__room(self, _cmd)
{ with(self)
{
return _room;
}
},["id"]),
new objj_method(sel_getUid("_setRoom:"), function $TNStropheMUCRoster___setRoom_(self, _cmd, newValue)
{ with(self)
{
_room = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithConnection:forRoom:"), function $TNStropheMUCRoster__initWithConnection_forRoom_(self, _cmd, aConnection, aRoom)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheMUCRoster").super_class }, "initWithConnection:", aConnection))
    {
        _room = aRoom;
        _visitors = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "Visitors");
        _participants = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "Participants");
        _moderators = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "Moderators");
        _admins = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "Admins");
        _owners = objj_msgSend(TNStropheGroup, "stropheGroupWithName:", "Owners");
        var params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "presence", "name",
                                                                     objj_msgSend(objj_msgSend(_room, "roomJID"), "full"), "from",
                                                                     {matchBare: true}, "options");
        objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceivePresence:"), self, params);
    }
    return self;
}
},["id","TNStropheConnection","TNStropheMUCRoom"]), new objj_method(sel_getUid("_didReceivePresence:"), function $TNStropheMUCRoster___didReceivePresence_(self, _cmd, aStanza)
{ with(self)
{
    var contact = objj_msgSend(self, "contactWithFullJID:", objj_msgSend(aStanza, "from")),
        data = objj_msgSend(aStanza, "firstChildWithName:", "x"),
        group;
    if (data && objj_msgSend(data, "namespace") == "http://jabber.org/protocol/muc#user")
    {
        switch (objj_msgSend(objj_msgSend(data, "firstChildWithName:", "item"), "valueForAttribute:", "role"))
        {
            case "visitor":
                group = _visitors;
                break;
            case "participant":
                group = _participants;
                break;
            case "moderator":
                group = _moderators;
                break;
        }
    }
    if (contact)
        objj_msgSend(contact, "_didReceivePresence:", aStanza);
    else
    {
        contact = objj_msgSend(self, "addContact:withName:inGroup:", objj_msgSend(aStanza, "from"), objj_msgSend(objj_msgSend(aStanza, "from"), "resource"), group);
    }
    if (objj_msgSend(aStanza, "type") === "unavailable")
    {
        var statusCode;
        if (objj_msgSend(data, "containsChildrenWithName:", "status"))
            statusCode = objj_msgSend(objj_msgSend(data, "firstChildWithName:", "status"), "valueForAttribute:", "code");
        objj_msgSend(self, "removeContact:withStatusCode:", contact, statusCode);
    }
    return YES;
}
},["BOOL","id"]), new objj_method(sel_getUid("addContact:withName:inGroup:"), function $TNStropheMUCRoster__addContact_withName_inGroup_(self, _cmd, aJID, aName, aGroup)
{ with(self)
{
    if (objj_msgSend(self, "containsFullJID:", aJID))
        return;
    if (!aGroup)
        aGroup = _visitors;
    var contact = objj_msgSend(TNStropheContact, "contactWithConnection:JID:groupName:", _connection, aJID, objj_msgSend(aGroup, "name"));
    objj_msgSend(contact, "setNickname:", aName);
    objj_msgSend(aGroup, "addContact:", contact);
    objj_msgSend(_contacts, "addObject:", contact);
    var userInfo = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", contact, "contact");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheMUCContactJoinedNotification, self, userInfo);
    return contact;
}
},["TNStropheContact","TNStropheJID","CPString","TNStropheGroup"]), new objj_method(sel_getUid("removeContact:withStatusCode:"), function $TNStropheMUCRoster__removeContact_withStatusCode_(self, _cmd, aContact, aStatusCode)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNStropheMUCRoster").super_class }, "removeContact:", aContact);
    var userInfo = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", aStatusCode, "statusCode",
                                                             aContact, "contact");
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStropheMUCContactLeftNotification, self, userInfo);
}
},["void","TNStropheContact","CPString"]), new objj_method(sel_getUid("groupOfContact:"), function $TNStropheMUCRoster__groupOfContact_(self, _cmd, aContact)
{ with(self)
{
    var groups = objj_msgSend(CPArray, "arrayWithObjects:", _visitors, _participants, _moderators, _admins, _owners);
    for (var i = 0; i < objj_msgSend(groups, "count"); i++)
    {
        var group = objj_msgSend(groups, "objectAtIndex:", i);
        if (objj_msgSend(objj_msgSend(group, "contacts"), "containsObject:", aContact))
            return group;
    }
    return nil;
}
},["TNStropheGroup","TNStropheContact"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("rosterWithConnection:forRoom:"), function $TNStropheMUCRoster__rosterWithConnection_forRoom_(self, _cmd, aConnection, aRoom)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNStropheMUCRoster, "alloc"), "initWithConnection:forRoom:", aConnection, aRoom);
}
},["TNStropheMUCRoster","TNStropheConnection","TNStropheMUCRoom"])]);
}

p;27;PubSub/TNPubSubController.jt;14712;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;24;../TNStropheConnection.ji;14;TNPubSubNode.jt;14590;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("../TNStropheGlobals.j", YES);
objj_executeFile("../TNStropheConnection.j", YES);
objj_executeFile("TNPubSubNode.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNPubSubController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_nodes"), new objj_ivar("_servers"), new objj_ivar("_delegate"), new objj_ivar("_connection"), new objj_ivar("_subscriptionBatches"), new objj_ivar("_unsubscriptionBatches"), new objj_ivar("_numberOfPromptedServers")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("nodes"), function $TNPubSubController__nodes(self, _cmd)
{ with(self)
{
return _nodes;
}
},["id"]),
new objj_method(sel_getUid("_setNodes:"), function $TNPubSubController___setNodes_(self, _cmd, newValue)
{ with(self)
{
_nodes = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("servers"), function $TNPubSubController__servers(self, _cmd)
{ with(self)
{
return _servers;
}
},["id"]),
new objj_method(sel_getUid("setServers:"), function $TNPubSubController__setServers_(self, _cmd, newValue)
{ with(self)
{
_servers = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $TNPubSubController__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $TNPubSubController__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithConnection:pubSubServer:"), function $TNPubSubController__initWithConnection_pubSubServer_(self, _cmd, aConnection, aPubSubServer)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNPubSubController").super_class }, "init"))
    {
        _connection = aConnection;
        _servers = objj_msgSend(CPArray, "arrayWithObject:", (aPubSubServer || objj_msgSend(TNStropheJID, "stropheJIDWithString:", "pubsub." + objj_msgSend(objj_msgSend(aConnection, "JID"), "domain"))));
        _numberOfPromptedServers = 0;
        _nodes = objj_msgSend(CPArray, "array");
        _subscriptionBatches = objj_msgSend(CPDictionary, "dictionary");
        _unsubscriptionBatches = objj_msgSend(CPDictionary, "dictionary");
    }
    return self;
}
},["TNPubSubNode","TNStropheConnection","TNStropheJID"]), new objj_method(sel_getUid("_didSubscribeToNode:"), function $TNPubSubController___didSubscribeToNode_(self, _cmd, aNotification)
{ with(self)
{
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubController:subscribedToNode:")))
        objj_msgSend(_delegate, "pubSubController:subscribedToNode:", self, objj_msgSend(aNotification, "object"))
}
},["void","CPNotification"]), new objj_method(sel_getUid("_didUnsubscribeToNode:"), function $TNPubSubController___didUnsubscribeToNode_(self, _cmd, aNotification)
{ with(self)
{
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubController:unsubscribedFromNode:")))
        objj_msgSend(_delegate, "pubSubController:unsubscribedFromNode:", self, objj_msgSend(aNotification, "object"))
}
},["void","CPNotification"]), new objj_method(sel_getUid("_didBatchSubscribe:"), function $TNPubSubController___didBatchSubscribe_(self, _cmd, aNotification)
{ with(self)
{
    var node = objj_msgSend(aNotification, "object"),
        batchID = objj_msgSend(aNotification, "useInfo"),
        batch = objj_msgSend(_subscriptionBatches, "valueForKey:", batchID),
        params = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", batchID, "batchID");
    objj_msgSend(batch, "removeObjectIdenticalTo:", objj_msgSend(node, "name"));
    if (objj_msgSend(batch, "count") === 0)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStrophePubSubBatchSubscribeComplete, self, params);
}
},["void","CPNotification"]), new objj_method(sel_getUid("_didBatchUnsubscribe:"), function $TNPubSubController___didBatchUnsubscribe_(self, _cmd, aNotification)
{ with(self)
{
    var node = objj_msgSend(aNotification, "object"),
        batchID = objj_msgSend(aNotification, "useInfo"),
        batch = objj_msgSend(_unsubscriptionBatches, "valueForKey:", batchID),
        params = objj_msgSend(CPDictionary, "dictionaryWithObject:forKey:", batchID, "batchID");
    objj_msgSend(batch, "removeObjectIdenticalTo:", objj_msgSend(node, "name"));
    if (objj_msgSend(batch, "count") === 0)
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStrophePubSubBatchUnsubscribeComplete, self, params);
}
},["void","CPNotification"]), new objj_method(sel_getUid("containsServerJID:"), function $TNPubSubController__containsServerJID_(self, _cmd, aServerJID)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_servers, "count"); i++)
        if (objj_msgSend(objj_msgSend(_servers, "objectAtIndex:", i), "node") == objj_msgSend(aServerJID, "node"))
            return YES;
    return NO;
}
},["BOOL","TNStropheJID"]), new objj_method(sel_getUid("nodeWithName:server:"), function $TNPubSubController__nodeWithName_server_(self, _cmd, aNodeName, aServer)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_nodes, "count"); i++)
    {
        var node = objj_msgSend(_nodes, "objectAtIndex:", i);
        if ((objj_msgSend(node, "name") === aNodeName) && (!aServer || objj_msgSend(objj_msgSend(node, "server"), "equals:", aServer)))
            return node;
    }
    return nil;
}
},["TNPubSubNode","CPString","TNStropheJID"]), new objj_method(sel_getUid("nodeWithName:"), function $TNPubSubController__nodeWithName_(self, _cmd, aNodeName)
{ with(self)
{
    return objj_msgSend(self, "nodeWithName:server:", aNodeName, nil);
}
},["TNPubSubNode","CPString"]), new objj_method(sel_getUid("findOrCreateNodeWithName:server:"), function $TNPubSubController__findOrCreateNodeWithName_server_(self, _cmd, aNodeName, aServer)
{ with(self)
{
    var node = objj_msgSend(self, "nodeWithName:server:", aNodeName, aServer);
    if (!objj_msgSend(self, "containsServerJID:", aServer))
        objj_msgSend(_servers, "addObject:", aServer);
    if (!node)
    {
        node = objj_msgSend(TNPubSubNode, "pubSubNodeWithNodeName:connection:pubSubServer:", aNodeName, _connection, aServer);
        objj_msgSend(_nodes, "addObject:", node);
    }
    return node;
}
},["TNPubSubNode","CPString","TNStropheJID"]), new objj_method(sel_getUid("retrieveSubscriptions"), function $TNPubSubController__retrieveSubscriptions(self, _cmd)
{ with(self)
{
    _numberOfPromptedServers = 0;
    for (var i = 0; i < objj_msgSend(_servers, "count"); i++)
    {
        var uid = objj_msgSend(_connection, "getUniqueId"),
            stanza = objj_msgSend(TNStropheStanza, "iqWithAttributes:", {"type": "get", "to": objj_msgSend(_servers, "objectAtIndex:", i), "id": uid}),
            params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid,"id");
        objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
        objj_msgSend(stanza, "addChildWithName:", "subscriptions");
        objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didRetrieveSubscriptions:"), self, params);
        objj_msgSend(_connection, "send:", stanza);
    }
}
},["void"]), new objj_method(sel_getUid("_didRetrieveSubscriptions:"), function $TNPubSubController___didRetrieveSubscriptions_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        var subscriptions = objj_msgSend(aStanza, "childrenWithName:", "subscription"),
            server = objj_msgSend(aStanza, "from");
        for (var i = 0; i < objj_msgSend(subscriptions, "count"); i++)
        {
            var subscription = objj_msgSend(subscriptions, "objectAtIndex:", i),
                nodeName = objj_msgSend(subscription, "valueForAttribute:", "node"),
                subid = objj_msgSend(subscription, "valueForAttribute:", "subid"),
                node = objj_msgSend(self, "findOrCreateNodeWithName:server:", nodeName, server);
            objj_msgSend(node, "addSubscriptionID:", subid);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didSubscribeToNode:"), TNStrophePubSubNodeSubscribedNotification, node);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didUnsubscribeToNode:"), TNStrophePubSubNodeUnsubscribedNotification, node);
        }
        _numberOfPromptedServers++;
        if (_numberOfPromptedServers >= objj_msgSend(_servers, "count"))
        {
            _numberOfPromptedServers = 0;
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubSubscriptionsRetrievedNotification, self);
            if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubController:retrievedSubscriptions:")))
                objj_msgSend(_delegate, "pubSubController:retrievedSubscriptions:", self, YES);
        }
    }
    else
    {
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubController:retrievedSubscriptions:")))
            objj_msgSend(_delegate, "pubSubController:retrievedSubscriptions:", self, NO);
        CPLog.error("Cannot retrieve the contents of pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("subscribeToNodeWithName:server:nodeDelegate:"), function $TNPubSubController__subscribeToNodeWithName_server_nodeDelegate_(self, _cmd, aNodeName, aServer, nodeDelegate)
{ with(self)
{
    var node = objj_msgSend(self, "findOrCreateNodeWithName:server:", aNodeName, aServer);
    objj_msgSend(node, "setDelegate:", nodeDelegate);
    objj_msgSend(node, "subscribe");
    return node;
}
},["TNPubSubNode","CPString","TNStropheJID","id"]), new objj_method(sel_getUid("subscribeToNodeWithName:server:"), function $TNPubSubController__subscribeToNodeWithName_server_(self, _cmd, aNodeName, aServer)
{ with(self)
{
    return objj_msgSend(self, "subscribeToNodeWithName:server:nodeDelegate:", aNodeName, aServer, nil);
}
},["TNPubSubNode","CPString","TNStropheJID"]), new objj_method(sel_getUid("subscribeToNodesWithNames:nodesDelegate:"), function $TNPubSubController__subscribeToNodesWithNames_nodesDelegate_(self, _cmd, someNodes, aDelegate)
{ with(self)
{
    var batchID = objj_msgSend(_connection, "getUniqueId"),
        servers = objj_msgSend(someNodes, "allKeys");
    objj_msgSend(_subscriptionBatches, "setValue:forKey:", someNodes, batchID);
    for (var k = 0; k < objj_msgSend(servers, "count"); k++)
    {
        var server = objj_msgSend(servers, "objectAtIndex:", k),
            nodes = objj_msgSend(servers, "valueForKey:", server);
        for (var i = 0; i < objj_msgSend(nodes, "count"); i++)
        {
            var nodeName = objj_msgSend(nodes, "objectAtIndex:", i),
                node = objj_msgSend(self, "subscribeToNodeWithName:server:nodeDelegate:", nodeName, server, aDelegate);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:userInfo:", self, sel_getUid("_didBatchSubscribe:"), TNStrophePubSubNodeSubscribedNotification, node, batchID);
        }
    }
    return batchID;
}
},["CPString","CPDictionary","id"]), new objj_method(sel_getUid("unsubscribeFromNodeWithName:server:nodeDelegate:"), function $TNPubSubController__unsubscribeFromNodeWithName_server_nodeDelegate_(self, _cmd, aNodeName, aServer, nodeDelegate)
{ with(self)
{
    var node = objj_msgSend(self, "findOrCreateNodeWithName:server:", aNodeName, aServer);
    objj_msgSend(node, "setDelegate:", nodeDelegate);
    objj_msgSend(node, "unsubscribe");
    return node;
}
},["TNPubSubNode","CPString","TNStropheJID","id"]), new objj_method(sel_getUid("unsubscribeFromNodeWithName:server:"), function $TNPubSubController__unsubscribeFromNodeWithName_server_(self, _cmd, aNodeName, aServer)
{ with(self)
{
    return objj_msgSend(self, "unsubscribeFromNodeWithName:server:nodeDelegate:", aNodeName, aServer, nil);
}
},["TNPubSubNode","CPString","TNStropheJID"]), new objj_method(sel_getUid("unsubscribeFromNodesWithNames:nodesDelegate:"), function $TNPubSubController__unsubscribeFromNodesWithNames_nodesDelegate_(self, _cmd, someNodes, aDelegate)
{ with(self)
{
    var batchID = objj_msgSend(_connection, "getUniqueId"),
        servers = objj_msgSend(someNodes, "allKeys");
    objj_msgSend(_unsubscriptionBatches, "setValue:forKey:", someNodes, batchID);
    for (var k = 0; k < objj_msgSend(servers, "count"); k++)
    {
        var server = objj_msgSend(servers, "objectAtIndex:", k),
            nodes = objj_msgSend(servers, "valueForKey:", server);
        for (var i = 0; i < objj_msgSend(nodes, "count"); i++)
        {
            var nodeName = objj_msgSend(nodes, "objectAtIndex:", i),
                node = objj_msgSend(self, "unsubscribeFromNodeWithName:server:nodeDelegate:", nodeName, server, aDelegate);
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:userInfo:", self, sel_getUid("_didBatchUnsubscribe:"), TNStrophePubSubNodeUnsubscribedNotification, node, batchID);
        }
    }
    return batchID;
}
},["CPString","CPDictionary","id"]), new objj_method(sel_getUid("unsubscribeFromAllNodes"), function $TNPubSubController__unsubscribeFromAllNodes(self, _cmd)
{ with(self)
{
    for (var i = 0; i < objj_msgSend(_nodes, "count"); i++)
        objj_msgSend(objj_msgSend(_nodes, "objectAtIndex:", i), "unsubscribe");
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("pubSubControllerWithConnection:pubSubServer:"), function $TNPubSubController__pubSubControllerWithConnection_pubSubServer_(self, _cmd, aConnection, aPubSubServer)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNPubSubController, "alloc"), "initWithConnection:pubSubServer:", aConnection, aPubSubServer);
}
},["TNPubSubNode","TNStropheConnection","CPString"]), new objj_method(sel_getUid("pubSubControllerWithConnection:"), function $TNPubSubController__pubSubControllerWithConnection_(self, _cmd, aConnection)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNPubSubController, "alloc"), "initWithConnection:pubSubServer:", aConnection, nil);
}
},["TNPubSubNode","TNStropheConnection"])]);
}

p;21;PubSub/TNPubSubNode.jt;25692;@STATIC;1.0;I;23;Foundation/Foundation.ji;21;../TNStropheGlobals.ji;24;../TNStropheConnection.ji;20;../TNStropheStanza.jt;25564;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("../TNStropheGlobals.j", YES);
objj_executeFile("../TNStropheConnection.j", YES);
objj_executeFile("../TNStropheStanza.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "TNPubSubNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_content"), new objj_ivar("_delegate"), new objj_ivar("_nodeName"), new objj_ivar("_pubSubServer"), new objj_ivar("_connection"), new objj_ivar("_eventSelectorID"), new objj_ivar("_subscriptionIDs")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("content"), function $TNPubSubNode__content(self, _cmd)
{ with(self)
{
return _content;
}
},["id"]),
new objj_method(sel_getUid("_setContent:"), function $TNPubSubNode___setContent_(self, _cmd, newValue)
{ with(self)
{
_content = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegate"), function $TNPubSubNode__delegate(self, _cmd)
{ with(self)
{
return _delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $TNPubSubNode__setDelegate_(self, _cmd, newValue)
{ with(self)
{
_delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $TNPubSubNode__name(self, _cmd)
{ with(self)
{
return _nodeName;
}
},["id"]),
new objj_method(sel_getUid("_setNodeName:"), function $TNPubSubNode___setNodeName_(self, _cmd, newValue)
{ with(self)
{
_nodeName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("server"), function $TNPubSubNode__server(self, _cmd)
{ with(self)
{
return _pubSubServer;
}
},["id"]),
new objj_method(sel_getUid("_setPubSubServer:"), function $TNPubSubNode___setPubSubServer_(self, _cmd, newValue)
{ with(self)
{
_pubSubServer = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithNodeName:connection:pubSubServer:"), function $TNPubSubNode__initWithNodeName_connection_pubSubServer_(self, _cmd, aNodeName, aConnection, aPubSubServer)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TNPubSubNode").super_class }, "init"))
    {
        _nodeName = aNodeName;
        _connection = aConnection;
        _pubSubServer = aPubSubServer ? aPubSubServer : objj_msgSend(TNStropheJID, "stropheJIDWithSring:", "pubsub." + objj_msgSend(objj_msgSend(_connection, "JID"), "domain"));
        _subscriptionIDs = objj_msgSend(CPArray, "array");
        objj_msgSend(self, "_setEventHandler");
    }
    return self;
}
},["TNPubSubNode","CPString","TNStropheConnection","TNStropheJID"]), new objj_method(sel_getUid("initWithNodeName:connection:pubSubServer:subscriptionIDs:"), function $TNPubSubNode__initWithNodeName_connection_pubSubServer_subscriptionIDs_(self, _cmd, aNodeName, aConnection, aPubSubServer, aSubscriptionIDs)
{ with(self)
{
    if (self = objj_msgSend(self, "initWithNodeName:connection:pubSubServer:", aNodeName, aConnection, aPubSubServer))
    {
        _subscriptionIDs = aSubscriptionIDs;
    }
    return self;
}
},["TNPubSubNode","CPString","TNStropheConnection","CPString","CPArray"]), new objj_method(sel_getUid("retrieveItems"), function $TNPubSubNode__retrieveItems(self, _cmd)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "get");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "items", {"node": _nodeName});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didRetrievePubSubNode:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void"]), new objj_method(sel_getUid("_didRetrievePubSubNode:"), function $TNPubSubNode___didRetrievePubSubNode_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        _content = objj_msgSend(aStanza, "childrenWithName:", "item");
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeRetrievedNotification, self);
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:retrievedItems:")))
            objj_msgSend(_delegate, "pubSubNode:retrievedItems:", self, YES);
    }
    else
    {
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:retrievedItems:")))
            objj_msgSend(_delegate, "pubSubNode:retrievedItems:", self, NO);
        CPLog.error("Cannot retrieve the contents of pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("create"), function $TNPubSubNode__create(self, _cmd)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "create", {"node": _nodeName});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didCreatePubSubNode:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void"]), new objj_method(sel_getUid("_didCreatePubSubNode:"), function $TNPubSubNode___didCreatePubSubNode_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeCreatedNotification, self);
    else
    {
        CPLog.error("Cannot create the pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("delete"), function $TNPubSubNode__delete(self, _cmd)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB_OWNER});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "delete", {"node": _nodeName});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("didDeletePubSubNode:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void"]), new objj_method(sel_getUid("_didCreatePubSubNode:"), function $TNPubSubNode___didCreatePubSubNode_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeDeletedNotification, self);
    else
    {
        CPLog.error("Cannot delete the pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("configureWithDict:"), function $TNPubSubNode__configureWithDict_(self, _cmd, aDictionary)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB_OWNER});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "configure", {"node": _nodeName});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "x", {"xmlns": "jabber:x:data", "type": "submit"});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "field", {"var": "FORM_TYPE", "type": "hidden"});
    objj_msgSend(stanza, "addChildWithName:", "value");
    objj_msgSend(stanza, "addTextNode:", Strophe.NS.PUBSUB_NODE_CONFIG);
    objj_msgSend(stanza, "up");
    objj_msgSend(stanza, "up");
    for (var i = 0; i < objj_msgSend(objj_msgSend(aDictionary, "allKeys"), "count"); i++)
    {
        var key = objj_msgSend(objj_msgSend(aDictionary, "allKeys"), "objectAtIndex:", i),
            value = objj_msgSend(aDictionary, "objectForKey:", key);
        objj_msgSend(stanza, "addChildWithName:andAttributes:", "field", {"var": key});
        if (objj_msgSend(value, "class") == CPArray)
        {
            for (var j = 0; j < objj_msgSend(value, "count"); j++)
            {
                objj_msgSend(stanza, "addChildWithName:", "value");
                objj_msgSend(stanza, "addTextNode:", "" + objj_msgSend(value, "objectAtIndex:", j) + "");
                objj_msgSend(stanza, "up");
            }
        }
        else
        {
            objj_msgSend(stanza, "addChildWithName:", "value");
            objj_msgSend(stanza, "addTextNode:", "" + value + "");
            objj_msgSend(stanza, "up");
        }
        objj_msgSend(stanza, "up");
    }
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didConfigurePubSubNode:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void","CPDictionary"]), new objj_method(sel_getUid("_didConfigurePubSubNode:"), function $TNPubSubNode___didConfigurePubSubNode_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeConfiguredNotification, self);
    else
    {
        CPLog.error("Cannot configure the pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("publishItem:"), function $TNPubSubNode__publishItem_(self, _cmd, anItem)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "publish", {"node": _nodeName});
    objj_msgSend(stanza, "addChildWithName:", "item");
    objj_msgSend(stanza, "addNode:", anItem);
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didPublishPubSubItem:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void","TNXMLNode"]), new objj_method(sel_getUid("_didPublishPubSubItem:"), function $TNPubSubNode___didPublishPubSubItem_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didUpdateContentAfterPublishing:"), TNStrophePubSubNodeRetrievedNotification, self);
        objj_msgSend(self, "retrieveItems");
    }
    else
    {
        CPLog.error("Cannot publish the pubsub item in node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("_didUpdateContentAfterPublishing:"), function $TNPubSubNode___didUpdateContentAfterPublishing_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, TNStrophePubSubNodeRetrievedNotification, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubItemPublishedNotification, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("retractItemWithID:"), function $TNPubSubNode__retractItemWithID_(self, _cmd, anID)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "retract", {"node": _nodeName});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "item", {"id": anID});
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didRetractPubSubItem:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void","CPString"]), new objj_method(sel_getUid("_didRetractPubSubItem:"), function $TNPubSubNode___didRetractPubSubItem_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, sel_getUid("_didUpdateContentAfterRetracting:"), TNStrophePubSubNodeRetrievedNotification, self);
        objj_msgSend(self, "retrieveItems");
    }
    else
    {
        CPLog.error("Cannot remove the pubsub item in node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("_didUpdateContentAfterRetracting:"), function $TNPubSubNode___didUpdateContentAfterRetracting_(self, _cmd, aNotification)
{ with(self)
{
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, TNStrophePubSubNodeRetrievedNotification, self);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubItemRetractedNotification, self);
}
},["void","CPNotification"]), new objj_method(sel_getUid("subscribe"), function $TNPubSubNode__subscribe(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "subscribeWithOptions:", nil);
}
},["void"]), new objj_method(sel_getUid("subscribeWithOptions:"), function $TNPubSubNode__subscribeWithOptions_(self, _cmd, options)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "subscribe", {"node": _nodeName, "jid": objj_msgSend(objj_msgSend(_connection, "JID"), "bare")});
    if (options && objj_msgSend(options, "count") > 0)
    {
        objj_msgSend(subscribeStanza, "up");
        objj_msgSend(subscribeStanza, "addChildWithName:", "options");
        objj_msgSend(subscribeStanza, "addChildWithName:andAttributes:", "x", {"xmlns":Strophe.NS.X_DATA, "type":"submit"});
        objj_msgSend(subscribeStanza, "addChildWithName:andAttributes:", "field", {"var":"FORM_TYPE", "type":"hidden"});
        objj_msgSend(subscribeStanza, "addChildWithName:", "value");
        objj_msgSend(subscribeStanza, "addTextNode:", Strophe.NS.PUBSUB_SUBSCRIBE_OPTIONS);
        objj_msgSend(subscribeStanza, "up");
        objj_msgSend(subscribeStanza, "up");
        var keys = objj_msgSend(options, "allKeys");
        for (var i = 0; i < objj_msgSend(keys, "count"); i++)
        {
            var key = objj_msgSend(keys, "objectAtIndex:", i),
                value = objj_msgSend(options, "valueForKey:", key);
            objj_msgSend(subscribeStanza, "addChildWithName:andAttributes:", "field", {"var":key});
            objj_msgSend(subscribeStanza, "addChildWithName:", "value");
            objj_msgSend(subscribeStanza, "addTextNode:", value);
            objj_msgSend(subscribeStanza, "up");
            objj_msgSend(subscribeStanza, "up");
        }
    }
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didSubscribe:"), self, params)
    objj_msgSend(_connection, "send:", stanza);
}
},["void","CPDictionary"]), new objj_method(sel_getUid("_didSubscribe:"), function $TNPubSubNode___didSubscribe_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        var subscription = objj_msgSend(aStanza, "firstChildWithName:", "subscription"),
            subID = objj_msgSend(subscription, "valueForAttribute:", "subid"),
            status = objj_msgSend(subscription, "valueForAttribute:", "subscription");
        if (objj_msgSend(subID, "length") > 0)
            objj_msgSend(_subscriptionIDs, "addObject:", subID);
        if (status === "subscribed")
        {
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeSubscribedNotification, self);
            if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:subscribed:")))
                objj_msgSend(_delegate, "pubSubNode:subscribed:", self, YES);
        }
        objj_msgSend(self, "_setEventHandler");
    }
    else
    {
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:subscribed:")))
            objj_msgSend(_delegate, "pubSubNode:subscribed:", self, NO);
        CPLog.error("Cannot subscribe the pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("addSubscriptionID:"), function $TNPubSubNode__addSubscriptionID_(self, _cmd, aSubscriptionID)
{ with(self)
{
    objj_msgSend(_subscriptionIDs, "addObject:", aSubscriptionID);
}
},["void","CPString"]), new objj_method(sel_getUid("unsubscribeWithSubID:"), function $TNPubSubNode__unsubscribeWithSubID_(self, _cmd, aSubID)
{ with(self)
{
    var uid = objj_msgSend(_connection, "getUniqueId"),
        stanza = objj_msgSend(TNStropheStanza, "iq"),
        params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", uid, "id");
    objj_msgSend(stanza, "setType:", "set");
    objj_msgSend(stanza, "setID:", uid);
    objj_msgSend(stanza, "setTo:", _pubSubServer);
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "pubsub", {"xmlns": Strophe.NS.PUBSUB});
    objj_msgSend(stanza, "addChildWithName:andAttributes:", "unsubscribe", {"node": _nodeName, "jid": objj_msgSend(objj_msgSend(_connection, "JID"), "bare")});
    if (aSubID)
        objj_msgSend(stanza, "setValue:forAttribute:", aSubID, "subid");
    objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didUnsubscribe:"), self, params);
    objj_msgSend(_connection, "send:", stanza);
}
},["void","CPString"]), new objj_method(sel_getUid("unsubscribe"), function $TNPubSubNode__unsubscribe(self, _cmd)
{ with(self)
{
    if (objj_msgSend(_subscriptionIDs, "count") > 0)
    {
        for (var i = 0; i < objj_msgSend(_subscriptionIDs, "count"); i++)
        {
            objj_msgSend(self, "unsubscribeWithSubID:", objj_msgSend(_subscriptionIDs, "objectAtIndex:", i));
        }
    }
    else
    {
        objj_msgSend(self, "unsubscribeWithSubID:", nil);
    }
}
},["void"]), new objj_method(sel_getUid("_didUnsubscribe:"), function $TNPubSubNode___didUnsubscribe_(self, _cmd, aStanza)
{ with(self)
{
    if (objj_msgSend(aStanza, "type") == "result")
    {
        var params = objj_msgSend(CPDictionary, "dictionary"),
            subID = objj_msgSend(objj_msgSend(objj_msgSend(aStanza, "firstChildWithName:", "pubsub"), "firstChildWithName:", "subscription"), "valueForAttribute:", "subid");
        if (objj_msgSend(subID, "length") > 0)
        {
            objj_msgSend(_subscriptionIDs, "removeObject:", subID);
            objj_msgSend(params, "setObject:forKey:", subID, "subscriptionID");
        }
        else if (objj_msgSend(_subscriptionIDs, "count") === 1)
        {
            objj_msgSend(_subscriptionIDs, "removeAllObjects");
        }
        if (objj_msgSend(_subscriptionIDs, "count") === 0)
        {
            if (_eventSelectorID)
            {
                objj_msgSend(_connection, "deleteRegisteredSelector:", _eventSelectorID);
                _eventSelectorID = nil;
            }
        }
        objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStrophePubSubNodeUnsubscribedNotification, self, params);
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:unsubscribed:")))
            objj_msgSend(_delegate, "pubSubNode:unsubscribed:", self, YES);
    }
    else
    {
        if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:unsubscribed:")))
            objj_msgSend(_delegate, "pubSubNode:unsubscribed:", self, NO);
        CPLog.error("Cannot unsubscribe the pubsub node");
        CPLog.error(aStanza);
    }
    return NO;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("numberOfSubscriptions"), function $TNPubSubNode__numberOfSubscriptions(self, _cmd)
{ with(self)
{
    return objj_msgSend(_subscriptionIDs, "count");
}
},["int"]), new objj_method(sel_getUid("_setEventHandler"), function $TNPubSubNode___setEventHandler(self, _cmd)
{ with(self)
{
    var params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "message", "name",
                                                            objj_msgSend(_pubSubServer, "node"), "from");
    _eventSelectorID = objj_msgSend(_connection, "registerSelector:ofObject:withDict:", sel_getUid("_didReceiveEvent:"), self, params);
}
},["void"]), new objj_method(sel_getUid("_didReceiveEvent:"), function $TNPubSubNode___didReceiveEvent_(self, _cmd, aStanza)
{ with(self)
{
    var pubsubEvent = objj_msgSend(aStanza, "firstChildWithName:", "event");
    if (objj_msgSend(pubsubEvent, "namespace") != Strophe.NS.PUBSUB_EVENT)
        return YES;
    if (objj_msgSend(pubsubEvent, "containsChildrenWithName:", "subscription"))
    {
        var subscription = objj_msgSend(pubsubEvent, "firstChildWithName:", "subscription"),
            status = objj_msgSend(subscription, "valueForAttribute:", "subscription"),
            nodeName = objj_msgSend(subscription, "valueForAttribute:", "node");
        if (status === "subscribed" && nodeName === _nodeName)
            objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:", TNStrophePubSubNodeSubscribedNotification, self);
        return YES;
    }
    if (_nodeName != objj_msgSend(objj_msgSend(pubsubEvent, "firstChildWithName:", "items"), "valueForAttribute:", "node"))
        return YES;
    if (_delegate && objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("pubSubNode:receivedEvent:")))
        objj_msgSend(_delegate, "pubSubNode:receivedEvent:", self, aStanza);
    objj_msgSend(objj_msgSend(CPNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", TNStrophePubSubNodeEventNotification, self, aStanza);
    return YES;
}
},["BOOL","TNStropheStanza"]), new objj_method(sel_getUid("description"), function $TNPubSubNode__description(self, _cmd)
{ with(self)
{
    return _nodeName;
}
},["CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("registerSelector:ofObject:forPubSubEventWithConnection:"), function $TNPubSubNode__registerSelector_ofObject_forPubSubEventWithConnection_(self, _cmd, aSelector, anObject, aConnection)
{ with(self)
{
    var params = objj_msgSend(CPDictionary, "dictionaryWithObjectsAndKeys:", "message", "name",
                                                            "headline", "type",
                                                            {"matchBare": YES}, "options",
                                                            Strophe.NS.PUBSUB_EVENT, "namespace");
    return objj_msgSend(aConnection, "registerSelector:ofObject:withDict:", aSelector, anObject, params);
}
},["void","SEL","id","TNStropheConnection"]), new objj_method(sel_getUid("pubSubNodeWithNodeName:connection:pubSubServer:"), function $TNPubSubNode__pubSubNodeWithNodeName_connection_pubSubServer_(self, _cmd, aNodeName, aConnection, aPubSubServer)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNPubSubNode, "alloc"), "initWithNodeName:connection:pubSubServer:", aNodeName, aConnection, aPubSubServer);
}
},["TNPubSubNode","CPString","TNStropheConnection","CPString"]), new objj_method(sel_getUid("pubSubNodeWithNodeName:connection:pubSubServer:subscriptionIDs:"), function $TNPubSubNode__pubSubNodeWithNodeName_connection_pubSubServer_subscriptionIDs_(self, _cmd, aNodeName, aConnection, aPubSubServer, aSubscriptionIDs)
{ with(self)
{
    return objj_msgSend(objj_msgSend(TNPubSubNode, "alloc"), "initWithNodeName:connection:pubSubServer:subscriptionIDs:", aNodeName, aConnection, aPubSubServer, aSubscriptionIDs);
}
},["TNPubSubNode","CPString","TNStropheConnection","TNStropheJID","CPArray"])]);
}

e;