//
//  JSBubbleView+Ti.m
//  TiMessagesTableViewController
//
//  Created by Hiroki Arai on 2015/03/08.
//
//

#import "JSBubbleView+Ti.h"
#import <JSMessagesViewController/NSString+JSMessagesView.h>
#import "TiViewProxy.h"
#import "LayoutConstraint.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define kMarginTop 8.0f
#define kMarginBottom 4.0f
#define kPaddingTop 8.0f
#define kPaddingBottom 8.0f
#define kSubviewPaddingRight 20.0f

#define kHorizontalMarginOfSubview 8.0f

@implementation JSBubbleView (Ti)

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bubbleImageView.frame = [self bubbleFrame];
    
    CGFloat textX = self.bubbleImageView.frame.origin.x;
    
    if (self.type == JSBubbleMessageTypeIncoming) {
        textX += (self.bubbleImageView.image.capInsets.left / 2.0f);
    }
    
    CGRect textFrame = CGRectMake(textX,
                                  self.bubbleImageView.frame.origin.y,
                                  self.bubbleImageView.frame.size.width - (self.bubbleImageView.image.capInsets.right / 2.0f),
                                  self.bubbleImageView.frame.size.height - kMarginTop);

    self.textView.frame = CGRectIntegral(textFrame);

    [self adjustSubviewFromWithTextFrame:textFrame];
}



- (CGRect)bubbleFrame
{
    CGSize bubbleSize = [self neededSize];
    
    return CGRectIntegral(CGRectMake((self.type == JSBubbleMessageTypeOutgoing ? self.frame.size.width - bubbleSize.width : 0.0f),
                                     kMarginTop,
                                     bubbleSize.width,
                                     bubbleSize.height + kMarginTop));
}

- (CGSize) neededSize
{
    CGSize size = [JSBubbleView neededSizeForText:self.textView.text];
    CGSize sizeForSubview = [self neededSizeForSubview];
    CGFloat width = size.width < sizeForSubview.width ? sizeForSubview.width : size.width;
    CGFloat height = sizeForSubview.height;
    if (self.textView.text != nil && [[self.textView.text js_stringByTrimingWhitespace] length] > 0) {
        height += size.height;
    } else {
        height += kPaddingTop;
    }
    return CGSizeMake(width, height);
}

- (CGSize) neededSizeForSubview
{
    if (self.messageSubview == nil) {
        return CGSizeMake(0, 0);
    }
    CGRect frame = self.messageSubview.view.frame;
    CGFloat width = frame.size.width + kSubviewPaddingRight;
    CGFloat height = frame.size.height;
    if ([self.messageSubview valueForKey:@"left"] != nil) {
        width += ((NSNumber *)[self.messageSubview valueForKey:@"left"]).floatValue;
    }
    if ([self.messageSubview valueForKey:@"right"] != nil) {
        width += ((NSNumber *)[self.messageSubview valueForKey:@"right"]).floatValue;
    }
    if ([self.messageSubview valueForKey:@"top"] != nil) {
        height += ((NSNumber *)[self.messageSubview valueForKey:@"top"]).floatValue;
    }
    if ([self.messageSubview valueForKey:@"bottom"] != nil) {
        height += ((NSNumber *)[self.messageSubview valueForKey:@"bottom"]).floatValue;
    }
    return CGSizeMake(width, height);
}

- (void)setMessageSubview:(TiViewProxy *)messageSubview
{
    if (self.messageSubview != nil) {
        [self.messageSubview.view removeFromSuperview];
    }
    if (messageSubview != nil) {
        if ([messageSubview valueForKey:@"left"] == nil && [messageSubview valueForKey:@"right"] == nil) {
            [messageSubview setValue:[NSNumber numberWithFloat:0] forKey:@"left"];
        }
        if ([messageSubview valueForKey:@"top"] == nil && [messageSubview valueForKey:@"bottom"] == nil) {
            [messageSubview setValue:[NSNumber numberWithFloat:0] forKey:@"top"];
        }
        
        if ([messageSubview valueForKey:@"originalFrame"] == nil) {
            [messageSubview setValue:[NSValue valueWithCGRect:messageSubview.view.frame] forKey:@"originalFrame"];
        }

        [self addSubview:messageSubview.view];
    }

    objc_setAssociatedObject(self, @selector(messageSubview), messageSubview, OBJC_ASSOCIATION_ASSIGN);
}
- (TiViewProxy *)messageSubview
{
    return objc_getAssociatedObject(self, @selector(messageSubview));
}


- (void)adjustSubviewFromWithTextFrame: (CGRect)textFrame
{
    if (self.messageSubview == nil) {
        return;
    }

    CGSize subviewSize = [self neededSizeForSubview];
    
    CGFloat originX = textFrame.origin.x;
    if ([self.messageSubview valueForKey:@"left"] == nil && [self.messageSubview valueForKey:@"right"] != nil) {
        originX += textFrame.size.width;
    }
    CGFloat originY = textFrame.origin.y;
    if ([self.messageSubview valueForKey:@"top"] == nil && [self.messageSubview valueForKey:@"bottom"] != nil) {
        originY += textFrame.size.height;
    }
    
    CGRect originalFrame = ((NSValue *)[self.messageSubview valueForKey:@"originalFrame"]).CGRectValue;
    self.messageSubview.view.frame = CGRectMake(originalFrame.origin.x + originX,
                                                originY + textFrame.size.height + originalFrame.origin.y - subviewSize.height,
                                                originalFrame.size.width, originalFrame.size.height);
    
    if ([self.messageSubview view].superview == nil) {
        [self addSubview:self.messageSubview.view];
    }
}


@end
