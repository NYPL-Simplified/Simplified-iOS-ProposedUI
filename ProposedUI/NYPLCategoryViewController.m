#import "NYPLBookCell.h"
#import "NYPLDetailViewController.h"
#import "NYPLLibrarySearchViewController.h"
#import "NYPLStarredViewController.h"

#import "NYPLCategoryViewController.h"

@interface NYPLCategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIButton *showButton;
@property (nonatomic, retain) UIButton *sortButton;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation NYPLCategoryViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Mystery";
  
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
  
  UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 26)];
  buttonView.backgroundColor = [UIColor colorWithWhite:0.967 alpha:1.0];
  [self.view addSubview:buttonView];
  
  UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + 26, 320, 0.5)];
  lineView.backgroundColor = [UIColor colorWithWhite:0.667 alpha:1.0];
  [self.view addSubview:lineView];
  
  self.showButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.showButton.frame = CGRectMake(6, 0, 154, 26);
  self.showButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
  [self.showButton setTitle:@"Show: All" forState:UIControlStateNormal];
  [self.showButton addTarget:self
                      action:@selector(didSelectShow)
            forControlEvents:UIControlEventTouchUpInside];
  [buttonView addSubview:self.showButton];
  
  self.sortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.sortButton.frame = CGRectMake(160, 0, 154, 26);
  self.sortButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
  [self.sortButton setTitle:@"Sort by: Popularity" forState:UIControlStateNormal];
  [self.sortButton addTarget:self
                      action:@selector(didSelectSort)
            forControlEvents:UIControlEventTouchUpInside];
  [buttonView addSubview:self.sortButton];
  
  self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 26 + 1, 320, 428)];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  return self;
}

- (void)didSelectShow
{
  [[[UIActionSheet alloc]
    initWithTitle:nil
    delegate:nil
    cancelButtonTitle:@"All"
    destructiveButtonTitle:nil
    otherButtonTitles:@"Available", nil]
   showFromRect:self.showButton.frame inView:self.showButton animated:YES];
}

- (void)didSelectSort
{
  [[[UIActionSheet alloc]
    initWithTitle:nil
    delegate:nil
    cancelButtonTitle:@"Popularity"
    destructiveButtonTitle:nil
    otherButtonTitles:@"Author name", @"Newest", @"Rating", @"Title", nil]
   showFromRect:self.sortButton.frame inView:self.sortButton animated:YES];
}

- (void)didSelectSearch
{
  [self.navigationController
   pushViewController:[[NYPLLibrarySearchViewController alloc]
                       initWithPlaceholder:@"Search mystery books"]
   animated:YES];
}

- (void)didSelectStarred
{
  [self.navigationController pushViewController:[[NYPLStarredViewController alloc] init]
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
  return 20;
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
