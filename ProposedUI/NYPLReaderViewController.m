#import "NYPLContentsViewController.h"
#import "NYPLDetailViewController.h"

#import "NYPLReaderViewController.h"

@interface NYPLReaderViewController ()

@property (nonatomic, retain) UIBarButtonItem *appearanceItem;
@property (nonatomic, retain) UIBarButtonItem *bookmarksItem;
@property (nonatomic, retain) UIBarButtonItem *contentsItem;

@end

@implementation NYPLReaderViewController

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
  UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
  [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return newImage;
}

- (id)init
{
  self = [super init];
  if(!self) return nil;
  
  self.hidesBottomBarWhenPushed = YES;

  UIBarButtonItem *appearanceItem = [[UIBarButtonItem alloc]
                                     initWithImage:[UIImage imageNamed:@"Appearance"]
                                     style:UIBarButtonItemStylePlain
                                     target:self
                                     action:@selector(didPressButton)];
  
  UIBarButtonItem *bookmarksItem = [[UIBarButtonItem alloc]
                                    initWithImage:[UIImage imageNamed:@"Bookmarks"]
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(didPressButton)];
  
  UIBarButtonItem *contentsItem = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"Contents"]
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(didPressContents)];
  
  self.navigationItem.rightBarButtonItems = @[contentsItem, bookmarksItem, appearanceItem];
  
  // Note: The following layout code is valid for iPhones in portrait view only. In a real
  // implementation, this would be done in a more generic way.
  
  CGFloat y = [UIScreen mainScreen].bounds.size.height - 50;
  UIView *controlView = [[UIView alloc] initWithFrame:CGRectMake(0, y, 320, 50)];
  controlView.backgroundColor = [UIColor colorWithWhite:0.967 alpha:1.0];
  [self.view addSubview:controlView];
  
  UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, y, 320, 0.5)];
  lineView.backgroundColor = [UIColor colorWithWhite:0.667 alpha:1.0];
  [self.view addSubview:lineView];
  
  UISlider *slider = [[UISlider alloc] init];
  slider.value = 0.33;
  slider.frame = CGRectMake(6, 14, 308, 4);
  [slider setThumbImage:[UIImage imageNamed:@"Thumb"] forState:UIControlStateNormal];
  [controlView addSubview:slider];
  
  UILabel *pageTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(6, 26, 308, 16)];
  pageTotalLabel.text = @"114 of 342";
  pageTotalLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
  pageTotalLabel.textAlignment = NSTextAlignmentCenter;
  [controlView addSubview:pageTotalLabel];
  
  UILabel *pageLeftLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 26, 112, 16)];
  pageLeftLabel.text = @"6 pages left";
  pageLeftLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
  pageLeftLabel.textAlignment = NSTextAlignmentRight;
  [controlView addSubview:pageLeftLabel];
  
  UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  backButton.frame = CGRectMake(8, 26, 100, 16);
  backButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
  [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
  [backButton setTitle:@"Back to page 16" forState:UIControlStateNormal];
  [backButton addTarget:self
                 action:@selector(didPressButton)
       forControlEvents:UIControlEventTouchUpInside];
  [controlView addSubview:backButton];
  
  return self;
}

- (void)didPressButton
{

}

- (void)didPressContents
{
  [self.navigationController pushViewController:[[NYPLContentsViewController alloc] init]
                                       animated:YES];
}

#pragma mark UIViewController

- (void)viewDidLoad
{
  self.view.backgroundColor = [UIColor whiteColor];
}

@end