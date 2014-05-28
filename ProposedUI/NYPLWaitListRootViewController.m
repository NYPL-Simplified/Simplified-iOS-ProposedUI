#import "NYPLBookCell.h"

#import "NYPLWaitListRootViewController.h"

@interface NYPLWaitListRootViewController ()
  <UIActionSheetDelegate, UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@end

@implementation NYPLWaitListRootViewController

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.title = @"Holds";
  
  CGRect frame = self.view.frame;
  frame.origin.y = self.navigationController.navigationBar.frame.size.height;
  frame.size.height -= frame.origin.y;
  self.tableView = [[UITableView alloc] initWithFrame:frame];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  return self;
}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  switch(buttonIndex) {
    case 0:
      [[[UIAlertView alloc]
        initWithTitle:@"Loan Accepted"
        message:@"Lorem Ipsum: Volume 2 will now begin downloading."
        delegate:nil
        cancelButtonTitle:nil
        otherButtonTitles:@"Go to My Books", @"OK", nil]
       show];
      break;
    case 1:
      [[[UIAlertView alloc]
        initWithTitle:@"Decline Loan"
        message:@"Are you sure you wish to decline the loan for Lorem Ipsum: Volume 2?"
        delegate:self
        cancelButtonTitle:@"Cancel"
        otherButtonTitles:@"Decline", nil]
       show];
    default:
      return;
  }
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  if(buttonIndex == 1) {
    [[[UIAlertView alloc]
      initWithTitle:@"Loan Declined"
      message:@"You have declined the loan for Lorem Ipsum: Volume 2."
      delegate:self
      cancelButtonTitle:nil
      otherButtonTitles:@"OK", nil]
     show];
  }
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [[NYPLBookCell alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  if(section == 0) return @"Ready for checkout";

  return @"Not yet available";
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  if(section == 0) return 2;
  
  return 6;
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
  [[[UIActionSheet alloc]
    initWithTitle:@"Lorem Ipsum: Volume 2 is now available.\nDo you still wish to checkout this book?"
    delegate:self
    cancelButtonTitle:@"Cancel"
    destructiveButtonTitle:nil
    otherButtonTitles:@"Accept loan", @"Decline loan", nil]
   showInView:self.view];
}

@end
