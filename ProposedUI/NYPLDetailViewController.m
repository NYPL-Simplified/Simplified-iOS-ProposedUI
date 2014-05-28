#import "NYPLDetailViewController.h"

@implementation NYPLDetailViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Dolor Sit Amet";
  
  return self;
}

#pragma mark UIViewController

- (void)viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
