// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
  backgroundColor:'white'
});

// TODO: write your module tests here
var TiMessagesTableViewController = require('com.arihiro.messagestable');
Ti.API.info("module is => " + TiMessagesTableViewController);

var view = TiMessagesTableViewController.createView({
  height: 480, width: 320, backgroundColor: '#ddd',
  placeHolder: 'Please input message!', sender: 'ari_hiro',
  incomingBackgroundColor: '#88E', outgoingBackgroundColor: "#E88",
  incomingColor: '#115', outgoingColor: "#511",
  senderColor: '#222', timestampColor: '#555'
});
win.add(view);
console.log(view.sender);

view.sendMessage({text: 'Ho-ge Ho-ge', sender: 'hiro_ari', date: new Date()});

win.open();
