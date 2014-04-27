//
//  TiMessage.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/27.
//
//

#import "JSMessage.h"

@interface TiMessage : JSMessage

@property(nonatomic, assign) NSInteger status;

enum {
    MSG_SUCCESS,
    MSG_FAILED,
    MSG_PENDING
};

- (NSDictionary *)eventObject;

@end
