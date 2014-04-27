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

@end
