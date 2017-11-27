//
//  WRNavigationBar+ZZExpose.h
//  Infinitus
//
//  Created by PengZhiZhong on 2017/11/14.
//

#import "WRNavigationBar.h"

///把一些内部设置方法暴露出来(谨慎使用！！！)
@interface UINavigationController (ZZExpose)
- (void)setNeedsNavigationBarUpdateForBarBackgroundImage:(UIImage *)backgroundImage;
- (void)setNeedsNavigationBarUpdateForBarBackgroundImage:(UIImage *)backgroundImage topImage:(UIImage *)topImage;//zzz
- (void)setNeedsNavigationBarUpdateForBarTintColor:(UIColor *)barTintColor;
- (void)setNeedsNavigationBarUpdateForBarBackgroundAlpha:(CGFloat)barBackgroundAlpha;
- (void)setNeedsNavigationBarUpdateForBarBackgroundAlpha_topIvAlpha:(CGFloat)topIvAlpha;//zzz
- (void)setNeedsNavigationBarUpdateForTintColor:(UIColor *)tintColor;
- (void)setNeedsNavigationBarUpdateForShadowImageHidden:(BOOL)hidden;
- (void)setNeedsNavigationBarUpdateForTitleColor:(UIColor *)titleColor;
@end
@interface UINavigationBar (ZZExpose)
- (void)wr_setBackgroundAlpha:(CGFloat)alpha;
@end


@interface UIViewController (ZZExpose)
///UITabBarController的根导航控制器的rootViewController的导航栏初始设置（建议放在viewController基类的viewDidLoad中设置一下）
- (void)tabBar_navigaiontRootViewControllerFirstSetting;
@end
