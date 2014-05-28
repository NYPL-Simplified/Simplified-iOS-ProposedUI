#import "NYPLLibrarySearchViewController.h"
#import "NYPLStarredViewController.h"

#import "NYPLLibraryListsViewController.h"

@implementation NYPLLibraryListsViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Lists";
  
  UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]
                                 initWithImage:[UIImage imageNamed:@"Search"]
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(didSelectSearch)];
  
  UIBarButtonItem *starItem = [[UIBarButtonItem alloc]
                               initWithImage:[UIImage imageNamed:@"Star"]
                               style:UIBarButtonItemStylePlain
                               target:self
                               action:@selector(didSelectStarred)];
  
  self.navigationItem.rightBarButtonItems = @[searchItem, starItem];
  
  return self;
}

- (void)didSelectSearch
{
  [self.navigationController
   pushViewController:[[NYPLLibrarySearchViewController alloc]
                       initWithPlaceholder:@"Search all books"]
   animated:YES];
}

- (void)didSelectStarred
{
  [self.navigationController pushViewController:[[NYPLStarredViewController alloc] init]
                                       animated:YES];
}

#pragma mark UIViewController

- (void)viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
