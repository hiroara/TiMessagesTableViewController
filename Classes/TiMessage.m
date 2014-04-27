//
//  TiMessage.m
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/27.
//
//

#import "TiMessage.h"

@implementation TiMessage

@synthesize status;

- (instancetype)initWithText:(NSString *)text
                      sender:(NSString *)sender
                        date:(NSDate *)date
{
    self = [super initWithText:text sender:sender date:date];
    status = MSG_PENDING;
    return self;
}

- (NSMutableDictionary *)eventObject;
{
    NSString *statusText = nil;
    switch (status) {
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
    NSMutableDictionary *eventObj = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                              self.text, @"text",
                              self.sender, @"sender",
                              self.date, @"date",
                              statusText, @"status",
                              nil];
    return eventObj;
}

@end
