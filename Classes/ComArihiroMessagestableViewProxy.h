/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "TiUIViewProxy.h"

@interface ComArihiroMessagestableViewProxy : TiUIViewProxy
{
}

- (void)sendMessage:(id)args;
- (BOOL)hideInput:(id)args;
- (BOOL)showInput:(id)args;

@end
