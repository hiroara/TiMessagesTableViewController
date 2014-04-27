/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "ComArihiroMessagestableView.h"
#import "TiUtils.h"
#import "TiMessagesTableViewController.h"

@implementation ComArihiroMessagestableView

UIView *view;
TiMessagesTableViewController *controller;

- (void)initializeState
{
    [super initializeState];
    NSLog(@"[INFO] initialize %@", [self controller]);
}

- (TiMessagesTableViewController *)controller
{
    if (controller == nil) {
        controller = [[TiMessagesTableViewController alloc] init];
        controller.proxy = (ComArihiroMessagestableViewProxy *)[self proxy];
    }
    if (view == nil) {
        view = controller.view;
        
        [self addSubview:view];
        [TiUtils setView:view positionRect:self.bounds];
    }
    return controller;
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (view != nil) {
        [TiUtils setView:view positionRect:bounds];
    }
}

- (void)willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
    view = nil;
    controller = nil;
}

#pragma mark setter

- (void)setBackgroundColor_:(id)argColor
{
    [[self controller] setBackgroundColor:[[TiUtils colorValue:argColor] _color]];
}

- (void)setPlaceHolder_:(id)argPlaceHolder
{
    [self controller].messageInputView.textView.placeHolder = [TiUtils stringValue:argPlaceHolder];
}

- (void)setSender_:(id)argSender
{
    [self controller].sender = [TiUtils stringValue:argSender];
}

- (void)setIncomingColor_:(id)argColor
{
    [self controller].incomingColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setIncomingBackgroundColor_:(id)argColor
{
    [self controller].incomingBubbleColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setOutgoingColor_:(id)argColor
{
    [self controller].outgoingColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setOutgoingBackgroundColor_:(id)argColor
{
    [self controller].outgoingBubbleColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setFailedBackgroundColor_:(id)argColor
{
    [self controller].failedBubbleColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setSenderColor_:(id)argColor
{
    [self controller].senderColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setSenderFontSize_:(id)argSize
{
    ENSURE_SINGLE_ARG(argSize, NSNumber);
    [self controller].senderFont = [UIFont systemFontOfSize:((NSNumber *)argSize).floatValue];
}
- (void)setTimestampColor_:(id)argColor
{
    [self controller].timestampColor = [[TiUtils colorValue:argColor] _color];
}
- (void)setTimestampFontSize_:(id)argSize
{
    ENSURE_SINGLE_ARG(argSize, NSNumber);
    [self controller].timestampFont = [UIFont systemFontOfSize:((NSNumber *)argSize).floatValue];
}

- (void)setFailedAlert_:(id)alert
{
    ENSURE_SINGLE_ARG(alert, NSString);
    [self controller].failedAlert = (NSString *)alert;
}


@end
