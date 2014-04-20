//
//  TiBubbleImagesViewFactory.h
//  TiMessagesTableViewController
//
//  Created by Arai Hiroki on 2014/04/19.
//
//

#import <UIKit/UIKit.h>
#import "JSBubbleImageViewFactory.h"

@class ComArihiroMessagestableModule;

@interface TiBubbleImagesViewFactory : NSObject

+ (UIImageView *)bubbleImageViewForType:(JSBubbleMessageType *)type color:(UIColor *)color;

@end
