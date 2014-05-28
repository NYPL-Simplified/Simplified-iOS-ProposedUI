#import "NYPLCategoryViewController.h"
#import "NYPLLaneCell.h"
#import "NYPLLibraryListsViewController.h"
#import "NYPLLibrarySearchViewController.h"
#import "NYPLStarredViewController.h"

#import "NYPLCategoriesViewController.h"

@interface NYPLCategoriesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation NYPLCategoriesViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"All Books";
  
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
  
  UIBarButtonItem *listItem = [[UIBarButtonItem alloc]
                               initWithTitle:@"Lists"
                               style:UIBarButtonItemStylePlain
                               target:self
                               action:@selector(didSelectLists)];
  
  self.navigationItem.leftBarButtonItem = listItem;
  
  CGRect frame = self.view.frame;
  frame.origin.y = self.navigationController.navigationBar.frame.size.height;
  frame.size.height -= frame.origin.y;
  self.tableView = [[UITableView alloc] initWithFrame:frame];
  self.tableView.sectionHeaderHeight = 20;
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  return self;
}

- (void)didSelectLists
{
  [self.navigationController pushViewController:[[NYPLLibraryListsViewController alloc] init]
                                       animated:YES];
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

- (void)didSelectMore
{
  [self.navigationController pushViewController:[[NYPLCategoryViewController alloc] init]
                                       animated:YES];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [[NYPLLaneCell alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 16;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return @"Category";
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return 1;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 104;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  [self.navigationController pushViewController:[[NYPLCategoryViewController alloc] init]
                                       animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 24)];
  view.backgroundColor = [UIColor colorWithWhite:0.967 alpha:1.0];
  
  UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  moreButton.frame = CGRectMake(8, 0, 150, 20);
  moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
  [moreButton setTitle:@"Category" forState:UIControlStateNormal];
  [moreButton addTarget:self
                 action:@selector(didSelectMore)
       forControlEvents:UIControlEventTouchUpInside];
  [view addSubview:moreButton];
  
  return view;
}

@end
