#import "NYPLBookCell.h"
#import "NYPLReaderViewController.h"
#import "NYPLShelfSearchViewController.h"

#import "NYPLShelfViewController.h"

@interface NYPLShelfViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NYPLReaderViewController *readerViewController;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UIButton *showButton;
@property (nonatomic, retain) UIButton *sortButton;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation NYPLShelfViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
 
  self.readerViewController = [[NYPLReaderViewController alloc] init];
  
  self.title = @"My Books";
  
  UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]
                                 initWithImage:[UIImage imageNamed:@"Search"]
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(didSelectSearch)];
  
  self.navigationItem.rightBarButtonItem = searchItem;
  
  // Note: The following layout code is valid for iPhones in portrait view only. In a real
  // implementation, this would be done in a more generic way.
  
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
  [self.sortButton setTitle:@"Sort by: Last read" forState:UIControlStateNormal];
  [self.sortButton addTarget:self
                      action:@selector(didSelectSort)
            forControlEvents:UIControlEventTouchUpInside];
  [buttonView addSubview:self.sortButton];
  
  CGFloat height = [UIScreen mainScreen].bounds.size.height - (64 + 26 + 1) - 50;
  self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 26 + 1, 320, height)];
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
    otherButtonTitles:@"Borrowed", @"Imported", @"On device", nil]
   showFromRect:self.showButton.frame inView:self.showButton animated:YES];
}

- (void)didSelectSort
{
  [[[UIActionSheet alloc]
    initWithTitle:nil
    delegate:nil
    cancelButtonTitle:@"Last read"
    destructiveButtonTitle:nil
    otherButtonTitles:@"Author", @"Due date", @"Newest", @"Title", nil]
   showFromRect:self.sortButton.frame inView:self.sortButton animated:YES];
}

- (void)didSelectSearch
{
  [self.navigationController pushViewController:[[NYPLShelfSearchViewController alloc] init]
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
  [self.navigationController pushViewController:self.readerViewController animated:YES];
}

@end
