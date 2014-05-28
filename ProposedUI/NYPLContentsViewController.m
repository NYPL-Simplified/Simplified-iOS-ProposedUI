#import "NYPLContentsViewController.h"

@implementation NYPLContentsViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Lorem Ipsum: Volume 1";
  
  UISegmentedControl *segmentedControl =
    [[UISegmentedControl alloc] initWithItems:@[@"Contents", @"Bookmarks", @"Highlights"]];
  
  segmentedControl.frame = CGRectMake(5, 70, 310, segmentedControl.frame.size.height);
  segmentedControl.selectedSegmentIndex = 0;
  
  [self.view addSubview:segmentedControl];
  
  return self;
}

#pragma mark UIViewController

- (void)viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
