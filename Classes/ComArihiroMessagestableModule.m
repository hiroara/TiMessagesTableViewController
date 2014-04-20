/**
 * TiMessagestableViewController
 *
 * Copyright (c) 2014 by Hiroki Arai.
 * and licensed under the MIT License
 */
#import "ComArihiroMessagestableModule.h"
#import "ComArihiroMessagestableViewProxy.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiBubbleImagesViewFactory.h"

@implementation ComArihiroMessagestableModule

static ComArihiroMessagestableModule *_shared;

#pragma mark Class accessor

+(ComArihiroMessagestableModule *)getShared
{
    return _shared;
}

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
  return @"1797cf60-0a95-490c-8879-061bf1ee1b8f";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
  return @"com.arihiro.messagestable";
}

#pragma mark Lifecycle

-(void)startup
{
  // this method is called when the module is first loaded
  // you *must* call the superclass
  [super startup];
  _shared = self;

  NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
  // this method is called when the module is being unloaded
  // typically this is during shutdown. make sure you don't do too
  // much processing here or the app will be quit forceably

  // you *must* call the superclass
  [super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
  // optionally release any resources that can be dynamically
  // reloaded once memory is available - such as caches
  [super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
  if (count == 1 && [type isEqualToString:@"my_event"])
  {
    // the first (of potentially many) listener is being added
    // for event named 'my_event'
  }
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
  if (count == 0 && [type isEqualToString:@"my_event"])
  {
    // the last listener called for event named 'my_event' has
    // been removed, we can optionally clean up any resources
    // since no body is listening at this point for that event
  }
}

#pragma Public APIs


- (UIImage *)getAssetImage:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"modules/%@/%@",[self moduleId], imageName];
    return [TiUtils image:path proxy:self];
}

@end
