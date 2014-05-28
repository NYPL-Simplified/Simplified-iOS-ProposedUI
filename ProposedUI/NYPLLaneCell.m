#import "NYPLLaneCell.h"

@implementation NYPLLaneCell

- (id)init
{
  static NSString *const kReuseIdentifier = @"NYPLLaneCell";
  
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier];
  if(!self) return nil;
  
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  
  UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 104)];
  scrollView.contentSize = CGSizeMake(76 * 11 + 8, 104);
  [self.contentView addSubview:scrollView];
  
  for(int i = 0; i < 11; ++i) {
    UIView *bookView = [[UIView alloc] initWithFrame:CGRectMake(i * 76 + 8, 8, 68, 88)];
    if(i == 10) {
      bookView.backgroundColor = [UIColor colorWithRed:0.854 green:0.93 blue:1.0 alpha:1.0];
    } else {
      bookView.backgroundColor = [UIColor colorWithWhite:0.667 alpha:1.0];
    }
    [scrollView addSubview:bookView];
  }

  
  return self;
}

@end
