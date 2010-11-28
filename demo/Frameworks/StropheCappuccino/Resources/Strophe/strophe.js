var Base64=(function(){
var _1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
var _2={encode:function(_3){
var _4="";
var _5,_6,_7;
var _8,_9,_a,_b;
var i=0;
do{
_5=_3.charCodeAt(i++);
_6=_3.charCodeAt(i++);
_7=_3.charCodeAt(i++);
_8=_5>>2;
_9=((_5&3)<<4)|(_6>>4);
_a=((_6&15)<<2)|(_7>>6);
_b=_7&63;
if(isNaN(_6)){
_a=_b=64;
}else{
if(isNaN(_7)){
_b=64;
}
}
_4=_4+_1.charAt(_8)+_1.charAt(_9)+_1.charAt(_a)+_1.charAt(_b);
}while(i<_3.length);
return _4;
},decode:function(_c){
var _d="";
var _e,_f,_10;
var _11,_12,_13,_14;
var i=0;
_c=_c.replace(/[^A-Za-z0-9\+\/\=]/g,"");
do{
_11=_1.indexOf(_c.charAt(i++));
_12=_1.indexOf(_c.charAt(i++));
_13=_1.indexOf(_c.charAt(i++));
_14=_1.indexOf(_c.charAt(i++));
_e=(_11<<2)|(_12>>4);
_f=((_12&15)<<4)|(_13>>2);
_10=((_13&3)<<6)|_14;
_d=_d+String.fromCharCode(_e);
if(_13!=64){
_d=_d+String.fromCharCode(_f);
}
if(_14!=64){
_d=_d+String.fromCharCode(_10);
}
}while(i<_c.length);
return _d;
}};
return _2;
})();
var MD5=(function(){
var _15=0;
var _16="";
var _17=8;
var _18=function(x,y){
var lsw=(x&65535)+(y&65535);
var msw=(x>>16)+(y>>16)+(lsw>>16);
return (msw<<16)|(lsw&65535);
};
var _19=function(num,cnt){
return (num<<cnt)|(num>>>(32-cnt));
};
var _1a=function(str){
var bin=[];
var _1b=(1<<_17)-1;
for(var i=0;i<str.length*_17;i+=_17){
bin[i>>5]|=(str.charCodeAt(i/_17)&_1b)<<(i%32);
}
return bin;
};
var _1c=function(bin){
var str="";
var _1d=(1<<_17)-1;
for(var i=0;i<bin.length*32;i+=_17){
str+=String.fromCharCode((bin[i>>5]>>>(i%32))&_1d);
}
return str;
};
var _1e=function(_1f){
var _20=_15?"0123456789ABCDEF":"0123456789abcdef";
var str="";
for(var i=0;i<_1f.length*4;i++){
str+=_20.charAt((_1f[i>>2]>>((i%4)*8+4))&15)+_20.charAt((_1f[i>>2]>>((i%4)*8))&15);
}
return str;
};
var _21=function(_22){
var tab="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
var str="";
var _23,j;
for(var i=0;i<_22.length*4;i+=3){
_23=(((_22[i>>2]>>8*(i%4))&255)<<16)|(((_22[i+1>>2]>>8*((i+1)%4))&255)<<8)|((_22[i+2>>2]>>8*((i+2)%4))&255);
for(j=0;j<4;j++){
if(i*8+j*6>_22.length*32){
str+=_16;
}else{
str+=tab.charAt((_23>>6*(3-j))&63);
}
}
}
return str;
};
var _24=function(q,a,b,x,s,t){
return _18(_19(_18(_18(a,q),_18(x,t)),s),b);
};
var _25=function(a,b,c,d,x,s,t){
return _24((b&c)|((~b)&d),a,b,x,s,t);
};
var _26=function(a,b,c,d,x,s,t){
return _24((b&d)|(c&(~d)),a,b,x,s,t);
};
var _27=function(a,b,c,d,x,s,t){
return _24(b^c^d,a,b,x,s,t);
};
var _28=function(a,b,c,d,x,s,t){
return _24(c^(b|(~d)),a,b,x,s,t);
};
var _29=function(x,len){
x[len>>5]|=128<<((len)%32);
x[(((len+64)>>>9)<<4)+14]=len;
var a=1732584193;
var b=-271733879;
var c=-1732584194;
var d=271733878;
var _2a,_2b,_2c,_2d;
for(var i=0;i<x.length;i+=16){
_2a=a;
_2b=b;
_2c=c;
_2d=d;
a=_25(a,b,c,d,x[i+0],7,-680876936);
d=_25(d,a,b,c,x[i+1],12,-389564586);
c=_25(c,d,a,b,x[i+2],17,606105819);
b=_25(b,c,d,a,x[i+3],22,-1044525330);
a=_25(a,b,c,d,x[i+4],7,-176418897);
d=_25(d,a,b,c,x[i+5],12,1200080426);
c=_25(c,d,a,b,x[i+6],17,-1473231341);
b=_25(b,c,d,a,x[i+7],22,-45705983);
a=_25(a,b,c,d,x[i+8],7,1770035416);
d=_25(d,a,b,c,x[i+9],12,-1958414417);
c=_25(c,d,a,b,x[i+10],17,-42063);
b=_25(b,c,d,a,x[i+11],22,-1990404162);
a=_25(a,b,c,d,x[i+12],7,1804603682);
d=_25(d,a,b,c,x[i+13],12,-40341101);
c=_25(c,d,a,b,x[i+14],17,-1502002290);
b=_25(b,c,d,a,x[i+15],22,1236535329);
a=_26(a,b,c,d,x[i+1],5,-165796510);
d=_26(d,a,b,c,x[i+6],9,-1069501632);
c=_26(c,d,a,b,x[i+11],14,643717713);
b=_26(b,c,d,a,x[i+0],20,-373897302);
a=_26(a,b,c,d,x[i+5],5,-701558691);
d=_26(d,a,b,c,x[i+10],9,38016083);
c=_26(c,d,a,b,x[i+15],14,-660478335);
b=_26(b,c,d,a,x[i+4],20,-405537848);
a=_26(a,b,c,d,x[i+9],5,568446438);
d=_26(d,a,b,c,x[i+14],9,-1019803690);
c=_26(c,d,a,b,x[i+3],14,-187363961);
b=_26(b,c,d,a,x[i+8],20,1163531501);
a=_26(a,b,c,d,x[i+13],5,-1444681467);
d=_26(d,a,b,c,x[i+2],9,-51403784);
c=_26(c,d,a,b,x[i+7],14,1735328473);
b=_26(b,c,d,a,x[i+12],20,-1926607734);
a=_27(a,b,c,d,x[i+5],4,-378558);
d=_27(d,a,b,c,x[i+8],11,-2022574463);
c=_27(c,d,a,b,x[i+11],16,1839030562);
b=_27(b,c,d,a,x[i+14],23,-35309556);
a=_27(a,b,c,d,x[i+1],4,-1530992060);
d=_27(d,a,b,c,x[i+4],11,1272893353);
c=_27(c,d,a,b,x[i+7],16,-155497632);
b=_27(b,c,d,a,x[i+10],23,-1094730640);
a=_27(a,b,c,d,x[i+13],4,681279174);
d=_27(d,a,b,c,x[i+0],11,-358537222);
c=_27(c,d,a,b,x[i+3],16,-722521979);
b=_27(b,c,d,a,x[i+6],23,76029189);
a=_27(a,b,c,d,x[i+9],4,-640364487);
d=_27(d,a,b,c,x[i+12],11,-421815835);
c=_27(c,d,a,b,x[i+15],16,530742520);
b=_27(b,c,d,a,x[i+2],23,-995338651);
a=_28(a,b,c,d,x[i+0],6,-198630844);
d=_28(d,a,b,c,x[i+7],10,1126891415);
c=_28(c,d,a,b,x[i+14],15,-1416354905);
b=_28(b,c,d,a,x[i+5],21,-57434055);
a=_28(a,b,c,d,x[i+12],6,1700485571);
d=_28(d,a,b,c,x[i+3],10,-1894986606);
c=_28(c,d,a,b,x[i+10],15,-1051523);
b=_28(b,c,d,a,x[i+1],21,-2054922799);
a=_28(a,b,c,d,x[i+8],6,1873313359);
d=_28(d,a,b,c,x[i+15],10,-30611744);
c=_28(c,d,a,b,x[i+6],15,-1560198380);
b=_28(b,c,d,a,x[i+13],21,1309151649);
a=_28(a,b,c,d,x[i+4],6,-145523070);
d=_28(d,a,b,c,x[i+11],10,-1120210379);
c=_28(c,d,a,b,x[i+2],15,718787259);
b=_28(b,c,d,a,x[i+9],21,-343485551);
a=_18(a,_2a);
b=_18(b,_2b);
c=_18(c,_2c);
d=_18(d,_2d);
}
return [a,b,c,d];
};
var _2e=function(key,_2f){
var _30=_1a(key);
if(_30.length>16){
_30=_29(_30,key.length*_17);
}
var _31=new Array(16),_32=new Array(16);
for(var i=0;i<16;i++){
_31[i]=_30[i]^909522486;
_32[i]=_30[i]^1549556828;
}
var _33=_29(_31.concat(_1a(_2f)),512+_2f.length*_17);
return _29(_32.concat(_33),512+128);
};
var obj={hexdigest:function(s){
return _1e(_29(_1a(s),s.length*_17));
},b64digest:function(s){
return _21(_29(_1a(s),s.length*_17));
},hash:function(s){
return _1c(_29(_1a(s),s.length*_17));
},hmac_hexdigest:function(key,_34){
return _1e(_2e(key,_34));
},hmac_b64digest:function(key,_35){
return _21(_2e(key,_35));
},hmac_hash:function(key,_36){
return _1c(_2e(key,_36));
},test:function(){
return MD5.hexdigest("abc")==="900150983cd24fb0d6963f7d28e17f72";
}};
return obj;
})();
if(!Function.prototype.bind){
Function.prototype.bind=function(obj){
var _37=this;
return function(){
return _37.apply(obj,arguments);
};
};
}
if(!Function.prototype.prependArg){
Function.prototype.prependArg=function(arg){
var _38=this;
return function(){
var _39=[arg];
for(var i=0;i<arguments.length;i++){
_39.push(arguments[i]);
}
return _38.apply(this,_39);
};
};
}
if(!Array.prototype.indexOf){
Array.prototype.indexOf=function(elt){
var len=this.length;
var _3a=Number(arguments[1])||0;
_3a=(_3a<0)?Math.ceil(_3a):Math.floor(_3a);
if(_3a<0){
_3a+=len;
}
for(;_3a<len;_3a++){
if(_3a in this&&this[_3a]===elt){
return _3a;
}
}
return -1;
};
}
(function(_3b){
var _3c;
function _3d(_3e,_3f){
return new _3c.Builder(_3e,_3f);
};
function _40(_41){
return new _3c.Builder("message",_41);
};
function $iq(_42){
return new _3c.Builder("iq",_42);
};
function _43(_44){
return new _3c.Builder("presence",_44);
};
_3c={VERSION:"7534354",NS:{HTTPBIND:"http://jabber.org/protocol/httpbind",BOSH:"urn:xmpp:xbosh",CLIENT:"jabber:client",AUTH:"jabber:iq:auth",ROSTER:"jabber:iq:roster",PROFILE:"jabber:iq:profile",DISCO_INFO:"http://jabber.org/protocol/disco#info",DISCO_ITEMS:"http://jabber.org/protocol/disco#items",MUC:"http://jabber.org/protocol/muc",SASL:"urn:ietf:params:xml:ns:xmpp-sasl",STREAM:"http://etherx.jabber.org/streams",BIND:"urn:ietf:params:xml:ns:xmpp-bind",SESSION:"urn:ietf:params:xml:ns:xmpp-session",VERSION:"jabber:iq:version",STANZAS:"urn:ietf:params:xml:ns:xmpp-stanzas"},addNamespace:function(_45,_46){
_3c.NS[_45]=_46;
},Status:{ERROR:0,CONNECTING:1,CONNFAIL:2,AUTHENTICATING:3,AUTHFAIL:4,CONNECTED:5,DISCONNECTED:6,DISCONNECTING:7,ATTACHED:8},LogLevel:{DEBUG:0,INFO:1,WARN:2,ERROR:3,FATAL:4},ElementType:{NORMAL:1,TEXT:3},TIMEOUT:1.1,SECONDARY_TIMEOUT:0.1,forEachChild:function(_47,_48,_49){
var i,_4a;
for(i=0;i<_47.childNodes.length;i++){
_4a=_47.childNodes[i];
if(_4a.nodeType==_3c.ElementType.NORMAL&&(!_48||this.isTagEqual(_4a,_48))){
_49(_4a);
}
}
},isTagEqual:function(el,_4b){
return el.tagName.toLowerCase()==_4b.toLowerCase();
},_xmlGenerator:null,_makeGenerator:function(){
var doc;
if(window.ActiveXObject){
doc=new ActiveXObject("Microsoft.XMLDOM");
doc.appendChild(doc.createElement("strophe"));
}else{
doc=document.implementation.createDocument("jabber:client","strophe",null);
}
return doc;
},xmlGenerator:function(){
if(!_3c._xmlGenerator){
_3c._xmlGenerator=_3c._makeGenerator();
}
return _3c._xmlGenerator;
},xmlElement:function(_4c){
if(!_4c){
return null;
}
var _4d=_3c.xmlGenerator().createElement(_4c);
var a,i,k;
for(a=1;a<arguments.length;a++){
if(!arguments[a]){
continue;
}
if(typeof (arguments[a])=="string"||typeof (arguments[a])=="number"){
_4d.appendChild(_3c.xmlTextNode(arguments[a]));
}else{
if(typeof (arguments[a])=="object"&&typeof (arguments[a].sort)=="function"){
for(i=0;i<arguments[a].length;i++){
if(typeof (arguments[a][i])=="object"&&typeof (arguments[a][i].sort)=="function"){
_4d.setAttribute(arguments[a][i][0],arguments[a][i][1]);
}
}
}else{
if(typeof (arguments[a])=="object"){
for(k in arguments[a]){
if(arguments[a].hasOwnProperty(k)){
_4d.setAttribute(k,arguments[a][k]);
}
}
}
}
}
}
return _4d;
},xmlescape:function(_4e){
_4e=_4e.replace(/\&/g,"&amp;");
_4e=_4e.replace(/</g,"&lt;");
_4e=_4e.replace(/>/g,"&gt;");
return _4e;
},xmlTextNode:function(_4f){
_4f=_3c.xmlescape(_4f);
return _3c.xmlGenerator().createTextNode(_4f);
},getText:function(_50){
if(!_50){
return null;
}
var str="";
if(_50.childNodes.length===0&&_50.nodeType==_3c.ElementType.TEXT){
str+=_50.nodeValue;
}
for(var i=0;i<_50.childNodes.length;i++){
if(_50.childNodes[i].nodeType==_3c.ElementType.TEXT){
str+=_50.childNodes[i].nodeValue;
}
}
return str;
},copyElement:function(_51){
var i,el;
if(_51.nodeType==_3c.ElementType.NORMAL){
el=_3c.xmlElement(_51.tagName);
for(i=0;i<_51.attributes.length;i++){
el.setAttribute(_51.attributes[i].nodeName.toLowerCase(),_51.attributes[i].value);
}
for(i=0;i<_51.childNodes.length;i++){
el.appendChild(_3c.copyElement(_51.childNodes[i]));
}
}else{
if(_51.nodeType==_3c.ElementType.TEXT){
el=_3c.xmlTextNode(_51.nodeValue);
}
}
return el;
},escapeNode:function(_52){
return _52.replace(/^\s+|\s+$/g,"").replace(/\\/g,"\\5c").replace(/ /g,"\\20").replace(/\"/g,"\\22").replace(/\&/g,"\\26").replace(/\'/g,"\\27").replace(/\//g,"\\2f").replace(/:/g,"\\3a").replace(/</g,"\\3c").replace(/>/g,"\\3e").replace(/@/g,"\\40");
},unescapeNode:function(_53){
return _53.replace(/\\20/g," ").replace(/\\22/g,"\"").replace(/\\26/g,"&").replace(/\\27/g,"'").replace(/\\2f/g,"/").replace(/\\3a/g,":").replace(/\\3c/g,"<").replace(/\\3e/g,">").replace(/\\40/g,"@").replace(/\\5c/g,"\\");
},getNodeFromJid:function(jid){
if(jid.indexOf("@")<0){
return null;
}
return jid.split("@")[0];
},getDomainFromJid:function(jid){
var _54=_3c.getBareJidFromJid(jid);
if(_54.indexOf("@")<0){
return _54;
}else{
var _55=_54.split("@");
_55.splice(0,1);
return _55.join("@");
}
},getResourceFromJid:function(jid){
var s=jid.split("/");
if(s.length<2){
return null;
}
s.splice(0,1);
return s.join("/");
},getBareJidFromJid:function(jid){
return jid?jid.split("/")[0]:null;
},log:function(_56,msg){
return;
},debug:function(msg){
this.log(this.LogLevel.DEBUG,msg);
},info:function(msg){
this.log(this.LogLevel.INFO,msg);
},warn:function(msg){
this.log(this.LogLevel.WARN,msg);
},error:function(msg){
this.log(this.LogLevel.ERROR,msg);
},fatal:function(msg){
this.log(this.LogLevel.FATAL,msg);
},serialize:function(_57){
var _58;
if(!_57){
return null;
}
if(typeof (_57.tree)==="function"){
_57=_57.tree();
}
var _59=_57.nodeName;
var i,_5a;
if(_57.getAttribute("_realname")){
_59=_57.getAttribute("_realname");
}
_58="<"+_59;
for(i=0;i<_57.attributes.length;i++){
if(_57.attributes[i].nodeName!="_realname"){
_58+=" "+_57.attributes[i].nodeName.toLowerCase()+"='"+_57.attributes[i].value.replace(/&/g,"&amp;").replace(/\'/g,"&apos;").replace(/</g,"&lt;")+"'";
}
}
if(_57.childNodes.length>0){
_58+=">";
for(i=0;i<_57.childNodes.length;i++){
_5a=_57.childNodes[i];
if(_5a.nodeType==_3c.ElementType.NORMAL){
_58+=_3c.serialize(_5a);
}else{
if(_5a.nodeType==_3c.ElementType.TEXT){
_58+=_5a.nodeValue;
}
}
}
_58+="</"+_59+">";
}else{
_58+="/>";
}
return _58;
},_requestId:0,_connectionPlugins:{},addConnectionPlugin:function(_5b,_5c){
_3c._connectionPlugins[_5b]=_5c;
}};
_3c.Builder=function(_5d,_5e){
if(_5d=="presence"||_5d=="message"||_5d=="iq"){
if(_5e&&!_5e.xmlns){
_5e.xmlns=_3c.NS.CLIENT;
}else{
if(!_5e){
_5e={xmlns:_3c.NS.CLIENT};
}
}
}
this.nodeTree=_3c.xmlElement(_5d,_5e);
this.node=this.nodeTree;
};
_3c.Builder.prototype={tree:function(){
return this.nodeTree;
},toString:function(){
return _3c.serialize(this.nodeTree);
},up:function(){
this.node=this.node.parentNode;
return this;
},attrs:function(_5f){
for(var k in _5f){
if(_5f.hasOwnProperty(k)){
this.node.setAttribute(k,_5f[k]);
}
}
return this;
},c:function(_60,_61){
var _62=_3c.xmlElement(_60,_61);
this.node.appendChild(_62);
this.node=_62;
return this;
},cnode:function(_63){
var _64=_3c.xmlGenerator().importNode(_63,true);
this.node.appendChild(_64);
this.node=_64;
return this;
},t:function(_65){
var _66=_3c.xmlTextNode(_65);
this.node.appendChild(_66);
return this;
}};
_3c.Handler=function(_67,ns,_68,_69,id,_6a,_6b){
this.handler=_67;
this.ns=ns;
this.name=_68;
this.type=_69;
this.id=id;
this.options=_6b||{matchbare:false};
if(!this.options.matchBare){
this.options.matchBare=false;
}
if(this.options.matchBare){
this.from=_6a?_3c.getBareJidFromJid(_6a):null;
}else{
this.from=_6a;
}
this.user=true;
};
_3c.Handler.prototype={isMatch:function(_6c){
var _6d;
var _6e=null;
if(this.options.matchBare){
_6e=_3c.getBareJidFromJid(_6c.getAttribute("from"));
}else{
_6e=_6c.getAttribute("from");
}
_6d=false;
if(!this.ns){
_6d=true;
}else{
var _6f=this;
_3c.forEachChild(_6c,null,function(_70){
if(_70.getAttribute("xmlns")==_6f.ns){
_6d=true;
}
});
_6d=_6d||_6c.getAttribute("xmlns")==this.ns;
}
if(_6d&&(!this.name||_3c.isTagEqual(_6c,this.name))&&(!this.type||_6c.getAttribute("type")==this.type)&&(!this.id||_6c.getAttribute("id")==this.id)&&(!this.from||_6e==this.from)){
return true;
}
return false;
},run:function(_71){
var _72=null;
try{
_72=this.handler(_71);
}
catch(e){
if(e.sourceURL){
_3c.fatal("error: "+this.handler+" "+e.sourceURL+":"+e.line+" - "+e.name+": "+e.message);
}else{
if(e.fileName){
if(typeof (console)!="undefined"){
console.trace();
console.error(this.handler," - error - ",e,e.message);
}
_3c.fatal("error: "+this.handler+" "+e.fileName+":"+e.lineNumber+" - "+e.name+": "+e.message);
}else{
_3c.fatal("error: "+this.handler);
}
}
throw e;
}
return _72;
},toString:function(){
return "{Handler: "+this.handler+"("+this.name+","+this.id+","+this.ns+")}";
}};
_3c.TimedHandler=function(_73,_74){
this.period=_73;
this.handler=_74;
this.lastCalled=new Date().getTime();
this.user=true;
};
_3c.TimedHandler.prototype={run:function(){
this.lastCalled=new Date().getTime();
return this.handler();
},reset:function(){
this.lastCalled=new Date().getTime();
},toString:function(){
return "{TimedHandler: "+this.handler+"("+this.period+")}";
}};
_3c.Request=function(_75,_76,rid,_77){
this.id=++_3c._requestId;
this.xmlData=_75;
this.data=_3c.serialize(_75);
this.origFunc=_76;
this.func=_76;
this.rid=rid;
this.date=NaN;
this.sends=_77||0;
this.abort=false;
this.dead=null;
this.age=function(){
if(!this.date){
return 0;
}
var now=new Date();
return (now-this.date)/1000;
};
this.timeDead=function(){
if(!this.dead){
return 0;
}
var now=new Date();
return (now-this.dead)/1000;
};
this.xhr=this._newXHR();
};
_3c.Request.prototype={getResponse:function(){
var _78=null;
if(this.xhr.responseXML&&this.xhr.responseXML.documentElement){
_78=this.xhr.responseXML.documentElement;
if(_78.tagName=="parsererror"){
_3c.error("invalid response received");
_3c.error("responseText: "+this.xhr.responseText);
_3c.error("responseXML: "+_3c.serialize(this.xhr.responseXML));
throw "parsererror";
}
}else{
if(this.xhr.responseText){
_3c.error("invalid response received");
_3c.error("responseText: "+this.xhr.responseText);
_3c.error("responseXML: "+_3c.serialize(this.xhr.responseXML));
}
}
return _78;
},_newXHR:function(){
var xhr=null;
if(window.XMLHttpRequest){
xhr=new XMLHttpRequest();
if(xhr.overrideMimeType){
xhr.overrideMimeType("text/xml");
}
}else{
if(window.ActiveXObject){
xhr=new ActiveXObject("Microsoft.XMLHTTP");
}
}
xhr.onreadystatechange=this.func.prependArg(this);
return xhr;
}};
_3c.Connection=function(_79){
this.service=_79;
this.jid="";
this.rid=Math.floor(Math.random()*4294967295);
this.sid=null;
this.streamId=null;
this.features=null;
this.do_session=false;
this.do_bind=false;
this.timedHandlers=[];
this.handlers=[];
this.removeTimeds=[];
this.removeHandlers=[];
this.addTimeds=[];
this.addHandlers=[];
this._idleTimeout=null;
this._disconnectTimeout=null;
this.authenticated=false;
this.disconnecting=false;
this.connected=false;
this.errors=0;
this.paused=false;
this.hold=1;
this.wait=60;
this.window=5;
this._data=[];
this._requests=[];
this._uniqueId=Math.round(Math.random()*10000);
this._sasl_success_handler=null;
this._sasl_failure_handler=null;
this._sasl_challenge_handler=null;
this._idleTimeout=setTimeout(this._onIdle.bind(this),100);
for(var k in _3c._connectionPlugins){
if(_3c._connectionPlugins.hasOwnProperty(k)){
var _7a=_3c._connectionPlugins[k];
var F=function(){
};
F.prototype=_7a;
this[k]=new F();
this[k].init(this);
}
}
};
_3c.Connection.prototype={reset:function(){
this.rid=Math.floor(Math.random()*4294967295);
this.sid=null;
this.streamId=null;
this.do_session=false;
this.do_bind=false;
this.timedHandlers=[];
this.handlers=[];
this.removeTimeds=[];
this.removeHandlers=[];
this.addTimeds=[];
this.addHandlers=[];
this.authenticated=false;
this.disconnecting=false;
this.connected=false;
this.errors=0;
this._requests=[];
this._uniqueId=Math.round(Math.random()*10000);
},pause:function(){
this.paused=true;
},resume:function(){
this.paused=false;
},getUniqueId:function(_7b){
if(typeof (_7b)=="string"||typeof (_7b)=="number"){
return ++this._uniqueId+":"+_7b;
}else{
return ++this._uniqueId+"";
}
},connect:function(jid,_7c,_7d,_7e,_7f){
this.jid=jid;
this.pass=_7c;
this.connect_callback=_7d;
this.disconnecting=false;
this.connected=false;
this.authenticated=false;
this.errors=0;
this.wait=_7e||this.wait;
this.hold=_7f||this.hold;
this.domain=_3c.getDomainFromJid(this.jid);
var _80=this._buildBody().attrs({to:this.domain,"xml:lang":"en",wait:this.wait,hold:this.hold,content:"text/xml; charset=utf-8",ver:"1.6","xmpp:version":"1.0","xmlns:xmpp":_3c.NS.BOSH});
this._changeConnectStatus(_3c.Status.CONNECTING,null);
this._requests.push(new _3c.Request(_80.tree(),this._onRequestStateChange.bind(this).prependArg(this._connect_cb.bind(this)),_80.tree().getAttribute("rid")));
this._throttledRequestHandler();
},attach:function(jid,sid,rid,_81,_82,_83,_84){
this.jid=jid;
this.sid=sid;
this.rid=rid;
this.connect_callback=_81;
this.domain=_3c.getDomainFromJid(this.jid);
this.authenticated=true;
this.connected=true;
this.wait=_82||this.wait;
this.hold=_83||this.hold;
this.window=_84||this.window;
this._changeConnectStatus(_3c.Status.ATTACHED,null);
},xmlInput:function(_85){
return;
},xmlOutput:function(_86){
return;
},rawInput:function(_87){
return;
},rawOutput:function(_88){
return;
},send:function(_89){
if(_89===null){
return;
}
if(typeof (_89.sort)==="function"){
for(var i=0;i<_89.length;i++){
this._queueData(_89[i]);
}
}else{
if(typeof (_89.tree)==="function"){
this._queueData(_89.tree());
}else{
this._queueData(_89);
}
}
this._throttledRequestHandler();
clearTimeout(this._idleTimeout);
this._idleTimeout=setTimeout(this._onIdle.bind(this),100);
},flush:function(){
clearTimeout(this._idleTimeout);
this._onIdle();
},sendIQ:function(_8a,_8b,_8c,_8d){
var _8e=null;
var _8f=this;
if(typeof (_8a.tree)==="function"){
_8a=_8a.tree();
}
var id=_8a.getAttribute("id");
if(!id){
id=this.getUniqueId("sendIQ");
_8a.setAttribute("id",id);
}
var _90=this.addHandler(function(_91){
if(_8e){
_8f.deleteTimedHandler(_8e);
}
var _92=_91.getAttribute("type");
if(_92=="result"){
if(_8b){
_8b(_91);
}
}else{
if(_92=="error"){
if(_8c){
_8c(_91);
}
}else{
throw {name:"StropheError",message:"Got bad IQ type of "+_92};
}
}
},null,"iq",null,id);
if(_8d){
_8e=this.addTimedHandler(_8d,function(){
_8f.deleteHandler(_90);
if(_8c){
_8c(null);
}
return false;
});
}
this.send(_8a);
return id;
},_queueData:function(_93){
if(_93===null||!_93.tagName||!_93.childNodes){
throw {name:"StropheError",message:"Cannot queue non-DOMElement."};
}
this._data.push(_93);
},_sendRestart:function(){
this._data.push("restart");
this._throttledRequestHandler();
clearTimeout(this._idleTimeout);
this._idleTimeout=setTimeout(this._onIdle.bind(this),100);
},addTimedHandler:function(_94,_95){
var _96=new _3c.TimedHandler(_94,_95);
this.addTimeds.push(_96);
return _96;
},deleteTimedHandler:function(_97){
this.removeTimeds.push(_97);
},addHandler:function(_98,ns,_99,_9a,id,_9b,_9c){
var _9d=new _3c.Handler(_98,ns,_99,_9a,id,_9b,_9c);
this.addHandlers.push(_9d);
return _9d;
},deleteHandler:function(_9e){
this.removeHandlers.push(_9e);
},disconnect:function(_9f){
this._changeConnectStatus(_3c.Status.DISCONNECTING,_9f);
_3c.info("Disconnect was called because: "+_9f);
if(this.connected){
this._disconnectTimeout=this._addSysTimedHandler(3000,this._onDisconnectTimeout.bind(this));
this._sendTerminate();
}
},_changeConnectStatus:function(_a0,_a1){
for(var k in _3c._connectionPlugins){
if(_3c._connectionPlugins.hasOwnProperty(k)){
var _a2=this[k];
if(_a2.statusChanged){
try{
_a2.statusChanged(_a0,_a1);
}
catch(err){
_3c.error(""+k+" plugin caused an exception "+"changing status: "+err);
}
}
}
}
if(this.connect_callback){
try{
this.connect_callback(_a0,_a1);
}
catch(e){
_3c.error("User connection callback caused an "+"exception: "+e);
}
}
},_buildBody:function(){
var _a3=_3d("body",{rid:this.rid++,xmlns:_3c.NS.HTTPBIND});
if(this.sid!==null){
_a3.attrs({sid:this.sid});
}
return _a3;
},_removeRequest:function(req){
_3c.debug("removing request");
var i;
for(i=this._requests.length-1;i>=0;i--){
if(req==this._requests[i]){
this._requests.splice(i,1);
}
}
req.xhr.onreadystatechange=function(){
};
this._throttledRequestHandler();
},_restartRequest:function(i){
var req=this._requests[i];
if(req.dead===null){
req.dead=new Date();
}
this._processRequest(i);
},_processRequest:function(i){
var req=this._requests[i];
var _a4=-1;
try{
if(req.xhr.readyState==4){
_a4=req.xhr.status;
}
}
catch(e){
_3c.error("caught an error in _requests["+i+"], reqStatus: "+_a4);
}
if(typeof (_a4)=="undefined"){
_a4=-1;
}
var _a5=req.age();
var _a6=(!isNaN(_a5)&&_a5>Math.floor(_3c.TIMEOUT*this.wait));
var _a7=(req.dead!==null&&req.timeDead()>Math.floor(_3c.SECONDARY_TIMEOUT*this.wait));
var _a8=(req.xhr.readyState==4&&(_a4<1||_a4>=500));
if(_a6||_a7||_a8){
if(_a7){
_3c.error("Request "+this._requests[i].id+" timed out (secondary), restarting");
}
req.abort=true;
req.xhr.abort();
req.xhr.onreadystatechange=function(){
};
this._requests[i]=new _3c.Request(req.xmlData,req.origFunc,req.rid,req.sends);
req=this._requests[i];
}
if(req.xhr.readyState===0){
_3c.debug("request id "+req.id+"."+req.sends+" posting");
req.date=new Date();
try{
req.xhr.open("POST",this.service,true);
}
catch(e2){
_3c.error("XHR open failed.");
if(!this.connected){
this._changeConnectStatus(_3c.Status.CONNFAIL,"bad-service");
}
this.disconnect();
return;
}
var _a9=function(){
req.xhr.send(req.data);
};
if(req.sends>1){
var _aa=Math.pow(req.sends,3)*1000;
setTimeout(_a9,_aa);
}else{
_a9();
}
req.sends++;
this.xmlOutput(req.xmlData);
this.rawOutput(req.data);
}else{
_3c.debug("_processRequest: "+(i===0?"first":"second")+" request has readyState of "+req.xhr.readyState);
}
},_throttledRequestHandler:function(){
if(!this._requests){
_3c.debug("_throttledRequestHandler called with "+"undefined requests");
}else{
_3c.debug("_throttledRequestHandler called with "+this._requests.length+" requests");
}
if(!this._requests||this._requests.length===0){
return;
}
if(this._requests.length>0){
this._processRequest(0);
}
if(this._requests.length>1&&Math.abs(this._requests[0].rid-this._requests[1].rid)<this.window-1){
this._processRequest(1);
}
},_onRequestStateChange:function(_ab,req){
_3c.debug("request id "+req.id+"."+req.sends+" state changed to "+req.xhr.readyState);
if(req.abort){
req.abort=false;
return;
}
var _ac;
if(req.xhr.readyState==4){
_ac=0;
try{
_ac=req.xhr.status;
}
catch(e){
}
if(typeof (_ac)=="undefined"){
_ac=0;
}
if(this.disconnecting){
if(_ac>=400){
this._hitError(_ac);
return;
}
}
var _ad=(this._requests[0]==req);
var _ae=(this._requests[1]==req);
if((_ac>0&&_ac<500)||req.sends>5){
this._removeRequest(req);
_3c.debug("request id "+req.id+" should now be removed");
}
if(_ac==200){
if(_ae||(_ad&&this._requests.length>0&&this._requests[0].age()>Math.floor(_3c.SECONDARY_TIMEOUT*this.wait))){
this._restartRequest(0);
}
_3c.debug("request id "+req.id+"."+req.sends+" got 200");
_ab(req);
this.errors=0;
}else{
_3c.error("request id "+req.id+"."+req.sends+" error "+_ac+" happened");
if(_ac===0||(_ac>=400&&_ac<600)||_ac>=12000){
this._hitError(_ac);
if(_ac>=400&&_ac<500){
this._changeConnectStatus(_3c.Status.DISCONNECTING,null);
this._doDisconnect();
}
}
}
if(!((_ac>0&&_ac<10000)||req.sends>5)){
this._throttledRequestHandler();
}
}
},_hitError:function(_af){
this.errors++;
_3c.warn("request errored, status: "+_af+", number of errors: "+this.errors);
if(this.errors>4){
this._onDisconnectTimeout();
}
},_doDisconnect:function(){
_3c.info("_doDisconnect was called");
this.authenticated=false;
this.disconnecting=false;
this.sid=null;
this.streamId=null;
this.rid=Math.floor(Math.random()*4294967295);
if(this.connected){
this._changeConnectStatus(_3c.Status.DISCONNECTED,null);
this.connected=false;
}
this.handlers=[];
this.timedHandlers=[];
this.removeTimeds=[];
this.removeHandlers=[];
this.addTimeds=[];
this.addHandlers=[];
},_dataRecv:function(req){
try{
var _b0=req.getResponse();
}
catch(e){
if(e!="parsererror"){
throw e;
}
this.disconnect("strophe-parsererror");
}
if(_b0===null){
return;
}
this.xmlInput(_b0);
this.rawInput(_3c.serialize(_b0));
var i,_b1;
while(this.removeHandlers.length>0){
_b1=this.removeHandlers.pop();
i=this.handlers.indexOf(_b1);
if(i>=0){
this.handlers.splice(i,1);
}
}
while(this.addHandlers.length>0){
this.handlers.push(this.addHandlers.pop());
}
if(this.disconnecting&&this._requests.length===0){
this.deleteTimedHandler(this._disconnectTimeout);
this._disconnectTimeout=null;
this._doDisconnect();
return;
}
var typ=_b0.getAttribute("type");
var _b2,_b3;
if(typ!==null&&typ=="terminate"){
if(this.disconnecting){
return;
}
_b2=_b0.getAttribute("condition");
_b3=_b0.getElementsByTagName("conflict");
if(_b2!==null){
if(_b2=="remote-stream-error"&&_b3.length>0){
_b2="conflict";
}
this._changeConnectStatus(_3c.Status.CONNFAIL,_b2);
}else{
this._changeConnectStatus(_3c.Status.CONNFAIL,"unknown");
}
this.disconnect();
return;
}
var _b4=this;
_3c.forEachChild(_b0,null,function(_b5){
var i,_b6;
_b6=_b4.handlers;
_b4.handlers=[];
for(i=0;i<_b6.length;i++){
var _b7=_b6[i];
if(_b7.isMatch(_b5)&&(_b4.authenticated||!_b7.user)){
if(_b7.run(_b5)){
_b4.handlers.push(_b7);
}
}else{
_b4.handlers.push(_b7);
}
}
});
},_sendTerminate:function(){
_3c.info("_sendTerminate was called");
var _b8=this._buildBody().attrs({type:"terminate"});
if(this.authenticated){
_b8.c("presence",{xmlns:_3c.NS.CLIENT,type:"unavailable"});
}
this.disconnecting=true;
var req=new _3c.Request(_b8.tree(),this._onRequestStateChange.bind(this).prependArg(this._dataRecv.bind(this)),_b8.tree().getAttribute("rid"));
this._requests.push(req);
this._throttledRequestHandler();
},_connect_cb:function(req){
_3c.info("_connect_cb was called");
this.connected=true;
var _b9=req.getResponse();
if(!_b9){
return;
}
this.xmlInput(_b9);
this.rawInput(_3c.serialize(_b9));
var typ=_b9.getAttribute("type");
var _ba,_bb;
if(typ!==null&&typ=="terminate"){
_ba=_b9.getAttribute("condition");
_bb=_b9.getElementsByTagName("conflict");
if(_ba!==null){
if(_ba=="remote-stream-error"&&_bb.length>0){
_ba="conflict";
}
this._changeConnectStatus(_3c.Status.CONNFAIL,_ba);
}else{
this._changeConnectStatus(_3c.Status.CONNFAIL,"unknown");
}
return;
}
if(!this.sid){
this.sid=_b9.getAttribute("sid");
}
if(!this.stream_id){
this.stream_id=_b9.getAttribute("authid");
}
var _bc=_b9.getAttribute("requests");
if(_bc){
this.window=parseInt(_bc,10);
}
var _bd=_b9.getAttribute("hold");
if(_bd){
this.hold=parseInt(_bd,10);
}
var _be=_b9.getAttribute("wait");
if(_be){
this.wait=parseInt(_be,10);
}
var _bf=false;
var _c0=false;
var _c1=false;
var _c2=_b9.getElementsByTagName("mechanism");
var i,_c3,_c4,_c5;
if(_c2.length>0){
for(i=0;i<_c2.length;i++){
_c3=_3c.getText(_c2[i]);
if(_c3=="DIGEST-MD5"){
_c0=true;
}else{
if(_c3=="PLAIN"){
_bf=true;
}else{
if(_c3=="ANONYMOUS"){
_c1=true;
}
}
}
}
}else{
var _c6=this._buildBody();
this._requests.push(new _3c.Request(_c6.tree(),this._onRequestStateChange.bind(this).prependArg(this._connect_cb.bind(this)),_c6.tree().getAttribute("rid")));
this._throttledRequestHandler();
return;
}
if(_3c.getNodeFromJid(this.jid)===null&&_c1){
this._changeConnectStatus(_3c.Status.AUTHENTICATING,null);
this._sasl_success_handler=this._addSysHandler(this._sasl_success_cb.bind(this),null,"success",null,null);
this._sasl_failure_handler=this._addSysHandler(this._sasl_failure_cb.bind(this),null,"failure",null,null);
this.send(_3d("auth",{xmlns:_3c.NS.SASL,mechanism:"ANONYMOUS"}).tree());
}else{
if(_3c.getNodeFromJid(this.jid)===null){
this._changeConnectStatus(_3c.Status.CONNFAIL,"x-strophe-bad-non-anon-jid");
this.disconnect();
}else{
if(_c0){
this._changeConnectStatus(_3c.Status.AUTHENTICATING,null);
this._sasl_challenge_handler=this._addSysHandler(this._sasl_challenge1_cb.bind(this),null,"challenge",null,null);
this._sasl_failure_handler=this._addSysHandler(this._sasl_failure_cb.bind(this),null,"failure",null,null);
this.send(_3d("auth",{xmlns:_3c.NS.SASL,mechanism:"DIGEST-MD5"}).tree());
}else{
if(_bf){
_c4=_3c.getBareJidFromJid(this.jid);
_c4=_c4+"\x00";
_c4=_c4+_3c.getNodeFromJid(this.jid);
_c4=_c4+"\x00";
_c4=_c4+this.pass;
this._changeConnectStatus(_3c.Status.AUTHENTICATING,null);
this._sasl_success_handler=this._addSysHandler(this._sasl_success_cb.bind(this),null,"success",null,null);
this._sasl_failure_handler=this._addSysHandler(this._sasl_failure_cb.bind(this),null,"failure",null,null);
_c5=Base64.encode(_c4);
this.send(_3d("auth",{xmlns:_3c.NS.SASL,mechanism:"PLAIN"}).t(_c5).tree());
}else{
this._changeConnectStatus(_3c.Status.AUTHENTICATING,null);
this._addSysHandler(this._auth1_cb.bind(this),null,null,null,"_auth_1");
this.send($iq({type:"get",to:this.domain,id:"_auth_1"}).c("query",{xmlns:_3c.NS.AUTH}).c("username",{}).t(_3c.getNodeFromJid(this.jid)).tree());
}
}
}
}
},_sasl_challenge1_cb:function(_c7){
var _c8=/([a-z]+)=("[^"]+"|[^,"]+)(?:,|$)/;
var _c9=Base64.decode(_3c.getText(_c7));
var _ca=MD5.hexdigest(Math.random()*1234567890);
var _cb="";
var _cc=null;
var _cd="";
var qop="";
var _ce;
this.deleteHandler(this._sasl_failure_handler);
while(_c9.match(_c8)){
_ce=_c9.match(_c8);
_c9=_c9.replace(_ce[0],"");
_ce[2]=_ce[2].replace(/^"(.+)"$/,"$1");
switch(_ce[1]){
case "realm":
_cb=_ce[2];
break;
case "nonce":
_cd=_ce[2];
break;
case "qop":
qop=_ce[2];
break;
case "host":
_cc=_ce[2];
break;
}
}
var _cf="xmpp/"+this.domain;
if(_cc!==null){
_cf=_cf+"/"+_cc;
}
var A1=MD5.hash(_3c.getNodeFromJid(this.jid)+":"+_cb+":"+this.pass)+":"+_cd+":"+_ca;
var A2="AUTHENTICATE:"+_cf;
var _d0="";
_d0+="username="+this._quote(_3c.getNodeFromJid(this.jid))+",";
_d0+="realm="+this._quote(_cb)+",";
_d0+="nonce="+this._quote(_cd)+",";
_d0+="cnonce="+this._quote(_ca)+",";
_d0+="nc=\"00000001\",";
_d0+="qop=\"auth\",";
_d0+="digest-uri="+this._quote(_cf)+",";
_d0+="response="+this._quote(MD5.hexdigest(MD5.hexdigest(A1)+":"+_cd+":00000001:"+_ca+":auth:"+MD5.hexdigest(A2)))+",";
_d0+="charset=\"utf-8\"";
this._sasl_challenge_handler=this._addSysHandler(this._sasl_challenge2_cb.bind(this),null,"challenge",null,null);
this._sasl_success_handler=this._addSysHandler(this._sasl_success_cb.bind(this),null,"success",null,null);
this._sasl_failure_handler=this._addSysHandler(this._sasl_failure_cb.bind(this),null,"failure",null,null);
this.send(_3d("response",{xmlns:_3c.NS.SASL}).t(Base64.encode(_d0)).tree());
return false;
},_quote:function(str){
return "\""+str.replace(/\\/g,"\\\\").replace(/"/g,"\\\"")+"\"";
},_sasl_challenge2_cb:function(_d1){
this.deleteHandler(this._sasl_success_handler);
this.deleteHandler(this._sasl_failure_handler);
this._sasl_success_handler=this._addSysHandler(this._sasl_success_cb.bind(this),null,"success",null,null);
this._sasl_failure_handler=this._addSysHandler(this._sasl_failure_cb.bind(this),null,"failure",null,null);
this.send(_3d("response",{xmlns:_3c.NS.SASL}).tree());
return false;
},_auth1_cb:function(_d2){
var iq=$iq({type:"set",id:"_auth_2"}).c("query",{xmlns:_3c.NS.AUTH}).c("username",{}).t(_3c.getNodeFromJid(this.jid)).up().c("password").t(this.pass);
if(!_3c.getResourceFromJid(this.jid)){
this.jid=_3c.getBareJidFromJid(this.jid)+"/strophe";
}
iq.up().c("resource",{}).t(_3c.getResourceFromJid(this.jid));
this._addSysHandler(this._auth2_cb.bind(this),null,null,null,"_auth_2");
this.send(iq.tree());
return false;
},_sasl_success_cb:function(_d3){
_3c.info("SASL authentication succeeded.");
this.deleteHandler(this._sasl_failure_handler);
this._sasl_failure_handler=null;
if(this._sasl_challenge_handler){
this.deleteHandler(this._sasl_challenge_handler);
this._sasl_challenge_handler=null;
}
this._addSysHandler(this._sasl_auth1_cb.bind(this),null,"stream:features",null,null);
this._sendRestart();
return false;
},_sasl_auth1_cb:function(_d4){
this.features=_d4;
var i,_d5;
for(i=0;i<_d4.childNodes.length;i++){
_d5=_d4.childNodes[i];
if(_d5.nodeName=="bind"){
this.do_bind=true;
}
if(_d5.nodeName=="session"){
this.do_session=true;
}
}
if(!this.do_bind){
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
return false;
}else{
this._addSysHandler(this._sasl_bind_cb.bind(this),null,null,null,"_bind_auth_2");
var _d6=_3c.getResourceFromJid(this.jid);
if(_d6){
this.send($iq({type:"set",id:"_bind_auth_2"}).c("bind",{xmlns:_3c.NS.BIND}).c("resource",{}).t(_d6).tree());
}else{
this.send($iq({type:"set",id:"_bind_auth_2"}).c("bind",{xmlns:_3c.NS.BIND}).tree());
}
}
return false;
},_sasl_bind_cb:function(_d7){
if(_d7.getAttribute("type")=="error"){
_3c.info("SASL binding failed.");
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
return false;
}
var _d8=_d7.getElementsByTagName("bind");
var _d9;
if(_d8.length>0){
_d9=_d8[0].getElementsByTagName("jid");
if(_d9.length>0){
this.jid=_3c.getText(_d9[0]);
if(this.do_session){
this._addSysHandler(this._sasl_session_cb.bind(this),null,null,null,"_session_auth_2");
this.send($iq({type:"set",id:"_session_auth_2"}).c("session",{xmlns:_3c.NS.SESSION}).tree());
}else{
this.authenticated=true;
this._changeConnectStatus(_3c.Status.CONNECTED,null);
}
}
}else{
_3c.info("SASL binding failed.");
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
return false;
}
},_sasl_session_cb:function(_da){
if(_da.getAttribute("type")=="result"){
this.authenticated=true;
this._changeConnectStatus(_3c.Status.CONNECTED,null);
}else{
if(_da.getAttribute("type")=="error"){
_3c.info("Session creation failed.");
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
return false;
}
}
return false;
},_sasl_failure_cb:function(_db){
if(this._sasl_success_handler){
this.deleteHandler(this._sasl_success_handler);
this._sasl_success_handler=null;
}
if(this._sasl_challenge_handler){
this.deleteHandler(this._sasl_challenge_handler);
this._sasl_challenge_handler=null;
}
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
return false;
},_auth2_cb:function(_dc){
if(_dc.getAttribute("type")=="result"){
this.authenticated=true;
this._changeConnectStatus(_3c.Status.CONNECTED,null);
}else{
if(_dc.getAttribute("type")=="error"){
this._changeConnectStatus(_3c.Status.AUTHFAIL,null);
this.disconnect();
}
}
return false;
},_addSysTimedHandler:function(_dd,_de){
var _df=new _3c.TimedHandler(_dd,_de);
_df.user=false;
this.addTimeds.push(_df);
return _df;
},_addSysHandler:function(_e0,ns,_e1,_e2,id){
var _e3=new _3c.Handler(_e0,ns,_e1,_e2,id);
_e3.user=false;
this.addHandlers.push(_e3);
return _e3;
},_onDisconnectTimeout:function(){
_3c.info("_onDisconnectTimeout was called");
var req;
while(this._requests.length>0){
req=this._requests.pop();
req.abort=true;
req.xhr.abort();
req.xhr.onreadystatechange=function(){
};
}
this._doDisconnect();
return false;
},_onIdle:function(){
var i,_e4,_e5,_e6;
while(this.removeTimeds.length>0){
_e4=this.removeTimeds.pop();
i=this.timedHandlers.indexOf(_e4);
if(i>=0){
this.timedHandlers.splice(i,1);
}
}
while(this.addTimeds.length>0){
this.timedHandlers.push(this.addTimeds.pop());
}
var now=new Date().getTime();
_e6=[];
for(i=0;i<this.timedHandlers.length;i++){
_e4=this.timedHandlers[i];
if(this.authenticated||!_e4.user){
_e5=_e4.lastCalled+_e4.period;
if(_e5-now<=0){
if(_e4.run()){
_e6.push(_e4);
}
}else{
_e6.push(_e4);
}
}
}
this.timedHandlers=_e6;
var _e7,_e8;
if(this.authenticated&&this._requests.length===0&&this._data.length===0&&!this.disconnecting){
_3c.info("no requests during idle cycle, sending "+"blank request");
this._data.push(null);
}
if(this._requests.length<2&&this._data.length>0&&!this.paused){
_e7=this._buildBody();
for(i=0;i<this._data.length;i++){
if(this._data[i]!==null){
if(this._data[i]==="restart"){
_e7.attrs({to:this.domain,"xml:lang":"en","xmpp:restart":"true","xmlns:xmpp":_3c.NS.BOSH});
}else{
_e7.cnode(this._data[i]).up();
}
}
}
delete this._data;
this._data=[];
this._requests.push(new _3c.Request(_e7.tree(),this._onRequestStateChange.bind(this).prependArg(this._dataRecv.bind(this)),_e7.tree().getAttribute("rid")));
this._processRequest(this._requests.length-1);
}
if(this._requests.length>0){
_e8=this._requests[0].age();
if(this._requests[0].dead!==null){
if(this._requests[0].timeDead()>Math.floor(_3c.SECONDARY_TIMEOUT*this.wait)){
this._throttledRequestHandler();
}
}
if(_e8>Math.floor(_3c.TIMEOUT*this.wait)){
_3c.warn("Request "+this._requests[0].id+" timed out, over "+Math.floor(_3c.TIMEOUT*this.wait)+" seconds since last activity");
this._throttledRequestHandler();
}
}
clearTimeout(this._idleTimeout);
this._idleTimeout=setTimeout(this._onIdle.bind(this),100);
}};
if(_3b){
_3b(_3c,_3d,_40,$iq,_43);
}
})(function(){
window.Strophe=arguments[0];
window.$build=arguments[1];
window.$msg=arguments[2];
window.$iq=arguments[3];
window.$pres=arguments[4];
});
