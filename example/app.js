// open a single window
var win = Ti.UI.createWindow({
  backgroundColor:'white'
});

var TiMessagesTableViewController = require('com.arihiro.messagestable');
Ti.API.info("module is => " + TiMessagesTableViewController);

// create view with options
var view = TiMessagesTableViewController.createView({
  height: 480, width: 320, backgroundColor: '#DDD',
  placeHolder: 'Please input message!', sender: 'ari_hiro',
  incomingBackgroundColor: '#88E', outgoingBackgroundColor: '#E88', failedBackgroundColor: '#E66',
  incomingColor: '#115', outgoingColor: '#511',
  senderColor: '#222', timestampColor: '#555'
});
view.addEventListener('opened', function(e) { console.log(e); });
view.addEventListener('closed', function(e) { console.log(e); });
view.addEventListener('showinput', function(e) { console.log(e); });
view.addEventListener('hideinput', function(e) { console.log(e); });
win.add(view);

// get properties
console.log("height => " + view.height);
console.log("width => " + view.width);
console.log("backgroundColor => " + view.backgroundColor);
console.log("placeHolder => " + view.placeHolder);
console.log("sender => " + view.sender);

var count = 0
view.addEventListener('send', function(e) {
  if (count > 4) {
    view.hideInput();
    return
  }
  console.log(e);
  if (count % 2 == 0) {
    console.log("succeed!");
    setTimeout(function(){ view.success(e.index); }, 1000);
  } else {
    console.log("fail!");
    setTimeout(function(){ view.failure(e.index); }, 1000);
  }
  count += 1;
});
view.addEventListener('click', function(e) {
  console.log(e);
  view.showInput();
});

// send message programmatically
view.sendMessage({text: 'Ho-ge Ho-ge', sender: 'hiro_ari', date: new Date()});

win.open();
setTimeout(function(){
  win.close();
  setTimeout(function(){
    view.sendMessage({text: 'Foo Foooo!!!', sender: 'hiro_ari', date: new Date()});
    win.open();
  }, 2000);
}, 2000);
