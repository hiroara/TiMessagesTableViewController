/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "ComArihiroMessagestableViewProxy.h"
#import "ComArihiroMessagestableView.h"
#import "TiUtils.h"
#import "NSString+JSMessagesView.h"
#import "TiMessagesTableViewController.h"

@implementation ComArihiroMessagestableViewProxy

- (TiMessagesTableViewController *)controller
{
    return [(ComArihiroMessagestableView *)[self view] controller];
}

- (void)sendMessage:(id)args
{
    ENSURE_UI_THREAD(sendMessage, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);

    NSString *text;
    NSString *sender;
    NSDate *date = [args objectForKey:@"date"];
    NSString *statusStr = [args objectForKey:@"status"];

    ENSURE_ARG_FOR_KEY(text, args, @"text", NSString);
    ENSURE_ARG_FOR_KEY(sender, args, @"sender", NSString);

    if ([args objectForKey:@"date"] == nil) {
        date = [NSDate date];
    }
    NSLog(@"date is %@", date);

    MSG_STATUS_ENUM status = nil;
    if (statusStr == nil) {
        status = MSG_PENDING;
    } else if ([statusStr isEqualToString:@"success"]) {
        status = MSG_SUCCESS;
    } else if ([statusStr isEqualToString:@"failed"]) {
        status = MSG_FAILED;
    } else {
        status = MSG_PENDING;
    }

    [[self controller] addMessage:text sender:sender date:date status:status];
}
- (void)removeMessage:(id)messageId
{
    ENSURE_UI_THREAD(removeMessage, messageId);
    ENSURE_SINGLE_ARG(messageId, NSNumber);

    [[self controller] removeMessageWithMessageID:[messageId unsignedIntegerValue]];
}

-(void)windowWillOpen
{
    [[self controller] viewWillAppear:NO];
    [super windowWillOpen];
}

- (void)success:(id)index
{
    ENSURE_UI_THREAD(success, index);
    ENSURE_SINGLE_ARG(index, NSNumber);

    [[self controller] succeedInSendingMessageWithMessageID:[index unsignedIntegerValue]];
}
- (void)failure:(id)index
{
    ENSURE_UI_THREAD(failure, index);
    ENSURE_SINGLE_ARG(index, NSNumber);
    
    [[self controller] failInSendingMessageWithMessageID:[index unsignedIntegerValue]];
}

- (void)hideInput:(id)args
{
    ENSURE_UI_THREAD(hideInput, args);
    [[self controller] hideMessageInputView];
}
- (void)showInput:(id)args
{
    ENSURE_UI_THREAD(showInput, args);
    [[self controller] showMessageInputView];
}

- (void)blur:(id)args
{
    ENSURE_UI_THREAD(blur, args);
    [[self controller] resignFirstResponder];
}

@end
