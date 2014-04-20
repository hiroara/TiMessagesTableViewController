//
//  TiMessagesTableViewController.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/13.
//
//

#import <UIKit/UIKit.h>
#import "JSMessagesViewController.h"
@class ComArihiroMessagestableModule;

@interface TiMessagesTableViewController : JSMessagesViewController<JSMessagesViewDelegate, JSMessagesViewDataSource>

@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) UIColor *incomingColor;
@property (nonatomic, strong) UIColor *incomingBubbleColor;
@property (nonatomic, strong) UIColor *outgoingColor;
@property (nonatomic, strong) UIColor *outgoingBubbleColor;
@property (nonatomic, strong) UIColor *senderColor;
@property (nonatomic, strong) UIColor *timestampColor;

@end
