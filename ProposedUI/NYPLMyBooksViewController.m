#import "NYPLShelfViewController.h"

#import "NYPLMyBooksViewController.h"

@implementation NYPLMyBooksViewController

- (id)init
{
  self = [super initWithRootViewController:[[NYPLShelfViewController alloc] init]];
  if(!self) return nil;
  
  self.title = @"My Books";
  
  return self;
}

@end
