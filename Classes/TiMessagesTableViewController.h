//
//  TiMessagesTableViewController.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/13.
//
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"
#import "TiMessage.h"

@class ComArihiroMessagestableViewProxy;

@interface TiMessagesTableViewController : JSMessagesViewController<JSMessagesViewDelegate, JSMessagesViewDataSource>

@property (nonatomic, weak) ComArihiroMessagestableViewProxy *proxy;

@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) UIColor *incomingColor;
@property (nonatomic, strong) UIColor *incomingBubbleColor;
@property (nonatomic, strong) UIColor *outgoingColor;
@property (nonatomic, strong) UIColor *outgoingBubbleColor;
@property (nonatomic, strong) UIColor *failedBubbleColor;
@property (nonatomic, strong) UIColor *senderColor;
@property (nonatomic, strong) UIFont *senderFont;
@property (nonatomic, strong) UIColor *timestampColor;
@property (nonatomic, strong) UIFont *timestampFont;
@property (nonatomic, strong) NSString *failedAlert;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

- (void)addMessage:(TiMessage *)message;
- (NSUInteger)removeMessageWithMessageID:(NSUInteger)index;
- (BOOL)succeedInSendingMessageWithMessageID:(NSInteger)messageId;
- (BOOL)failInSendingMessageWithMessageID:(NSInteger)messageId;
- (BOOL)hideMessageInputView;
- (BOOL)showMessageInputView;
- (void)setSendButtonTitle:(NSString *)title;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;

@end
