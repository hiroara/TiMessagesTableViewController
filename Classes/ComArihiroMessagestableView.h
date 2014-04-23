/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "TiUIView.h"

@class TiMessagesTableViewController;

@interface ComArihiroMessagestableView : TiUIView
{
}

- (void)initializeState;
- (void)addMessage:(NSString *)text sender:(NSString *)sender date:(NSDate *)date;
- (BOOL)hideMessageInputView;
- (BOOL)showMessageInputView;
- (TiMessagesTableViewController *)controller;

@end
