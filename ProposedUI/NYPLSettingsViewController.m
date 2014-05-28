#import "NYPLSettingsViewController.h"

@implementation NYPLSettingsViewController

- (id)init
{
  self = [super initWithRootViewController:[[UIViewController alloc] init]];
  if(!self) return nil;
  
  self.topViewController.title = @"Settings";
  
  self.title = @"Settings";
  
  return self;
}
@end
