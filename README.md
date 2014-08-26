TiMessageTableViewController
============================

This is a wrapper module for [MessagesTableViewController](https://github.com/jessesquires/MessagesTableViewController) on Titanium Mobile.

GET STARTED
------------

REGISTER THIS MODULE
---------------------

Register this module with your application by editing `tiapp.xml` and adding this module.
Example:

```
<modules>
  <module version="0.0.9" platform="iphone">com.arihiro.messagestable</module>
</modules>
```

When you run your project, the compiler will know automatically compile in your module
dependencies and copy appropriate image assets into the application.

USING THIS MODULE IN CODE
-------------------------

To use this module in code, you will need to require it.

For example,

```
var TiMessagesTableViewController = require('com.arihiro.messagestable');

// create view with options
var view = TiMessagesTableViewController.createView({
  height: 480, width: 320, backgroundColor: '#DDD',
  placeHolder: 'Please input message!', sender: 'ari_hiro',
  incomingBackgroundColor: '#88E', outgoingBackgroundColor: '#E88', failedBackgroundColor: '#E66',
  incomingColor: '#115', outgoingColor: '#511',
  senderColor: '#333', timestampColor: '#666',
  senderFontSize: 12, timestampFontSize: 9,
  failedAlert: 'Failed to send message!!',
  sendButtonText: 'Send!!'
});

// send message
view.sendMessage({text: 'Ho-ge Ho-ge', sender: 'hiro_ari', date: new Date()});

// blur and focus
view.blur();
view.focus();

// get/set text
view.text = 'MESSAGE! YEAH!';
console.log(view.text);
```

HANDLE EVENTS
-------------

```
view.addEventListener('opened', function(e) { console.log(e); }); // view is opened
view.addEventListener('closed', function(e) { console.log(e); }); // view is closed
view.addEventListener('showinput', function(e) { console.log(e); }); // message input view is hidden
view.addEventListener('hideinput', function(e) { console.log(e); }); // message input view is shown
view.addEventListener('send', function(e) { console.log(e); }); // send a message
view.addEventListener('click', function(e) { console.log(e); }); // click list of messages view
```

BUILD PROCEDURE
---------------

```
$ pod install
$ open TiMessagesTableViewController.xcworkspace

# Run "Pods" project using Release configuration on Xcode and create ./Build/Products/Release-iphonesimulator/libPods.a

$ ./build.py # create module zip file
```

Cheers!
