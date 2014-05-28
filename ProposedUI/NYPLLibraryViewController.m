#import "NYPLCategoriesViewController.h"

#import "NYPLLibraryViewController.h"

@implementation NYPLLibraryViewController

- (id)init
{
  self = [super initWithRootViewController:[[NYPLCategoriesViewController alloc] init]];
  if(!self) return nil;
  
  self.title = @"All Books";
  
  return self;
}

@end
