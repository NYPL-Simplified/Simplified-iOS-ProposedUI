#import "NYPLShelfSearchViewController.h"

@interface NYPLShelfSearchViewController () <UISearchBarDelegate>

@property (nonatomic, retain) UISearchBar *searchBar;

@end

@implementation NYPLShelfSearchViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.searchBar = [[UISearchBar alloc] init];
  self.searchBar.delegate = self;
  self.searchBar.placeholder = @"Search my books";
  
  self.navigationItem.titleView = self.searchBar;
  
  [self.searchBar becomeFirstResponder];
  
  return self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
  [self.searchBar resignFirstResponder];
}

#pragma mark UIViewController

- (void)viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [self.searchBar resignFirstResponder];
  [super viewWillDisappear:animated];
}

@end
