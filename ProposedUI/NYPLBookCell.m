#import "NYPLBookCell.h"

@implementation NYPLBookCell

- (id)init
{
  static NSString *const kReuseIdentifier = @"NYPLBookCell";
  
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier];
  if(!self) return nil;
  
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  
  UIView *bookView = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 68, 88)];
  bookView.backgroundColor = [UIColor colorWithWhite:0.667 alpha:1.0];
  [self.contentView addSubview:bookView];
  
  UIView *line1View = [[UIView alloc] initWithFrame:CGRectMake(84, 8, 320 - 84 - 8, 16)];
  line1View.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
  [self.contentView addSubview:line1View];
  
  UIView *line2View = [[UIView alloc] initWithFrame:CGRectMake(84, 30, 320 - 84 - 8, 16)];
  line2View.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
  [self.contentView addSubview:line2View];
  
  UIView *line3View = [[UIView alloc] initWithFrame:CGRectMake(162, 80, 150, 16)];
  line3View.backgroundColor = [UIColor colorWithRed:0.854 green:0.93 blue:1.0 alpha:1.0];
  [self.contentView addSubview:line3View];
  
  return self;
}

@end
