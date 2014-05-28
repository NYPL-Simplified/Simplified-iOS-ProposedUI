#import "NYPLWaitListRootViewController.h"

#import "NYPLWaitListViewController.h"

@implementation NYPLWaitListViewController

- (id)init
{
  self = [super initWithRootViewController:[[NYPLWaitListRootViewController alloc] init]];
  if(!self) return nil;
  
  self.title = @"Holds";
  
  return self;
}

@end