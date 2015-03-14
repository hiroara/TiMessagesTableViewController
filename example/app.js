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
  senderColor: '#333', timestampColor: '#666',
  senderFontSize: 12, timestampFontSize: 9,
  timestampFormat: 'MMM dd yyyy HH:mm:ss',
  failedAlert: 'Failed to send message!!',
  sendButtonText: 'Send!!'
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
    setTimeout(function() { view.success(e.messageId); }, 1000);
  } else {
    console.log("fail!");
    setTimeout(function() {
      view.failure(e.messageId);
      view.blur();
      setTimeout(function() {
        view.text = 'FAILED! HAHA!!';
        view.focus();
      }, 1000);
    }, 1000);
  }
  count += 1;
});
view.addEventListener('click', function(e) {
  console.log(e);
  console.log(view.text);
  view.showInput();
  if (e.target == "message") {
    view.removeMessage(e.messageId);
  }
});

// send message programmatically
var msg = view.sendMessage({text: 'Ho-ge Ho-ge', sender: 'hiro_ari'});
console.log(JSON.stringify(msg)); // can get informations of the message

win.open();
setTimeout(function(){
  win.close();
  setTimeout(function(){
    view.sendMessage({text: 'Barrrrrrrr', sender: 'ari_hiro', date: (new Date(new Date().getTime() - 1 * 60 * 60 * 1000)), status: 'success'});
    view.sendMessage({text: 'Foo Foooo!!!', sender: 'hiro_ari'});

    // use subview
    var subview1 = Ti.UI.createImageView({image: 'http://i.giphy.com/dWm5HKuKjZTO.gif', width: 100, height: 100, top: 30, left: 30, bottom: 30, right: 30});
    view.sendMessage({sender: 'hiro_ari', view: subview1});
    var subview2 = Ti.UI.createButton({title: 'Hello!', top: 0, right: 0, width: 100, height: 20, backgroundColor: 'red'});
    view.sendMessage({text: 'Hi! This is my cooool button!', sender: 'ari_hiro', view: subview2});
    win.open();
  }, 2000);
}, 2000);
