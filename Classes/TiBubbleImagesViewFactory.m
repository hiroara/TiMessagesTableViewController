//
//  TiBubbleImagesViewFactory.m
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/19.
//
//

#import "TiBubbleImagesViewFactory.h"
#import "ComArihiroMessagestableModule.h"
#import "TiUtils.h"
#import "UIImage+JSMessagesView.h"
#import "UIColor+JSMessagesView.h"

@implementation TiBubbleImagesViewFactory


static NSDictionary *bubbleImageDictionary;

+ (UIImageView *)bubbleImageViewForType:(JSBubbleMessageType)type
                                  color:(UIColor *)color
{
    UIImage *bubble = [[ComArihiroMessagestableModule getShared] getAssetImage:@"bubble-min.png"];
    
    UIImage *normalBubble = [bubble js_imageMaskWithColor:color];
    UIImage *highlightedBubble = [bubble js_imageMaskWithColor:[color js_darkenColorWithValue:0.12f]];
    
    if (type == JSBubbleMessageTypeIncoming) {
        normalBubble = [normalBubble js_imageFlippedHorizontal];
        highlightedBubble = [highlightedBubble js_imageFlippedHorizontal];
    }
    
    // make image stretchable from center point
    CGPoint center = CGPointMake(bubble.size.width / 2.0f, bubble.size.height / 2.0f);
    UIEdgeInsets capInsets = UIEdgeInsetsMake(center.y, center.x, center.y, center.x);
    
    return [[UIImageView alloc] initWithImage:[normalBubble js_stretchableImageWithCapInsets:capInsets]
                             highlightedImage:[highlightedBubble js_stretchableImageWithCapInsets:capInsets]];
}

@end
