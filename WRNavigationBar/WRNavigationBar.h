//
//  UINavigationBar+WRAddition.h
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import <UIKit/UIKit.h>
@class WRCustomNavigationBar;

@interface WRNavigationBar : UIView
+ (BOOL)isIphoneX;
@end


#pragma mark - Default
@interface WRNavigationBar (WRDefault)

/** set default barTintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarBarTintColor:(UIColor *)color;

/** set default barBackgroundImage of UINavigationBar */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
+ (void)wr_setDefaultNavBarBackgroundImage:(UIImage *)image;

/** set default tintColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTintColor:(UIColor *)color;

/** set default titleColor of UINavigationBar */
+ (void)wr_setDefaultNavBarTitleColor:(UIColor *)color;

/** set default statusBarStyle of UIStatusBar */
+ (void)wr_setDefaultStatusBarStyle:(UIStatusBarStyle)style;

/** set default shadowImage isHidden of UINavigationBar */
+ (void)wr_setDefaultNavBarShadowImageHidden:(BOOL)hidden;

@end



#pragma mark - UINavigationBar
@interface UINavigationBar (WRAddition) <UINavigationBarDelegate>

/** 设置导航栏所有BarButtonItem的透明度 */
- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

/** 设置导航栏在垂直方向上平移多少距离 */
- (void)wr_setTranslationY:(CGFloat)translationY;

/** 获取当前导航栏在垂直方向上偏移了多少 */
- (CGFloat)wr_getTranslationY;

@end




#pragma mark - UIViewController
@interface UIViewController (WRAddition)

/** record current ViewController navigationBar backgroundImage */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
- (void)wr_setNavBarBackgroundImage:(UIImage *)image;
- (UIImage *)wr_navBarBackgroundImage;

/** record current ViewController navigationBar barTintColor */
- (void)wr_setNavBarBarTintColor:(UIColor *)color;
- (UIColor *)wr_navBarBarTintColor;

/** record current ViewController navigationBar backgroundAlpha */
- (void)wr_setNavBarBackgroundAlpha:(CGFloat)alpha;
- (CGFloat)wr_navBarBackgroundAlpha;
- (void)wr_setNavBarBackgroundAlpha_justValue:(CGFloat)alpha;//zzz

/** record current ViewController navigationBar tintColor */
- (void)wr_setNavBarTintColor:(UIColor *)color;
- (UIColor *)wr_navBarTintColor;

/** record current ViewController titleColor */
- (void)wr_setNavBarTitleColor:(UIColor *)color;
- (UIColor *)wr_navBarTitleColor;

/** record current ViewController statusBarStyle */
- (void)wr_setStatusBarStyle:(UIStatusBarStyle)style;
- (UIStatusBarStyle)wr_statusBarStyle;

/** record current ViewController navigationBar shadowImage hidden */
- (void)wr_setNavBarShadowImageHidden:(BOOL)hidden;
- (BOOL)wr_navBarShadowImageHidden;

/** record current ViewController custom navigationBar */
/** warning: wr_setDefaultNavBarBackgroundImage is deprecated! place use WRCustomNavigationBar */
//- (void)wr_setCustomNavBar:(WRCustomNavigationBar *)navBar;

@end




#pragma mark - UIImage
NS_ASSUME_NONNULL_BEGIN
@interface UIImage (ZZAdd)
/** Create and return a 1x1 point size image with the given color. */
+ (nullable UIImage *)imageWithColor:(UIColor *)color;
/** Create and return a pure color image with the given color and size. */
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
NS_ASSUME_NONNULL_END







//[16:58:28] -[UIScrollView(AllowPanGestureEventPass) hitTest:withEvent:] [第101行]
//
//[16:58:28] -[UIScrollView(AllowPanGestureEventPass) hitTest:withEvent:] [第101行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_popViewControllerAnimated:] [第662行]
//
//[16:58:36] -[SettingVC viewWillDisappear:] [第124行]
//
//[17:32:35] -[UIViewController(WRAddition) wr_viewWillDisappear:] [第1114行]
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1152行] self.navigationController.navigationBarHidden==0
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1153行] self.navigationController.viewControllers.count==1
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1154行] self.navigationBar.items.count==2
//
//[16:58:44] -[DCViewController viewWillDisappear:] [第103行]
//
//[16:58:55] -[MineVC viewWillAppear:] [第88行]
//
//[17:32:35] -[UIViewController(WRAddition) wr_viewWillAppear:] [第1102行]
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1152行] self.navigationController.navigationBarHidden==0
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1153行] self.navigationController.viewControllers.count==1
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1154行] self.navigationBar.items.count==2
//
//[16:58:44] -[DCViewController viewWillAppear:] [第98行]
//
//[16:57:55] -[HealthKitManger isOpenHKAuthorizationStatus] [第415行] HKAuthorizationStatusNotDetermined
//
//[16:57:55] +[HealthKitManger requestStepCount_withBlock:] [第494行] 第一次，先不去上传下传刷新步数
//
//[16:58:44] -[DCViewController viewSafeAreaInsetsDidChange] [第295行]
//
//[16:58:44] -[DCViewController viewSafeAreaInsetsDidChange] [第295行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[17:32:35] -[UINavigationController(WRAddition) wr_updateInteractiveTransition:] [第884行]
//
//[16:58:55] -[MineVC viewWillDisappear:] [第77行]
//
//[17:32:35] -[UIViewController(WRAddition) wr_viewWillDisappear:] [第1114行]
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1152行] self.navigationController.navigationBarHidden==0
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1153行] self.navigationController.viewControllers.count==2
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1154行] self.navigationBar.items.count==2
//
//[16:58:44] -[DCViewController viewWillDisappear:] [第103行]
//
//[16:58:55] -[MineVC viewDidDisappear:] [第83行]
//
//[16:58:36] -[SettingVC viewWillAppear:] [第112行]
//
//[17:32:35] -[UIViewController(WRAddition) wr_viewWillAppear:] [第1102行]
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1152行] self.navigationController.navigationBarHidden==0
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1153行] self.navigationController.viewControllers.count==2
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1154行] self.navigationBar.items.count==2
//
//[16:58:44] -[DCViewController viewWillAppear:] [第98行]
//
//[16:58:36] -[SettingVC viewDidAppear:] [第119行]
//
//[17:32:35] -[UIViewController(WRAddition) wr_viewDidAppear:] [第1123行]
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1152行] self.navigationController.navigationBarHidden==0
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1153行] self.navigationController.viewControllers.count==2
//
//[17:32:35] -[UIViewController(WRAddition) canUpdateNavigationBar] [第1154行] self.navigationBar.items.count==2
//
//[16:58:44] -[DCViewController viewDidAppear:] [第87行]
//
//[16:58:56] +[AppVersionAlertView appVersionCheck_hasNewVersion] [第488行] 没有新版本更新...

