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
TiMessagesTableViewController *vc;

- (void)initializeState
{
    NSLog(@"HOGEHOGE! view:%@", self.view);
}

- (UIView *)view
{
    if (view == nil) {
        vc = [[TiMessagesTableViewController alloc] init];
        view = vc.view;
        vc.tableView.backgroundColor = [UIColor redColor];

        [self addSubview:view];
        [TiUtils setView:view positionRect:self.bounds];
    }
    return view;
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (view != nil) {
        [TiUtils setView:view positionRect:bounds];
    }
}

- (void)setBackgroundColor_:(id)argColor
{
    if (vc != nil) {
        [vc setBackgroundColor:[[TiUtils colorValue:argColor] _color]];
    }
}

- (void)setPlaceHolder_:(id)argPlaceHolder
{
    if(vc != nil) {
        vc.messageInputView.textView.placeHolder = [TiUtils stringValue:argPlaceHolder];
    }
}

- (void)setSender_:(id)argSender
{
    if(vc != nil) {
        vc.sender = [TiUtils stringValue:argSender];
    }
}

- (void)setIncomingColor_:(id)argColor
{
    if (vc != nil) {
        vc.incomingColor = [[TiUtils colorValue:argColor] _color];
    }
}
- (void)setIncomingBackgroundColor_:(id)argColor
{
    if (vc != nil) {
        vc.incomingBubbleColor = [[TiUtils colorValue:argColor] _color];
    }
}
- (void)setOutgoingColor_:(id)argColor
{
    if (vc != nil) {
        vc.outgoingColor = [[TiUtils colorValue:argColor] _color];
    }
}
- (void)setOutgoingBackgroundColor_:(id)argColor
{
    if (vc != nil) {
        vc.outgoingBubbleColor = [[TiUtils colorValue:argColor] _color];
    }
}
- (void)setSenderColor_:(id)argColor
{
    if (vc != nil) {
        vc.senderColor = [[TiUtils colorValue:argColor] _color];
    }
}
- (void)setTimestampColor_:(id)argColor
{
    if (vc != nil) {
        vc.timestampColor = [[TiUtils colorValue:argColor] _color];
    }
}

- (void)addMessage:(NSString *)text sender:(NSString *)sender date:(NSDate *)date
{
    [vc addMessage:text sender:sender date:date];
}



@end
