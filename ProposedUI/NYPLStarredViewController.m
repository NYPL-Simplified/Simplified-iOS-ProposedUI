#import "NYPLBookCell.h"
#import "NYPLDetailViewController.h"
#import "NYPLLibrarySearchViewController.h"

#import "NYPLStarredViewController.h"

@interface NYPLStarredViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation NYPLStarredViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Starred";

  UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]
                                 initWithImage:[UIImage imageNamed:@"Search"]
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(didSelectSearch)];

  self.navigationItem.rightBarButtonItem = searchItem;
  
  CGRect frame = self.view.frame;
  frame.origin.y = self.navigationController.navigationBar.frame.size.height;
  frame.size.height -= frame.origin.y;
  self.tableView = [[UITableView alloc] initWithFrame:frame];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  return self;
}

- (void)didSelectSearch
{
  [self.navigationController
   pushViewController:[[NYPLLibrarySearchViewController alloc]
                       initWithPlaceholder:@"Search starred books"]
   animated:YES];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [[NYPLBookCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return 8;
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
  [self.navigationController pushViewController:[[NYPLDetailViewController alloc] init]
                                       animated:YES];
}

@end
