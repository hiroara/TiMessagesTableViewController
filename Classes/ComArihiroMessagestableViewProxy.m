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

TiMessagesTableViewController *controller;

- (TiMessagesTableViewController *)controller
{
    if (controller == nil) {
        controller = [(ComArihiroMessagestableView *)[self view] controller];
    }
    return controller;
}

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
    
    NSLog(@"controller: %@", [self controller]);

    [[self controller].delegate didSendText:[text js_stringByTrimingWhitespace]
                                 fromSender:sender
                                     onDate:date];

}

@end
