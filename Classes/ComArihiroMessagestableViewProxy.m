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

- (void)sendMessage:(id)args
{
    ENSURE_UI_THREAD(sendMessage, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    NSString *text;
    NSString *sender;
    NSDate *date;

    ENSURE_ARG_FOR_KEY(text, args, @"text", NSString);
    ENSURE_ARG_FOR_KEY(sender, args, @"sender", NSString);
    ENSURE_ARG_FOR_KEY(date, args, @"date", NSDate);
    
    [(ComArihiroMessagestableView *)[self view] addMessage:text sender:sender date:date];
}

- (BOOL)hideInput:(id)args
{
    ENSURE_UI_THREAD(hideInput, args);
    [(ComArihiroMessagestableView *)[self view] hideMessageInputView];
}
- (BOOL)showInput:(id)args
{
    ENSURE_UI_THREAD(showInput, args);
    [(ComArihiroMessagestableView *)[self view] showMessageInputView];
}


@end
