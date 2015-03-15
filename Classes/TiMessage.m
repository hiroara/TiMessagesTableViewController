//
//  TiMessage.m
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/27.
//
//

#import "TiMessage.h"

@implementation TiMessage

@synthesize status = _status;
@synthesize messageId = _messageId;
@synthesize subview = _subview;
@synthesize cell = _cell;

static unsigned int currentMessageId = 1000;

- (int) generateMessageID{
    int newId;
    @synchronized (self) {
        newId = currentMessageId++;
    }
    return newId;
}

- (instancetype)initWithText:(NSString *)text sender:(NSString *)sender date:(NSDate *)date status:(MSG_STATUS_ENUM)status subview:(TiViewProxy *)subview
{
    self = [self initWithText:text sender:sender date:date];
    _status = status;
    _subview = subview;
    return self;
}
- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
{
    self = [super initWithText:text sender:sender date:date];
    _messageId = [self generateMessageID];
    _status = MSG_PENDING;
    return self;
}

- (NSMutableDictionary *)eventObject;
{
    NSString *statusText = nil;
    switch (_status) {
        case MSG_PENDING:
            statusText = @"pending";
            break;
        case MSG_SUCCESS:
            statusText = @"success";
            break;
        case MSG_FAILED:
            statusText = @"failed";
            break;
    }
    NSMutableDictionary *eventObj = [NSMutableDictionary dictionaryWithCapacity:5];
    [eventObj setValue:[NSNumber numberWithInteger:_messageId] forKey:@"messageId"];
    [eventObj setValue:self.text forKey:@"text"];
    [eventObj setValue:self.sender forKey:@"sender"];
    [eventObj setValue:self.date forKey:@"date"];
    [eventObj setValue:statusText forKey:@"status"];
    return eventObj;
}

@end
