@STATIC;1.0;p;15;AppController.jt;3374;@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPTimer.ji;38;Controllers/ManageAccountsController.jt;3261;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
objj_executeFile("Controllers/ManageAccountsController.j",YES);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow"),new objj_ivar("mainSplitView"),new objj_ivar("rosterButtonBar")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSend(mainSplitView,"setButtonBar:forDividerAtIndex:",rosterButtonBar,0);
objj_msgSend(mainSplitView,"setPosition:ofDividerAtIndex:",220,0);
var _8=objj_msgSend(CPButtonBar,"plusButton"),_9=objj_msgSend(CPButtonBar,"minusButton"),_a=objj_msgSend(CPButtonBar,"actionPopupButton");
objj_msgSend(_8,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
objj_msgSend(_8,"setAction:",sel_getUid("promptForNewContact:"));
objj_msgSend(_9,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
objj_msgSend(_9,"setAction:",sel_getUid("rosterMinusWasClicked:"));
var _b=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Manage Accounts",sel_getUid("manageAccounts:"),nil);
objj_msgSend(_b,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
var _c=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Open XML Console for selected Account",sel_getUid("openXMLConsole:"),nil);
objj_msgSend(_c,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
var _d=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Connect All Accounts",sel_getUid("connectAllAccounts:"),nil);
objj_msgSend(_d,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
var _e=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Disconnect All Accounts",sel_getUid("disconnectAllAccounts:"),nil);
objj_msgSend(_e,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
var _f=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Connect Selected Account",sel_getUid("connectSelectedAccount:"),nil);
objj_msgSend(_f,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
var _10=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","Disconnect Selected Account",sel_getUid("disconnectSelectedAccount:"),nil);
objj_msgSend(_10,"setTarget:",objj_msgSend(AccountsController,"sharedController"));
objj_msgSend(_a,"addItem:",_f);
objj_msgSend(_a,"addItem:",_10);
objj_msgSend(_a,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(_a,"addItem:",_d);
objj_msgSend(_a,"addItem:",_e);
objj_msgSend(_a,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(_a,"addItem:",_b);
objj_msgSend(_a,"addItem:",_c);
objj_msgSend(rosterButtonBar,"setButtons:",[_8,_9,_a]);
}
}),new objj_method(sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"),function(_11,_12,_13,_14,_15){
with(_11){
return 160;
}
}),new objj_method(sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"),function(_16,_17,_18,_19,_1a){
with(_16){
return 300;
}
})]);
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;32;Controllers/AccountsController.jt;19151;@STATIC;1.0;I;25;AppKit/CPViewController.jI;21;AppKit/CPScrollView.jI;16;AppKit/CPSound.jI;27;Foundation/CPUserDefaults.ji;19;../Models/Account.ji;23;ContactViewController.ji;22;ChatWindowController.ji;22;AddContactController.ji;22;XMLConsoleController.jt;18889;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AppKit/CPSound.j",NO);
objj_executeFile("Foundation/CPUserDefaults.j",NO);
objj_executeFile("../Models/Account.j",YES);
objj_executeFile("ContactViewController.j",YES);
objj_executeFile("ChatWindowController.j",YES);
objj_executeFile("AddContactController.j",YES);
objj_executeFile("XMLConsoleController.j",YES);
var _1=nil;
RosterViewDragType="RosterViewDragType";
var _2=objj_allocateClassPair(CPViewController,"AccountsController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("accounts"),new objj_ivar("chatWindows"),new objj_ivar("scrollView"),new objj_ivar("rosterView"),new objj_ivar("draggedItems"),new objj_ivar("messageReceivedSound")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("accounts"),function(_4,_5){
with(_4){
return accounts;
}
}),new objj_method(sel_getUid("setAccounts:"),function(_6,_7,_8){
with(_6){
accounts=_8;
}
}),new objj_method(sel_getUid("scrollView"),function(_9,_a){
with(_9){
return scrollView;
}
}),new objj_method(sel_getUid("setScrollView:"),function(_b,_c,_d){
with(_b){
scrollView=_d;
}
}),new objj_method(sel_getUid("rosterView"),function(_e,_f){
with(_e){
return rosterView;
}
}),new objj_method(sel_getUid("setRosterView:"),function(_10,_11,_12){
with(_10){
rosterView=_12;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
if(_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("AccountsController").super_class},"init")){
accounts=objj_msgSend(CPArray,"array");
chatWindows=objj_msgSend(CPDictionary,"dictionary");
messageReceivedSound=objj_msgSend(objj_msgSend(CPSound,"alloc"),"initWithContentsOfFile:byReference:",objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_13,"class")),"pathForResource:","Receive.mp3"),NO);
objj_msgSend(_13,"listenForReloadNotifications");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("expandAccount:"),TNStropheRosterRetrievedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("storeAccounts"),AccountWasAddedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("storeAccounts"),AccountWasEditedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_13,sel_getUid("storeAccounts"),AccountWasDeletedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",messageReceivedSound,sel_getUid("play"),TNStropheContactMessageReceivedNotification,nil);
objj_msgSend(_13,"setupStoredAccounts");
}
return _13;
}
}),new objj_method(sel_getUid("listenForReloadNotifications"),function(_15,_16){
with(_15){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheRosterRetrievedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheConnectionStatusDisconnected,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheConnectionStatusConnectionFailure,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheConnectionStatusError,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactNicknameUpdatedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactGroupUpdatedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactPresenceUpdatedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactVCardReceivedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactMessageReceivedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheContactMessageTreatedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheRosterAddedContactNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheRosterRemovedContactNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_15,sel_getUid("reload"),TNStropheRosterRemovedGroupNotification,nil);
}
}),new objj_method(sel_getUid("setupStoredAccounts"),function(_17,_18){
with(_17){
var _19=objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"objectForKey:","accounts");
for(var i=0;i<objj_msgSend(_19,"count");i++){
var _1a=objj_msgSend(_19,"objectAtIndex:",i);
objj_msgSend(_17,"addAccountWithJID:andPassword:enabled:",objj_msgSend(_1a,"valueForKey:","jid"),objj_msgSend(_1a,"valueForKey:","password"),objj_msgSend(_1a,"valueForKey:","enabled"));
}
}
}),new objj_method(sel_getUid("accountCredentials"),function(_1b,_1c){
with(_1b){
var _1d=objj_msgSend(CPArray,"array");
for(var i=0;i<objj_msgSend(accounts,"count");i++){
var _1e=objj_msgSend(accounts,"objectAtIndex:",i),_1f=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(_1e,"JID"),"jid",objj_msgSend(_1e,"password"),"password",objj_msgSend(_1e,"isEnabled"),"enabled");
objj_msgSend(_1d,"addObject:",_1f);
}
return _1d;
}
}),new objj_method(sel_getUid("storeAccounts"),function(_20,_21){
with(_20){
objj_msgSend(objj_msgSend(CPUserDefaults,"standardUserDefaults"),"setObject:forKey:",objj_msgSend(_20,"accountCredentials"),"accounts");
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_22,_23){
with(_22){
_1=_22;
objj_msgSendSuper({receiver:_22,super_class:objj_getClass("AccountsController").super_class},"awakeFromCib");
rosterView=objj_msgSend(objj_msgSend(CPOutlineView,"alloc"),"initWithFrame:",objj_msgSend(objj_msgSend(scrollView,"contentView"),"bounds"));
objj_msgSend(rosterView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","e0ecfa"));
var _24=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","TextColumn");
objj_msgSend(_24,"setWidth:",200);
objj_msgSend(rosterView,"setRowHeight:",45);
objj_msgSend(rosterView,"setCornerView:",nil);
objj_msgSend(rosterView,"setHeaderView:",nil);
objj_msgSend(rosterView,"addTableColumn:",_24);
objj_msgSend(rosterView,"setOutlineTableColumn:",_24);
objj_msgSend(rosterView,"setDelegate:",_22);
objj_msgSend(rosterView,"setTarget:",_22);
objj_msgSend(rosterView,"registerForDraggedTypes:",[RosterViewDragType]);
objj_msgSend(rosterView,"setDoubleAction:",sel_getUid("rosterDidReceiveDoubleClick:"));
objj_msgSend(rosterView,"setDataSource:",_22);
objj_msgSend(rosterView,"setAllowsMultipleSelection:",NO);
objj_msgSend(rosterView,"setAllowsEmptySelection:",YES);
objj_msgSend(rosterView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(rosterView,"setAllowsColumnResizing:",YES);
objj_msgSend(rosterView,"setColumnAutoresizingStyle:",CPTableViewUniformColumnAutoresizingStyle);
objj_msgSend(scrollView,"setDocumentView:",rosterView);
}
}),new objj_method(sel_getUid("selectedItem"),function(_25,_26){
with(_25){
return objj_msgSend(rosterView,"itemAtRow:",objj_msgSend(rosterView,"selectedRow"));
}
}),new objj_method(sel_getUid("connectAllAccounts:"),function(_27,_28,_29){
with(_27){
for(var i=0;i<objj_msgSend(accounts,"count");i++){
objj_msgSend(objj_msgSend(accounts,"objectAtIndex:",i),"connect");
}
}
}),new objj_method(sel_getUid("disconnectAllAccounts:"),function(_2a,_2b,_2c){
with(_2a){
for(var i=0;i<objj_msgSend(accounts,"count");i++){
objj_msgSend(objj_msgSend(accounts,"objectAtIndex:",i),"disconnect");
}
}
}),new objj_method(sel_getUid("connectSelectedAccount:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_2d,"selectedItem");
if(!objj_msgSend(_30,"isKindOfClass:",objj_msgSend(Account,"class"))){
return;
}
objj_msgSend(_30,"connect");
}
}),new objj_method(sel_getUid("disconnectSelectedAccount:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_31,"selectedItem");
if(!objj_msgSend(_34,"isKindOfClass:",objj_msgSend(Account,"class"))){
return;
}
objj_msgSend(_34,"disconnect");
}
}),new objj_method(sel_getUid("manageAccounts:"),function(_35,_36,_37){
with(_35){
CPLog.debug("Managing accounts!");
objj_msgSend(objj_msgSend(ManageAccountsController,"sharedController"),"showWindow:",_35);
}
}),new objj_method(sel_getUid("accountWithJID:"),function(_38,_39,_3a){
with(_38){
for(var i=0;i<objj_msgSend(accounts,"count");i++){
var _3b=objj_msgSend(accounts,"objectAtIndex:",i);
if(objj_msgSend(_3b,"JID")===_3a){
return _3b;
}
}
}
}),new objj_method(sel_getUid("addAccountWithJID:andPassword:"),function(_3c,_3d,_3e,_3f){
with(_3c){
objj_msgSend(_3c,"addAccountWithJID:andPassword:enabled:",_3e,_3f,YES);
}
}),new objj_method(sel_getUid("addAccountWithJID:andPassword:enabled:"),function(_40,_41,_42,_43,_44){
with(_40){
CPLog.debug("Adding account with JID "+_42+" and password "+_43);
objj_msgSend(_40,"addAccount:",objj_msgSend(Account,"accountWithJID:andPassword:enabled:",_42,_43,_44));
}
}),new objj_method(sel_getUid("addAccount:"),function(_45,_46,_47){
with(_45){
objj_msgSend(accounts,"addObject:",_47);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasAddedNotification,_45);
if(objj_msgSend(_47,"isEnabled")){
objj_msgSend(_47,"connect");
}
}
}),new objj_method(sel_getUid("deleteAccountWithJID:"),function(_48,_49,_4a){
with(_48){
objj_msgSend(_48,"deleteAccount:",objj_msgSend(_48,"accountWithJID:",_4a));
objj_msgSend(_48,"reload");
}
}),new objj_method(sel_getUid("deleteAccount:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4d,"disconnect");
objj_msgSend(accounts,"removeObject:",_4d);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasDeletedNotification,_4b);
objj_msgSend(_4b,"reload");
}
}),new objj_method(sel_getUid("reload"),function(_4e,_4f){
with(_4e){
CPLog.debug("Reloading roster view!");
objj_msgSend(rosterView,"reloadData");
}
}),new objj_method(sel_getUid("expandAccount:"),function(_50,_51,_52){
with(_50){
objj_msgSend(rosterView,"expandItem:expandChildren:",objj_msgSend(objj_msgSend(_52,"object"),"connection"),YES);
}
}),new objj_method(sel_getUid("openXMLConsole:"),function(_53,_54,_55){
with(_53){
var _56=objj_msgSend(_53,"selectedItem");
if(!objj_msgSend(_56,"isKindOfClass:",objj_msgSend(Account,"class"))){
return;
}
objj_msgSend(objj_msgSend(_56,"xmlConsoleController"),"showWindow:",_53);
}
}),new objj_method(sel_getUid("promptForNewContact:"),function(_57,_58,_59){
with(_57){
CPLog.debug("Adding a contact");
var _5a=objj_msgSend(_57,"selectedItem"),_5b;
if(objj_msgSend(_5a,"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))){
_5b=objj_msgSend(rosterView,"parentForItem:",objj_msgSend(rosterView,"parentForItem:",_5a));
}else{
if(objj_msgSend(_5a,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))){
_5b=objj_msgSend(rosterView,"parentForItem:",_5a);
}else{
if(objj_msgSend(_5a,"isKindOfClass:",objj_msgSend(Account,"class"))){
_5b=_5a;
}else{
_5b=objj_msgSend(accounts,"objectAtIndex:",0);
}
}
}
var _5c=objj_msgSend(objj_msgSend(AddContactController,"alloc"),"initWithAccount:",_5b);
objj_msgSend(_5c,"showWindow:",_59);
}
}),new objj_method(sel_getUid("rosterMinusWasClicked:"),function(_5d,_5e,_5f){
with(_5d){
CPLog.debug("Removing something!");
var _60=objj_msgSend(_5d,"selectedItem");
if(objj_msgSend(_60,"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))){
objj_msgSend(objj_msgSend(objj_msgSend(rosterView,"parentForItem:",objj_msgSend(rosterView,"parentForItem:",_60)),"roster"),"removeContact:",_60);
}else{
if(objj_msgSend(_60,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))){
objj_msgSend(objj_msgSend(objj_msgSend(rosterView,"parentForItem:",_60),"roster"),"removeGroup:",_60);
}
}
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_61,_62,_63,_64){
with(_61){
if(!_64){
return objj_msgSend(accounts,"count");
}
if(objj_msgSend(_64,"isKindOfClass:",objj_msgSend(Account,"class"))){
return objj_msgSend(objj_msgSend(_64,"roster"),"populatedGroupsCount");
}
if(objj_msgSend(_64,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))||objj_msgSend(_64,"isKindOfClass:",objj_msgSend(CPArray,"class"))||objj_msgSend(_64,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))){
return objj_msgSend(_64,"count");
}
return 0;
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_65,_66,_67,_68,_69){
with(_65){
if(!_69){
_69=accounts;
}
if(objj_msgSend(_69,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return objj_msgSend(_69,"objectAtIndex:",_68);
}else{
if(objj_msgSend(_69,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return objj_msgSend(_69,"objectForKey:",objj_msgSend(objj_msgSend(_69,"allKeys"),"objectAtIndex:",_68));
}else{
if(objj_msgSend(_69,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))){
return objj_msgSend(objj_msgSend(_69,"contacts"),"objectAtIndex:",_68);
}else{
if(objj_msgSend(_69,"isKindOfClass:",objj_msgSend(Account,"class"))){
return objj_msgSend(objj_msgSend(objj_msgSend(_69,"roster"),"populatedGroups"),"objectAtIndex:",_68);
}
}
}
}
return;
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_6a,_6b,_6c,_6d){
with(_6a){
if((objj_msgSend(_6d,"isKindOfClass:",objj_msgSend(CPArray,"class"))||objj_msgSend(_6d,"isKindOfClass:",objj_msgSend(CPDictionary,"class")))&&objj_msgSend(_6d,"count")>0){
return YES;
}
if((objj_msgSend(_6d,"isKindOfClass:",objj_msgSend(Account,"class")))&&objj_msgSend(objj_msgSend(_6d,"roster"),"populatedGroupsCount")>0){
return YES;
}
if((objj_msgSend(_6d,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class")))&&objj_msgSend(_6d,"count")>0){
return YES;
}
return NO;
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_6e,_6f,_70,_71,_72){
with(_6e){
if(objj_msgSend(_72,"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))||objj_msgSend(_72,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))||objj_msgSend(_72,"isKindOfClass:",objj_msgSend(Account,"class"))){
return _72;
}
var _73=objj_msgSend(_70,"parentForItem:",_72)?objj_msgSend(_70,"parentForItem:",_72):objj_msgSend(_6e,"structure");
if(objj_msgSend(_73,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
return objj_msgSend(objj_msgSend(_73,"allKeysForObject:",_72),"objectAtIndex:",0);
}else{
if(objj_msgSend(_73,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return _72;
}
}
return;
}
}),new objj_method(sel_getUid("rosterDidReceiveDoubleClick:"),function(_74,_75,_76){
with(_74){
if(objj_msgSend(objj_msgSend(_74,"selectedItem"),"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))){
var _77=objj_msgSend(_74,"selectedItem"),_78;
if(objj_msgSend(chatWindows,"objectForKey:",_77)){
_78=objj_msgSend(chatWindows,"objectForKey:",_77);
}else{
_78=objj_msgSend(objj_msgSend(ChatWindowController,"alloc"),"initWithContact:",_77);
objj_msgSend(chatWindows,"setObject:forKey:",_78,_77);
}
objj_msgSend(_78,"showWindow:",_74);
}else{
if(objj_msgSend(objj_msgSend(_74,"selectedItem"),"isKindOfClass:",objj_msgSend(Account,"class"))){
objj_msgSend(objj_msgSend(objj_msgSend(_74,"selectedItem"),"setStatusController"),"showWindow:",_74);
}
}
}
}),new objj_method(sel_getUid("outlineView:dataViewForTableColumn:item:"),function(_79,_7a,_7b,_7c,_7d){
with(_79){
if(objj_msgSend(_7d,"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))){
return objj_msgSend(objj_msgSend(objj_msgSend(ContactViewController,"alloc"),"init"),"view");
}
var _7e=objj_msgSend(CPTextField,"new");
objj_msgSend(_7e,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",51/255,51/255,51/255,1),"text-color");
objj_msgSend(_7e,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"whiteColor"),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(_7e,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_7e,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12),"font",CPThemeStateSelectedDataView);
objj_msgSend(_7e,"setValue:forThemeAttribute:",CPCenterVerticalTextAlignment,"vertical-alignment");
objj_msgSend(_7e,"setValue:forThemeAttribute:",CGInsetMake(0,0,0,5),"content-inset");
return _7e;
}
}),new objj_method(sel_getUid("outlineView:writeItems:toPasteboard:"),function(_7f,_80,_81,_82,_83){
with(_7f){
for(var i=0;i<objj_msgSend(_82,"count");i++){
if(!objj_msgSend(objj_msgSend(_82,"objectAtIndex:",i),"isKindOfClass:",objj_msgSend(TNStropheContact,"class"))){
return NO;
}
}
draggedItems=_82;
objj_msgSend(_83,"declareTypes:owner:",[RosterViewDragType],_7f);
objj_msgSend(_83,"setData:forType:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_82),RosterViewDragType);
return YES;
}
}),new objj_method(sel_getUid("outlineView:validateDrop:proposedItem:proposedChildIndex:"),function(_84,_85,_86,_87,_88,_89){
with(_84){
if(!_88){
objj_msgSend(_86,"setDropItem:dropChildIndex:",nil,_89);
}
if(!objj_msgSend(_88,"isKindOfClass:",objj_msgSend(TNStropheGroup,"class"))){
return CPDragOperationNone;
}
var _8a=objj_msgSend(_86,"parentForItem:",_88),_8b=NO;
for(var i=0;i<objj_msgSend(draggedItems,"count");i++){
if(_8a!=objj_msgSend(_86,"parentForItem:",objj_msgSend(rosterView,"parentForItem:",objj_msgSend(draggedItems,"objectAtIndex:",i)))){
_8b=YES;
}
}
if(_8b){
return CPDragOperationNone;
}
objj_msgSend(_86,"setDropItem:dropChildIndex:",_88,_89);
return CPDragOperationMove;
}
}),new objj_method(sel_getUid("outlineView:acceptDrop:item:childIndex:"),function(_8c,_8d,_8e,_8f,_90,_91){
with(_8c){
if(_90===nil){
_90=accounts;
}
var _92=objj_msgSend(draggedItems,"count");
while(_92--){
var _93=objj_msgSend(draggedItems,"objectAtIndex:",_92);
if(_93===_90){
continue;
}
objj_msgSend(objj_msgSend(objj_msgSend(_8e,"parentForItem:",objj_msgSend(rosterView,"parentForItem:",_93)),"roster"),"changeGroup:ofContact:",_90,_93);
_91+=1;
}
return YES;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedController"),function(_94,_95){
with(_94){
if(!_1){
_1=objj_msgSend(objj_msgSend(AccountsController,"alloc"),"init");
}
return _1;
}
})]);
p;34;Controllers/AddContactController.jt;3349;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;20;AccountsController.ji;19;../Models/Account.jt;3249;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AccountsController.j",YES);
objj_executeFile("../Models/Account.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"AddContactController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("addButton"),new objj_ivar("jidField"),new objj_ivar("nameField"),new objj_ivar("groupPicker"),new objj_ivar("groupNameField"),new objj_ivar("account")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAccount:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("AddContactController").super_class},"initWithWindowCibName:","AddContact")){
account=_5;
}
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("AddContactController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_6,"window"),"setDefaultButton:",addButton);
objj_msgSend(objj_msgSend(_6,"window"),"setTitle:","Add a Contact to "+objj_msgSend(account,"JID"));
objj_msgSend(jidField,"becomeFirstResponder");
objj_msgSend(jidField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(nameField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(groupNameField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(groupPicker,"removeAllItems");
for(var i=0;i<objj_msgSend(objj_msgSend(objj_msgSend(account,"roster"),"groups"),"count");i++){
var _8=objj_msgSend(objj_msgSend(objj_msgSend(account,"roster"),"groups"),"objectAtIndex:",i),_9=objj_msgSend(CPMenuItem,"new");
objj_msgSend(_9,"setTag:",objj_msgSend(_8,"name"));
objj_msgSend(_9,"setTitle:",objj_msgSend(_8,"name"));
objj_msgSend(groupPicker,"addItem:",_9);
}
var _a=objj_msgSend(CPMenuItem,"new");
objj_msgSend(_a,"setTag:","CreateNewGroup");
objj_msgSend(_a,"setTitle:","Create a new group");
objj_msgSend(_a,"setTarget:",_6);
objj_msgSend(_a,"setAction:",sel_getUid("newGroupSelected:"));
objj_msgSend(groupPicker,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
objj_msgSend(groupPicker,"addItem:",_a);
objj_msgSend(groupPicker,"selectItemAtIndex:",0);
}
}),new objj_method(sel_getUid("newGroupSelected:"),function(_b,_c,_d){
with(_b){
CPLog.debug("New group was selected!");
var _e=objj_msgSend(objj_msgSend(_b,"window"),"frame");
_e.size.height+=30;
objj_msgSend(objj_msgSend(_b,"window"),"setFrame:display:animate:",_e,YES,YES);
objj_msgSend(groupNameField,"setHidden:",NO);
}
}),new objj_method(sel_getUid("add:"),function(_f,_10,_11){
with(_f){
var _12=objj_msgSend(objj_msgSend(groupPicker,"selectedItem"),"tag");
if(_12==="CreateNewGroup"){
_12=objj_msgSend(groupNameField,"objectValue");
}
objj_msgSend(objj_msgSend(account,"roster"),"addContact:withName:inGroupWithName:",objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(jidField,"objectValue")),objj_msgSend(nameField,"objectValue"),_12);
objj_msgSend(_f,"close");
}
}),new objj_method(sel_getUid("cancel:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"close");
}
})]);
p;34;Controllers/ChatWindowController.jt;4297;@STATIC;1.0;I;27;AppKit/CPWindowController.jI;21;AppKit/CPScrollView.jI;19;Foundation/CPDate.jI;27;MessageBoard/MessageBoard.ji;19;../Models/Account.jt;4140;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("Foundation/CPDate.j",NO);
objj_executeFile("MessageBoard/MessageBoard.j",NO);
objj_executeFile("../Models/Account.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"ChatWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("contact"),new objj_ivar("scrollView"),new objj_ivar("conversationView"),new objj_ivar("messageField"),new objj_ivar("sendButton")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithContact:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("ChatWindowController").super_class},"initWithWindowCibName:","ChatWindow")){
contact=_5;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_3,sel_getUid("stopListeningForMessages"),CPWindowWillCloseNotification,objj_msgSend(_3,"window"));
}
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("ChatWindowController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_6,"window"),"setFrameOrigin:",CGPointMake(310,50));
objj_msgSend(objj_msgSend(_6,"window"),"setTitle:",objj_msgSend(contact,"nickname"));
objj_msgSend(objj_msgSend(_6,"window"),"setDefaultButton:",sendButton);
objj_msgSend(messageField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(messageField,"becomeFirstResponder");
conversationView=objj_msgSend(objj_msgSend(TNMessageBoard,"alloc"),"initWithFrame:",objj_msgSend(scrollView,"bounds"));
objj_msgSend(scrollView,"setDocumentView:",conversationView);
objj_msgSend(CPBox,"boxEnclosingView:",scrollView);
}
}),new objj_method(sel_getUid("showWindow:"),function(_8,_9,_a){
with(_8){
objj_msgSendSuper({receiver:_8,super_class:objj_getClass("ChatWindowController").super_class},"showWindow:",_a);
objj_msgSend(_8,"grabAllQueuedMessages");
objj_msgSend(_8,"startListeningForMessages");
}
}),new objj_method(sel_getUid("grabAllQueuedMessages"),function(_b,_c){
with(_b){
var _d;
while(_d=objj_msgSend(contact,"popMessagesQueue")){
objj_msgSend(_b,"processIncomingMessage:",_d);
}
}
}),new objj_method(sel_getUid("startListeningForMessages"),function(_e,_f){
with(_e){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_e,sel_getUid("receiveMessage:"),TNStropheContactMessageReceivedNotification,contact);
}
}),new objj_method(sel_getUid("stopListeningForMessages"),function(_10,_11){
with(_10){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_10,TNStropheContactMessageReceivedNotification,contact);
}
}),new objj_method(sel_getUid("sendMessage:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(messageField,"objectValue");
objj_msgSend(contact,"sendMessage:",_15);
objj_msgSend(messageField,"setObjectValue:",nil);
objj_msgSend(conversationView,"addMessage:from:date:color:",_15,"me",objj_msgSend(CPDate,"date"),objj_msgSend(CPColor,"redColor"));
objj_msgSend(_12,"scrollToBottom");
}
}),new objj_method(sel_getUid("receiveMessage:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"processIncomingMessage:",objj_msgSend(contact,"popMessagesQueue"));
}
}),new objj_method(sel_getUid("processIncomingMessage:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(conversationView,"addMessage:from:date:color:",objj_msgSend(objj_msgSend(_1b,"firstChildWithName:","body"),"text"),objj_msgSend(contact,"nickname"),objj_msgSend(CPDate,"date"),objj_msgSend(CPColor,"blueColor"));
objj_msgSend(_19,"scrollToBottom");
}
}),new objj_method(sel_getUid("scrollToBottom"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(conversationView,"boundsSize").height-objj_msgSend(objj_msgSend(scrollView,"contentView"),"boundsSize").height;
objj_msgSend(objj_msgSend(scrollView,"contentView"),"scrollToPoint:",CGPointMake(0,_1e));
objj_msgSend(scrollView,"reflectScrolledClipView:",objj_msgSend(scrollView,"contentView"));
}
})]);
p;35;Controllers/ContactViewController.jt;1742;@STATIC;1.0;I;25;AppKit/CPViewController.jI;36;StropheCappuccino/TNStropheContact.ji;22;../Views/ContactView.jt;1625;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("StropheCappuccino/TNStropheContact.j",NO);
objj_executeFile("../Views/ContactView.j",YES);
var _1=objj_allocateClassPair(CPViewController,"ContactViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("statusIcon"),new objj_ivar("nickname"),new objj_ivar("XMPPStatus"),new objj_ivar("numberOfEvents")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("ContactViewController").super_class},"initWithCibName:bundle:","ContactView",nil);
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("ContactViewController").super_class},"awakeFromCib");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_7,_8,_9){
with(_7){
_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("ContactViewController").super_class},"initWithCoder:",_9);
if(_7){
nickname=objj_msgSend(_9,"decodeObjectForKey:","nickname");
statusIcon=objj_msgSend(_9,"decodeObjectForKey:","statusIcon");
avatar=objj_msgSend(_9,"decodeObjectForKey:","avatar");
}
return _7;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_a,_b,_c){
with(_a){
objj_msgSendSuper({receiver:_a,super_class:objj_getClass("ContactViewController").super_class},"encodeWithCoder:",_c);
objj_msgSend(_c,"encodeObject:forKey:",nickname,"nickname");
objj_msgSend(_c,"encodeObject:forKey:",statusIcon,"statusIcon");
objj_msgSend(_c,"encodeObject:forKey:",avatar,"avatar");
}
})]);
p;35;Controllers/EditAccountController.jt;2038;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;20;AccountsController.ji;19;../Models/Account.jt;1938;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AccountsController.j",YES);
objj_executeFile("../Models/Account.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"EditAccountController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("editButton"),new objj_ivar("changeRegistrationField"),new objj_ivar("jidField"),new objj_ivar("passwordField"),new objj_ivar("account")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAccount:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("EditAccountController").super_class},"initWithWindowCibName:","EditAccount")){
account=_5;
}
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("EditAccountController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_6,"window"),"setDefaultButton:",editButton);
objj_msgSend(passwordField,"setSecure:",YES);
objj_msgSend(jidField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(passwordField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(jidField,"setObjectValue:",objj_msgSend(account,"JID"));
objj_msgSend(passwordField,"setObjectValue:",objj_msgSend(account,"password"));
objj_msgSend(jidField,"becomeFirstResponder");
}
}),new objj_method(sel_getUid("submit:"),function(_8,_9,_a){
with(_8){
objj_msgSend(account,"editWithJID:andPassword:changeRegistration:",objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(jidField,"objectValue")),objj_msgSend(passwordField,"objectValue"),objj_msgSend(changeRegistrationField,"objectValue")===1);
objj_msgSend(_8,"close");
}
}),new objj_method(sel_getUid("cancel:"),function(_b,_c,_d){
with(_b){
objj_msgSend(_b,"close");
}
})]);
p;38;Controllers/ManageAccountsController.jt;6447;@STATIC;1.0;I;27;AppKit/CPWindowController.jI;21;AppKit/CPScrollView.ji;20;AccountsController.ji;22;NewAccountController.ji;23;EditAccountController.ji;19;../Models/Account.jt;6266;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AccountsController.j",YES);
objj_executeFile("NewAccountController.j",YES);
objj_executeFile("EditAccountController.j",YES);
objj_executeFile("../Models/Account.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPWindowController,"ManageAccountsController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("scrollView"),new objj_ivar("accountsTable"),new objj_ivar("editAccountButton"),new objj_ivar("deleteAccountButton"),new objj_ivar("accounts")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("ManageAccountsController").super_class},"initWithWindowCibName:","ManageAccounts")){
accounts=objj_msgSend(objj_msgSend(AccountsController,"sharedController"),"accounts");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_4,sel_getUid("accountsWereUpdated:"),AccountWasAddedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_4,sel_getUid("accountsWereUpdated:"),AccountWasEditedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_4,sel_getUid("accountsWereUpdated:"),AccountWasDeletedNotification,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_4,sel_getUid("accountsWereUpdated:"),AccountConnectionStatusDidChangeNotification,nil);
}
return _4;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("ManageAccountsController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_6,"window"),"setFrameOrigin:",CGPointMake(310,50));
objj_msgSend(editAccountButton,"setEnabled:",NO);
objj_msgSend(deleteAccountButton,"setEnabled:",NO);
accountsTable=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",objj_msgSend(scrollView,"bounds"));
objj_msgSend(accountsTable,"setDataSource:",_6);
objj_msgSend(accountsTable,"setDelegate:",_6);
objj_msgSend(accountsTable,"setDoubleAction:",sel_getUid("doubleClickedRow:"));
objj_msgSend(accountsTable,"setUsesAlternatingRowBackgroundColors:",YES);
var _8=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","accountState");
objj_msgSend(_8,"setWidth:",24);
objj_msgSend(accountsTable,"addTableColumn:",_8);
var _9=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","JID");
objj_msgSend(objj_msgSend(_9,"headerView"),"setStringValue:","JID");
objj_msgSend(_9,"setWidth:",200);
objj_msgSend(accountsTable,"addTableColumn:",_9);
var _a=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","connectionStatus");
objj_msgSend(objj_msgSend(_a,"headerView"),"setStringValue:","Connection Status");
objj_msgSend(_a,"setWidth:",140);
objj_msgSend(accountsTable,"addTableColumn:",_a);
objj_msgSend(scrollView,"setDocumentView:",accountsTable);
objj_msgSend(CPBox,"boxEnclosingView:",scrollView);
}
}),new objj_method(sel_getUid("addAccount:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(objj_msgSend(NewAccountController,"alloc"),"init");
objj_msgSend(_e,"showWindow:",_d);
}
}),new objj_method(sel_getUid("selectedAccount"),function(_f,_10){
with(_f){
return objj_msgSend(accounts,"objectAtIndex:",objj_msgSend(accountsTable,"selectedRow"));
}
}),new objj_method(sel_getUid("editAccount:"),function(_11,_12,_13){
with(_11){
CPLog.debug("Editing an account!");
var _14=objj_msgSend(objj_msgSend(EditAccountController,"alloc"),"initWithAccount:",objj_msgSend(_11,"selectedAccount"));
objj_msgSend(_14,"showWindow:",_13);
}
}),new objj_method(sel_getUid("deleteAccount:"),function(_15,_16,_17){
with(_15){
CPLog.debug("Deleting an account!");
objj_msgSend(objj_msgSend(AccountsController,"sharedController"),"deleteAccount:",objj_msgSend(_15,"selectedAccount"));
}
}),new objj_method(sel_getUid("accountsWereUpdated:"),function(_18,_19,_1a){
with(_18){
CPLog.debug("Accounts were updated!");
objj_msgSend(accountsTable,"reloadData");
objj_msgSend(_18,"setButtonStatus");
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(accounts,"count");
}
}),new objj_method(sel_getUid("tableView:dataViewForTableColumn:row:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
if(objj_msgSend(_21,"identifier")=="accountState"){
return objj_msgSend(CPCheckBox,"checkBoxWithTitle:",nil);
}
return objj_msgSend(_21,"dataView");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=objj_msgSend(accounts,"objectAtIndex:",_27),_29;
switch(objj_msgSend(_26,"identifier")){
case "accountState":
if(objj_msgSend(_28,"isEnabled")){
_29=CPOnState;
}else{
_29=CPOffState;
}
break;
case "JID":
_29=objj_msgSend(_28,"JID");
break;
case "connectionStatus":
_29=objj_msgSend(_28,"connectionStatus");
break;
}
return _29;
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(_2a,_2b,_2c,_2d,_2e,_2f){
with(_2a){
var _30=objj_msgSend(accounts,"objectAtIndex:",_2f);
if(objj_msgSend(_2e,"identifier")=="accountState"){
if(_2d==CPOnState){
objj_msgSend(_30,"enable");
}else{
if(_2d===CPOffState){
objj_msgSend(_30,"disable");
}
}
}
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"setButtonStatus");
}
}),new objj_method(sel_getUid("setButtonStatus"),function(_34,_35){
with(_34){
var _36=YES;
if(objj_msgSend(accountsTable,"selectedRow")==-1||objj_msgSend(accounts,"count")<1){
_36=NO;
}
objj_msgSend(editAccountButton,"setEnabled:",_36);
objj_msgSend(deleteAccountButton,"setEnabled:",_36);
}
}),new objj_method(sel_getUid("doubleClickedRow:"),function(_37,_38,_39){
with(_37){
objj_msgSend(objj_msgSend(objj_msgSend(_37,"selectedAccount"),"editAccountController"),"showWindow:",_37);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedController"),function(_3a,_3b){
with(_3a){
if(!_1){
_1=objj_msgSend(objj_msgSend(ManageAccountsController,"alloc"),"init");
}
return _1;
}
})]);
p;34;Controllers/NewAccountController.jt;1689;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;20;AccountsController.jt;1613;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AccountsController.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"NewAccountController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("addButton"),new objj_ivar("jidField"),new objj_ivar("passwordField")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("NewAccountController").super_class},"initWithWindowCibName:","NewAccount");
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("NewAccountController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_5,"window"),"setDefaultButton:",addButton);
objj_msgSend(passwordField,"setSecure:",YES);
objj_msgSend(jidField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(passwordField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(jidField,"becomeFirstResponder");
}
}),new objj_method(sel_getUid("submit:"),function(_7,_8,_9){
with(_7){
objj_msgSend(objj_msgSend(AccountsController,"sharedController"),"addAccountWithJID:andPassword:",objj_msgSend(TNStropheJID,"stropheJIDWithString:",objj_msgSend(jidField,"objectValue")),objj_msgSend(passwordField,"objectValue"));
objj_msgSend(_7,"close");
}
}),new objj_method(sel_getUid("cancel:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_a,"close");
}
})]);
p;33;Controllers/SetStatusController.jt;2270;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;20;AccountsController.ji;19;../Models/Account.jt;2170;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AccountsController.j",YES);
objj_executeFile("../Models/Account.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"SetStatusController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("setButton"),new objj_ivar("showPicker"),new objj_ivar("statusField"),new objj_ivar("account")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAccount:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("SetStatusController").super_class},"initWithWindowCibName:","SetStatus")){
account=_5;
}
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("SetStatusController").super_class},"awakeFromCib");
objj_msgSend(objj_msgSend(_6,"window"),"setDefaultButton:",setButton);
objj_msgSend(statusField,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"grayColor"),"text-color",CPTextFieldStatePlaceholder);
objj_msgSend(showPicker,"removeAllItems");
var _8=objj_msgSend(CPMenuItem,"new"),_9=objj_msgSend(CPMenuItem,"new"),_a=objj_msgSend(CPMenuItem,"new"),_b=objj_msgSend(CPMenuItem,"new");
objj_msgSend(_8,"setTag:",TNStropheContactStatusOnline);
objj_msgSend(_9,"setTag:",TNStropheContactStatusAway);
objj_msgSend(_a,"setTag:",TNStropheContactStatusBusy);
objj_msgSend(_b,"setTag:",TNStropheContactStatusDND);
objj_msgSend(_8,"setTitle:","Online");
objj_msgSend(_9,"setTitle:","Away");
objj_msgSend(_a,"setTitle:","Busy");
objj_msgSend(_b,"setTitle:","Do Not Disturb");
objj_msgSend(showPicker,"addItem:",_8);
objj_msgSend(showPicker,"addItem:",_9);
objj_msgSend(showPicker,"addItem:",_a);
objj_msgSend(showPicker,"addItem:",_b);
objj_msgSend(statusField,"becomeFirstResponder");
}
}),new objj_method(sel_getUid("submit:"),function(_c,_d,_e){
with(_c){
objj_msgSend(account,"setStatus:ofType:",objj_msgSend(statusField,"objectValue"),objj_msgSend(objj_msgSend(showPicker,"selectedItem"),"tag"));
objj_msgSend(_c,"close");
}
}),new objj_method(sel_getUid("cancel:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"close");
}
})]);
p;34;Controllers/XMLConsoleController.jt;2481;@STATIC;1.0;I;27;AppKit/CPWindowController.ji;20;AccountsController.ji;19;../Models/Account.jt;2381;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("AccountsController.j",YES);
objj_executeFile("../Models/Account.j",YES);
var _1=objj_allocateClassPair(CPWindowController,"XMLConsoleController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("scrollView"),new objj_ivar("conversationView"),new objj_ivar("webView"),new objj_ivar("account")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithAccount:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("XMLConsoleController").super_class},"initWithWindowCibName:","XMLConsole")){
account=_5;
}
return _3;
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_6,_7){
with(_6){
objj_msgSendSuper({receiver:_6,super_class:objj_getClass("XMLConsoleController").super_class},"awakeFromCib");
conversationView=objj_msgSend(objj_msgSend(TNMessageBoard,"alloc"),"initWithFrame:",objj_msgSend(scrollView,"bounds"));
objj_msgSend(scrollView,"setDocumentView:",conversationView);
objj_msgSend(CPBox,"boxEnclosingView:",scrollView);
objj_msgSend(account,"connection").xmlInput=function(_8){
if(_8.childNodes.length>0){
objj_msgSend(_6,"addData:inDirection:",_8.childNodes,"incoming");
}
};
objj_msgSend(account,"connection").xmlOutput=function(_9){
if(_9.childNodes.length>0){
objj_msgSend(_6,"addData:inDirection:",_9.childNodes,"outgoing");
}
};
}
}),new objj_method(sel_getUid("addData:inDirection:"),function(_a,_b,_c,_d){
with(_a){
var _e;
if(_d==="incoming"){
_e=objj_msgSend(CPColor,"whiteColor");
}else{
_e=objj_msgSend(CPColor,"grayColor");
}
for(var i=0;i<_c.length;i++){
objj_msgSend(conversationView,"addMessage:from:date:color:",objj_msgSend(objj_msgSend(TNXMLNode,"nodeWithXMLNode:",_c[i]),"description"),nil,objj_msgSend(CPDate,"date"),_e);
}
objj_msgSend(_a,"scrollToBottom");
}
}),new objj_method(sel_getUid("scrollToBottom"),function(_f,_10){
with(_f){
var _11=objj_msgSend(conversationView,"boundsSize").height-objj_msgSend(objj_msgSend(scrollView,"contentView"),"boundsSize").height;
objj_msgSend(objj_msgSend(scrollView,"contentView"),"scrollToPoint:",CGPointMake(0,_11));
objj_msgSend(scrollView,"reflectScrolledClipView:",objj_msgSend(scrollView,"contentView"));
}
}),new objj_method(sel_getUid("removeAllViews:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(conversationView,"removeAllViews:",_14);
}
})]);
p;16;Models/Account.jt;7216;@STATIC;1.0;I;27;AppKit/CPWindowController.jI;37;StropheCappuccino/StropheCappuccino.ji;36;../Controllers/SetStatusController.jt;7082;
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("StropheCappuccino/StropheCappuccino.j",NO);
objj_executeFile("../Controllers/SetStatusController.j",YES);
var _1=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"objectForInfoDictionaryKey:","XMPPBOSHService");
ConnectionStatusConnected="Connected";
ConnectionStatusConnecting="Connecting";
ConnectionStatusDisconnected="Disconnected";
AccountWasCreatedNotification="AccountWasCreatedNotification";
AccountWasAddedNotification="AccountWasAddedNotification";
AccountWasEditedNotification="AccountWasEditedNotification";
AccountWasDeletedNotification="AccountWasDeletedNotification";
AccountConnectionStatusDidChangeNotification="AccountConnectionStatusDidChangeNotification";
var _2=objj_allocateClassPair(TNStropheConnection,"Account"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("roster"),new objj_ivar("enabled"),new objj_ivar("setStatusController"),new objj_ivar("editAccountController"),new objj_ivar("xmlConsoleController")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("roster"),function(_4,_5){
with(_4){
return roster;
}
}),new objj_method(sel_getUid("setRoster:"),function(_6,_7,_8){
with(_6){
roster=_8;
}
}),new objj_method(sel_getUid("isEnabled"),function(_9,_a){
with(_9){
return enabled;
}
}),new objj_method(sel_getUid("setIsEnabled:"),function(_b,_c,_d){
with(_b){
enabled=_d;
}
}),new objj_method(sel_getUid("initWithJID:andPassword:enabled:"),function(_e,_f,_10,_11,_12){
with(_e){
if(_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("Account").super_class},"initWithService:JID:password:",_1,_10,_11)){
enabled=_12;
roster=objj_msgSend(TNStropheRoster,"rosterWithConnection:",_e);
objj_msgSend(_e,"setDelegate:",_e);
objj_msgSend(roster,"setDelegate:",_e);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasCreatedNotification,_e);
}
return _e;
}
}),new objj_method(sel_getUid("description"),function(_13,_14){
with(_13){
return objj_msgSend(objj_msgSend(_13,"JID"),"full");
}
}),new objj_method(sel_getUid("onStropheConnecting:"),function(_15,_16,_17){
with(_15){
CPLog.debug("XMPP: Connecting");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_15);
}
}),new objj_method(sel_getUid("onStropheAuthenticating:"),function(_18,_19,_1a){
with(_18){
CPLog.debug("XMPP: Authenticating");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_18);
}
}),new objj_method(sel_getUid("onStropheAuthFail:"),function(_1b,_1c,_1d){
with(_1b){
CPLog.warn("XMPP: Authentication Failed");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_1b);
}
}),new objj_method(sel_getUid("onStropheConnected:"),function(_1e,_1f,_20){
with(_1e){
CPLog.info("XMPP: Connected");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1e,TNStropheConnectionStatusDisconnected,nil);
objj_msgSend(roster,"getRoster");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_1e);
}
}),new objj_method(sel_getUid("onStropheConnectFail:"),function(_21,_22,_23){
with(_21){
CPLog.warn("XMPP: Connection Failed");
objj_msgSend(roster,"clear");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_21);
}
}),new objj_method(sel_getUid("onStropheDisconnecting:"),function(_24,_25,_26){
with(_24){
CPLog.debug("XMPP: Disconnecting");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_24);
}
}),new objj_method(sel_getUid("onStropheDisconnected:"),function(_27,_28,_29){
with(_27){
CPLog.debug("XMPP: Disconnected");
objj_msgSend(roster,"clear");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_27);
}
}),new objj_method(sel_getUid("onStropheError:"),function(_2a,_2b,_2c){
with(_2a){
CPLog.error("XMPP: Error");
objj_msgSend(roster,"clear");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountConnectionStatusDidChangeNotification,_2a);
}
}),new objj_method(sel_getUid("connectionStatus"),function(_2d,_2e){
with(_2d){
if(objj_msgSend(_2d,"isConnected")){
return ConnectionStatusConnected;
}
return ConnectionStatusDisconnected;
}
}),new objj_method(sel_getUid("enable"),function(_2f,_30){
with(_2f){
enabled=YES;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasEditedNotification,_2f);
objj_msgSend(_2f,"connect");
}
}),new objj_method(sel_getUid("disable"),function(_31,_32){
with(_31){
objj_msgSend(_31,"disconnect");
enabled=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasEditedNotification,_31);
}
}),new objj_method(sel_getUid("editAccountController"),function(_33,_34){
with(_33){
if(!editAccountController){
editAccountController=objj_msgSend(objj_msgSend(EditAccountController,"alloc"),"initWithAccount:",_33);
}
return editAccountController;
}
}),new objj_method(sel_getUid("editWithJID:andPassword:changeRegistration:"),function(_35,_36,_37,_38,_39){
with(_35){
objj_msgSend(_35,"disconnect");
objj_msgSend(_35,"setJID:",_37);
objj_msgSend(_35,"setPassword:",_38);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",AccountWasEditedNotification,_35);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_35,sel_getUid("connect"),TNStropheConnectionStatusDisconnected,nil);
}
}),new objj_method(sel_getUid("setStatusController"),function(_3a,_3b){
with(_3a){
if(!setStatusController){
setStatusController=objj_msgSend(objj_msgSend(SetStatusController,"alloc"),"initWithAccount:",_3a);
}
return setStatusController;
}
}),new objj_method(sel_getUid("setStatus:ofType:"),function(_3c,_3d,_3e,_3f){
with(_3c){
var _40=objj_msgSend(TNStropheStanza,"presence");
objj_msgSend(_40,"addChildWithName:","show");
objj_msgSend(_40,"addTextNode:",_3f);
objj_msgSend(_40,"up");
objj_msgSend(_40,"up");
objj_msgSend(_40,"addChildWithName:","status");
objj_msgSend(_40,"addTextNode:",_3e);
objj_msgSend(_3c,"send:",_40);
}
}),new objj_method(sel_getUid("xmlConsoleController"),function(_41,_42){
with(_41){
if(!xmlConsoleController){
xmlConsoleController=objj_msgSend(objj_msgSend(XMLConsoleController,"alloc"),"initWithAccount:",_41);
}
return xmlConsoleController;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("accountWithJID:andPassword:enabled:"),function(_43,_44,_45,_46,_47){
with(_43){
return objj_msgSend(objj_msgSend(Account,"alloc"),"initWithJID:andPassword:enabled:",_45,_46,_47);
}
})]);
p;19;Views/ContactView.jt;3886;@STATIC;1.0;I;15;AppKit/CPView.jt;3847;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"ContactView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("statusIcon"),new objj_ivar("nickname"),new objj_ivar("status"),new objj_ivar("avatar")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("statusIcon"),function(_3,_4){
with(_3){
return statusIcon;
}
}),new objj_method(sel_getUid("setStatusIcon:"),function(_5,_6,_7){
with(_5){
statusIcon=_7;
}
}),new objj_method(sel_getUid("nickname"),function(_8,_9){
with(_8){
return nickname;
}
}),new objj_method(sel_getUid("setNickname:"),function(_a,_b,_c){
with(_a){
nickname=_c;
}
}),new objj_method(sel_getUid("status"),function(_d,_e){
with(_d){
return status;
}
}),new objj_method(sel_getUid("setStatus:"),function(_f,_10,_11){
with(_f){
status=_11;
}
}),new objj_method(sel_getUid("avatar"),function(_12,_13){
with(_12){
return avatar;
}
}),new objj_method(sel_getUid("setAvatar:"),function(_14,_15,_16){
with(_14){
avatar=_16;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_17,_18,_19){
with(_17){
objj_msgSend(nickname,"setObjectValue:",objj_msgSend(_19,"nickname"));
var _1a=objj_msgSend(nickname,"boundsSize");
objj_msgSend(nickname,"sizeToFit");
objj_msgSend(_17,"setFrameSize:",CGSizeMake(objj_msgSend(_17,"boundsSize").x+objj_msgSend(nickname,"bounds").x-_1a.x,objj_msgSend(_17,"boundsSize").y));
var s="";
if(objj_msgSend(_19,"XMPPStatus")){
s+=objj_msgSend(_19,"XMPPStatus");
}
if(objj_msgSend(_19,"numberOfEvents")>0){
s+=" ("+objj_msgSend(_19,"numberOfEvents")+")";
}
objj_msgSend(status,"setObjectValue:",s);
objj_msgSend(status,"sizeToFit");
objj_msgSend(statusIcon,"setImage:",objj_msgSend(_19,"statusIcon"));
objj_msgSend(avatar,"setImage:",objj_msgSend(_19,"avatar"));
}
}),new objj_method(sel_getUid("setThemeState:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(nickname,"setThemeState:",_1d);
objj_msgSend(status,"setThemeState:",_1d);
return objj_msgSendSuper({receiver:_1b,super_class:objj_getClass("ContactView").super_class},"setThemeState:",_1d);
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(nickname,"unsetThemeState:",_20);
objj_msgSend(status,"unsetThemeState:",_20);
return objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("ContactView").super_class},"unsetThemeState:",_20);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_21,_22,_23){
with(_21){
_21=objj_msgSendSuper({receiver:_21,super_class:objj_getClass("ContactView").super_class},"initWithCoder:",_23);
if(_21){
nickname=objj_msgSend(_23,"decodeObjectForKey:","nickname");
statusIcon=objj_msgSend(_23,"decodeObjectForKey:","statusIcon");
avatar=objj_msgSend(_23,"decodeObjectForKey:","avatar");
status=objj_msgSend(_23,"decodeObjectForKey:","status");
objj_msgSend(nickname,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"whiteColor"),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(status,"setValue:forThemeAttribute:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",51/255,51/255,51/255,1),"text-color");
objj_msgSend(status,"setValue:forThemeAttribute:inState:",objj_msgSend(CPColor,"whiteColor"),"text-color",CPThemeStateSelectedDataView);
objj_msgSend(status,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(status,"setValue:forThemeAttribute:",objj_msgSend(CPFont,"systemFontOfSize:",11),"font");
}
return _21;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_24,_25,_26){
with(_24){
objj_msgSendSuper({receiver:_24,super_class:objj_getClass("ContactView").super_class},"encodeWithCoder:",_26);
objj_msgSend(_26,"encodeObject:forKey:",nickname,"nickname");
objj_msgSend(_26,"encodeObject:forKey:",statusIcon,"statusIcon");
objj_msgSend(_26,"encodeObject:forKey:",avatar,"avatar");
objj_msgSend(_26,"encodeObject:forKey:",status,"status");
}
})]);
e;