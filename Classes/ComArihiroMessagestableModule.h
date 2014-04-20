/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "TiModule.h"

@interface ComArihiroMessagestableModule : TiModule
{
}

+ (ComArihiroMessagestableModule *)getShared;

- (UIImage *)getAssetImage:(NSString *)imageName;

@end
