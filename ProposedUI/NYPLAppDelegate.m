#import "NYPLLibraryViewController.h"
#import "NYPLMyBooksViewController.h"
#import "NYPLSettingsViewController.h"
#import "NYPLWaitListViewController.h"

#import "NYPLAppDelegate.h"

@interface NYPLAppDelegate ()

@property (nonatomic, retain) NYPLLibraryViewController *libraryViewController;
@property (nonatomic, retain) NYPLMyBooksViewController *myBooksViewController;
@property (nonatomic, retain) NYPLSettingsViewController *settingsViewController;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) NYPLWaitListViewController *waitListViewController;

@end

@implementation NYPLAppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.libraryViewController = [[NYPLLibraryViewController alloc] init];
  self.myBooksViewController = [[NYPLMyBooksViewController alloc] init];
  self.settingsViewController = [[NYPLSettingsViewController alloc] init];
  self.waitListViewController = [[NYPLWaitListViewController alloc] init];
  
  self.tabBarController = [[UITabBarController alloc] init];
  self.tabBarController.viewControllers = @[self.myBooksViewController,
                                            self.libraryViewController,
                                            self.waitListViewController,
                                            self.settingsViewController];
  
  NSArray *tabBarItems = self.tabBarController.tabBar.items;
  ((UITabBarItem *) tabBarItems[0]).image = [UIImage imageNamed:@"MyBooks"];
  ((UITabBarItem *) tabBarItems[1]).image = [UIImage imageNamed:@"TheLibrary"];
  ((UITabBarItem *) tabBarItems[2]).image = [UIImage imageNamed:@"WaitList"];
  ((UITabBarItem *) tabBarItems[3]).image = [UIImage imageNamed:@"Settings"];
  
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.backgroundColor = [UIColor whiteColor];
  self.window.rootViewController = self.tabBarController;
  [self.window makeKeyAndVisible];
    
  return YES;
}

@end
