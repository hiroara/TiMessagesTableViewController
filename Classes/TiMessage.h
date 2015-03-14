//
//  TiMessage.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/27.
//
//

#import "JSMessage.h"
#import "JSBubbleMessageCell.h"
#import "TiViewProxy.h"

typedef enum : NSInteger {
    MSG_SUCCESS,
    MSG_FAILED,
    MSG_PENDING
} MSG_STATUS_ENUM;

@interface TiMessage : JSMessage

@property(nonatomic, assign) NSInteger status;
@property(nonatomic, assign) NSInteger messageId;
@property(nonatomic, strong) TiViewProxy *subview;
@property(nonatomic, weak) JSBubbleMessageCell *cell;

- (instancetype)initWithText:(NSString *)text sender:(NSString *)sender date:(NSDate *)date status:(MSG_STATUS_ENUM)status subview:(TiViewProxy *)subview;

- (NSMutableDictionary *)eventObject;

@end
