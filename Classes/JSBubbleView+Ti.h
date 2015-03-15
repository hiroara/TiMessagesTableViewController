//
//  JSBubbleView+Ti.h
//  TiMessagesTableViewController
//
//  Created by Hiroki Arai on 2015/03/08.
//
//

#import "JSBubbleView.h"
#import "TiUIView.h"

@interface JSBubbleView (Ti)

@property (weak, nonatomic) TiViewProxy *messageSubview;

- (CGSize)neededSizeForSubview;
+ (CGSize)neededSizeForText:(NSString *)text;

@end
