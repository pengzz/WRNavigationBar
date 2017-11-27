//
//  WRNavigationBar+ZZExpose.m
//  Infinitus
//
//  Created by PengZhiZhong on 2017/11/14.
//

#import "WRNavigationBar+ZZExpose.h"

@implementation UIViewController (ZZExpose)
///把一些内部设置方法暴露出来(谨慎使用！！！)
- (void)tabBar_navigaiontRootViewControllerFirstSetting {
    NSLog(@"");
    //if (@available(iOS 11.0, *)) {
    //    self.navigationController.navigationBar.prefersLargeTitles = false;
    //}
    //TabBar中一些根VC的导航栏初始设置
    if(self.navigationController&&
       self.navigationController.viewControllers[0]==self&&
       [self.navigationController.parentViewController isKindOfClass:[UITabBarController class]]
       ){
        UIImage *barBgImage = [self wr_navBarBackgroundImage];
        if (barBgImage != nil) {
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundImage:barBgImage];
        } else {
            [self.navigationController setNeedsNavigationBarUpdateForBarTintColor:[self wr_navBarBarTintColor]];
        }
        [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:[self wr_navBarBackgroundAlpha]];
        [self.navigationController setNeedsNavigationBarUpdateForTintColor:[self wr_navBarTintColor]];
        [self.navigationController setNeedsNavigationBarUpdateForTitleColor:[self wr_navBarTitleColor]];
        [self.navigationController setNeedsNavigationBarUpdateForShadowImageHidden:[self wr_navBarShadowImageHidden]];
    }
    //设置导航栏背景图为透明
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.translucent = YES;
    
    //self.navigationController.view.backgroundColor = [UIColor redColor];
}

@end
