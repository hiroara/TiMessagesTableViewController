//
//  TiMessage.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/27.
//
//

#import "JSMessage.h"

typedef enum : NSInteger {
    MSG_SUCCESS,
    MSG_FAILED,
    MSG_PENDING
} MSG_STATUS_ENUM;

@interface TiMessage : JSMessage

@property(nonatomic, assign) NSInteger status;
@property(nonatomic, assign) NSInteger messageId;

- (instancetype)initWithText:(NSString *)text sender:(NSString *)sender date:(NSDate *)date status:(MSG_STATUS_ENUM)status;
- (NSMutableDictionary *)eventObject;

@end
