//
//  UINavigationBar+WRAddition.m
//  StoryBoardDemo
//
//  Created by wangrui on 2017/4/9.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "WRNavigationBar.h"
#import <objc/runtime.h>

@implementation WRNavigationBar

+ (BOOL)isIphoneX
{
    if (CGRectEqualToRect([UIScreen mainScreen].bounds,CGRectMake(0, 0, 375, 812))) {
        return YES;
    } else {
        return NO;
    }
}

@end


//===============================================================================================
#pragma mark - default navigationBar barTintColor、tintColor and statusBarStyle YOU CAN CHANGE!!!
//===============================================================================================
@interface WRNavigationBar (WRDefault)
+ (UIColor *)defaultNavBarBarTintColor;
+ (UIColor *)defaultNavBarTintColor;
+ (UIColor *)defaultNavBarTitleColor;
+ (UIStatusBarStyle)defaultStatusBarStyle;
+ (BOOL)defaultNavBarShadowImageHidden;
+ (CGFloat)defaultNavBarBackgroundAlpha;
+ (UIColor *)middleColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(CGFloat)percent;
+ (CGFloat)middleAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha percent:(CGFloat)percent;
@end
@implementation WRNavigationBar (WRDefault)

static char kWRDefaultNavBarBarTintColorKey;
static char kWRDefaultNavBarBackgroundImageKey;
static char kWRDefaultNavBarTintColorKey;
static char kWRDefaultNavBarTitleColorKey;
static char kWRDefaultStatusBarStyleKey;
static char kWRDefaultNavBarShadowImageHiddenKey;

+ (UIColor *)defaultNavBarBarTintColor
{
    UIColor *color = (UIColor *)objc_getAssociatedObject(self, &kWRDefaultNavBarBarTintColorKey);
    return (color != nil) ? color : [UIColor whiteColor];
}
+ (void)wr_setDefaultNavBarBarTintColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRDefaultNavBarBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIImage *)defaultNavBarBackgroundImage
{
    UIImage *image = (UIImage *)objc_getAssociatedObject(self, &kWRDefaultNavBarBackgroundImageKey);
    return image;
}
+ (void)wr_setDefaultNavBarBackgroundImage:(UIImage *)image
{
    objc_setAssociatedObject(self, &kWRDefaultNavBarBackgroundImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIColor *)defaultNavBarTintColor
{
    UIColor *color = (UIColor *)objc_getAssociatedObject(self, &kWRDefaultNavBarTintColorKey);
    return (color != nil) ? color : [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1.0];
}
+ (void)wr_setDefaultNavBarTintColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRDefaultNavBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIColor *)defaultNavBarTitleColor
{
    UIColor *color = (UIColor *)objc_getAssociatedObject(self, &kWRDefaultNavBarTitleColorKey);
    return (color != nil) ? color : [UIColor blackColor];
}
+ (void)wr_setDefaultNavBarTitleColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRDefaultNavBarTitleColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIStatusBarStyle)defaultStatusBarStyle
{
    id style = objc_getAssociatedObject(self, &kWRDefaultStatusBarStyleKey);
    return (style != nil) ? [style integerValue] : UIStatusBarStyleDefault;
}
+ (void)wr_setDefaultStatusBarStyle:(UIStatusBarStyle)style
{
    objc_setAssociatedObject(self, &kWRDefaultStatusBarStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (BOOL)defaultNavBarShadowImageHidden
{
    id hidden = objc_getAssociatedObject(self, &kWRDefaultNavBarShadowImageHiddenKey);
    return (hidden != nil) ? [hidden boolValue] : NO;
}
+ (void)wr_setDefaultNavBarShadowImageHidden:(BOOL)hidden
{
    objc_setAssociatedObject(self, &kWRDefaultNavBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (CGFloat)defaultNavBarBackgroundAlpha
{
    return 1.0;
}

+ (UIColor *)middleColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(CGFloat)percent
{
    CGFloat fromRed = 0;
    CGFloat fromGreen = 0;
    CGFloat fromBlue = 0;
    CGFloat fromAlpha = 0;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    
    CGFloat toRed = 0;
    CGFloat toGreen = 0;
    CGFloat toBlue = 0;
    CGFloat toAlpha = 0;
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    CGFloat newRed = fromRed + (toRed - fromRed) * percent;
    CGFloat newGreen = fromGreen + (toGreen - fromGreen) * percent;
    CGFloat newBlue = fromBlue + (toBlue - fromBlue) * percent;
    CGFloat newAlpha = fromAlpha + (toAlpha - fromAlpha) * percent;
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}
+ (CGFloat)middleAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha percent:(CGFloat)percent
{
    return fromAlpha + (toAlpha - fromAlpha) * percent;
}

@end


//==========================================================================
#pragma mark - UINavigationBar
//==========================================================================
@implementation UINavigationBar (WRAddition)

static char kWRBackgroundViewKey;
static char kWRBackgroundImageViewKey;
static char kWRBackgroundImageKey;
static char kWRBackgroundImageViewTopIvKey;//BackgroundImageVie中上层TopIv//zzz

- (int)navBarBottom
{
    if ([WRNavigationBar isIphoneX]) {
        return 88;
    } else {
        return 64;
    }
}
- (UIView *)backgroundView
{
    return (UIView *)objc_getAssociatedObject(self, &kWRBackgroundViewKey);
}
- (void)setBackgroundView:(UIView *)backgroundView
{
    objc_setAssociatedObject(self, &kWRBackgroundViewKey, backgroundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)backgroundImageView
{
    return (UIImageView *)objc_getAssociatedObject(self, &kWRBackgroundImageViewKey);
}
- (void)setBackgroundImageView:(UIImageView *)bgImageView
{
    objc_setAssociatedObject(self, &kWRBackgroundImageViewKey, bgImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImage *)backgroundImage
{
    return (UIImage *)objc_getAssociatedObject(self, &kWRBackgroundImageKey);
}
- (void)setBackgroundImage:(UIImage *)image
{
    objc_setAssociatedObject(self, &kWRBackgroundImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//zzz
- (UIImageView *)backgroundImageViewTopIv
{
    return (UIImageView *)objc_getAssociatedObject(self, &kWRBackgroundImageViewTopIvKey);
}
- (void)setBackgroundImageViewTopIv:(UIImageView *)bgTopIv
{
    objc_setAssociatedObject(self, &kWRBackgroundImageViewTopIvKey, bgTopIv, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// set navigationBar backgroundImage
- (void)wr_setBackgroundImage:(UIImage *)image
{
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
    if (self.backgroundImageView == nil)
    {
        // add a image(nil color) to _UIBarBackground make it clear
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        if (self.subviews.count > 0)
        {
            self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), [self navBarBottom])];
            self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            
            // _UIBarBackground is first subView for navigationBar
            [self.subviews.firstObject insertSubview:self.backgroundImageView atIndex:0];
        }
    }
    self.backgroundImage = image;
    self.backgroundImageView.image = image;
    
    //zzz隐藏上层图片：
    if(self.backgroundImageViewTopIv){
        self.backgroundImageViewTopIv.alpha = 0.0;//隐藏上层图片
    }
}

//zzz
- (void)wr_setBackgroundImage:(UIImage *)image topImage:(UIImage *)topImage;
{
    //下层显示：还是按原来的代码处理
    {
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
        if (self.backgroundImageView == nil)
        {
            // add a image(nil color) to _UIBarBackground make it clear
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            if (self.subviews.count > 0)
            {
                self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), [self navBarBottom])];
                self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
                
                // _UIBarBackground is first subView for navigationBar
                [self.subviews.firstObject insertSubview:self.backgroundImageView atIndex:0];
            }
        }
        self.backgroundImage = image;
        self.backgroundImageView.image = image;
    }
    
    //上层显示：处理
    if(image==topImage){
        if(self.backgroundImageViewTopIv){
            self.backgroundImageViewTopIv.alpha = 0.0;//隐藏上层图片
        }
    }else{//设置上层图片
        if(self.backgroundImageViewTopIv == nil){
            self.backgroundImageViewTopIv = [[UIImageView alloc] initWithFrame:self.backgroundImageView.bounds];
            self.backgroundImageViewTopIv.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            [self.backgroundImageView addSubview:self.backgroundImageViewTopIv];
            self.backgroundImageViewTopIv.alpha = 0.0;//先不显示
        }
        [self.backgroundImageView addSubview:self.backgroundImageViewTopIv];//修正一个bug
        self.backgroundImageViewTopIv.image = topImage;
    }
}

// set navigationBar barTintColor
- (void)wr_setBackgroundColor:(UIColor *)color
{
    [self.backgroundImageView removeFromSuperview];
    self.backgroundImageView = nil;
    self.backgroundImage = nil;
    if (self.backgroundView == nil)
    {
        // add a image(nil color) to _UIBarBackground make it clear
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), [self navBarBottom])];
        self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        // _UIBarBackground is first subView for navigationBar
        [self.subviews.firstObject insertSubview:self.backgroundView atIndex:0];
    }
    self.backgroundView.backgroundColor = color;
}

// set _UIBarBackground alpha (_UIBarBackground subviews alpha <= _UIBarBackground alpha)
- (void)wr_setBackgroundAlpha:(CGFloat)alpha
{
    UIView *barBackgroundView = self.subviews.firstObject;
    if (@available(iOS 11.0, *))
    {   // sometimes we can't change _UIBarBackground alpha
        for (UIView *view in barBackgroundView.subviews) {
            view.alpha = alpha;
        }
    } else {
        barBackgroundView.alpha = alpha;
    }
}

- (void)wr_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator
{
    for (UIView *view in self.subviews)
    {
        if (hasSystemBackIndicator == YES)
        {
            // _UIBarBackground/_UINavigationBarBackground对应的view是系统导航栏，不需要改变其透明度
            Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
            if (_UIBarBackgroundClass != nil)
            {
                if ([view isKindOfClass:_UIBarBackgroundClass] == NO) {
                    view.alpha = alpha;
                }
            }
            
            Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
            if (_UINavigationBarBackground != nil)
            {
                if ([view isKindOfClass:_UINavigationBarBackground] == NO) {
                    view.alpha = alpha;
                }
            }
        }
        else
        {
            // 这里如果不做判断的话，会显示 backIndicatorImage
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO)
            {
                Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
                if (_UIBarBackgroundClass != nil)
                {
                    if ([view isKindOfClass:_UIBarBackgroundClass] == NO) {
                        view.alpha = alpha;
                    }
                }
                
                Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
                if (_UINavigationBarBackground != nil)
                {
                    if ([view isKindOfClass:_UINavigationBarBackground] == NO) {
                        view.alpha = alpha;
                    }
                }
            }
        }
    }
}

// 设置导航栏在垂直方向上平移多少距离
- (void)wr_setTranslationY:(CGFloat)translationY
{
    // CGAffineTransformMakeTranslation  平移
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

/** 获取当前导航栏在垂直方向上偏移了多少 */
- (CGFloat)wr_getTranslationY
{
    return self.transform.ty;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    UIImage *bgImage = selfbackgroundImage;
//    if (bgImage)
//    {
//        [self wr_setBackgroundImage:bgImage];
//    }
//    //注意导航栏及状态栏高度适配
//    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), [self navBarBottom]);
//    for (UIView *view in self.subviews) {
//        if([NSStringFromClass([view class]) containsString:@"Background"]) {
//            view.frame = self.bounds;
//        }
//        else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
//            CGRect frame = view.frame;
//            frame.origin.y = [WRNavigationBar isIphoneX] ? 44 : 20;
//            frame.size.height = self.bounds.size.height - frame.origin.y;
//            view.frame = frame;
//        }
//    }
//}

#pragma mark - call swizzling methods active 主动调用交换方法
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        SEL needSwizzleSelectors[1] = {
            @selector(setTitleTextAttributes:)
        };
      
        for (int i = 0; i < 1;  i++) {
            SEL selector = needSwizzleSelectors[i];
            NSString *newSelectorStr = [NSString stringWithFormat:@"wr_%@", NSStringFromSelector(selector)];
            Method originMethod = class_getInstanceMethod(self, selector);
            Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelectorStr));
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}

- (void)wr_setTitleTextAttributes:(NSDictionary<NSString *,id> *)titleTextAttributes
{
    NSMutableDictionary<NSString *,id> *newTitleTextAttributes = [titleTextAttributes mutableCopy];
    if (newTitleTextAttributes == nil) {
        return;
    }
    
    NSDictionary<NSString *,id> *originTitleTextAttributes = self.titleTextAttributes;
    if (originTitleTextAttributes == nil) {
        [self wr_setTitleTextAttributes:newTitleTextAttributes];
        return;
    }
    
    __block UIColor *titleColor;
    [originTitleTextAttributes enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqual:NSForegroundColorAttributeName]) {
            titleColor = (UIColor *)obj;
            *stop = YES;
        }
    }];
    
    if (titleColor == nil) {
        [self wr_setTitleTextAttributes:newTitleTextAttributes];
        return;
    }
    
    if (newTitleTextAttributes[NSForegroundColorAttributeName] == nil) {
        newTitleTextAttributes[NSForegroundColorAttributeName] = titleColor;
    }
    [self wr_setTitleTextAttributes:newTitleTextAttributes];
}

@end

@interface UIViewController (Addition)
- (void)setPushToCurrentVCFinished:(BOOL)isFinished;
@end

//==========================================================================
#pragma mark - UINavigationController
//==========================================================================
@implementation UINavigationController (WRAddition)

static CGFloat wrPopDuration = 0.12;
static int wrPopDisplayCount = 0;
- (CGFloat)wrPopProgress
{
    CGFloat all = 60 * wrPopDuration;
    int current = MIN(all, wrPopDisplayCount);
    return current / all;
}

static CGFloat wrPushDuration = 0.10;
static int wrPushDisplayCount = 0;
- (CGFloat)wrPushProgress
{
    CGFloat all = 60 * wrPushDuration;
    int current = MIN(all, wrPushDisplayCount);
    return current / all;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.topViewController wr_statusBarStyle];
}

- (void)setNeedsNavigationBarUpdateForBarBackgroundImage:(UIImage *)backgroundImage
{
    [self.navigationBar wr_setBackgroundImage:backgroundImage];
}
//zzz
- (void)setNeedsNavigationBarUpdateForBarBackgroundImage:(UIImage *)backgroundImage topImage:(UIImage *)topImage
{
    [self.navigationBar wr_setBackgroundImage:backgroundImage topImage:topImage];
}
- (void)setNeedsNavigationBarUpdateForBarTintColor:(UIColor *)barTintColor
{
    [self.navigationBar wr_setBackgroundColor:barTintColor];
}
- (void)setNeedsNavigationBarUpdateForBarBackgroundAlpha:(CGFloat)barBackgroundAlpha
{
    if(barBackgroundAlpha<0.0){//zzz:viewDidLoad会设置，Tab初始设置也会设置
        [self.navigationBar wr_setBackgroundAlpha:1.0];
        return;
    }
    [self.navigationBar wr_setBackgroundAlpha:barBackgroundAlpha];
}
- (void)setNeedsNavigationBarUpdateForBarBackgroundAlpha_topIvAlpha:(CGFloat)topIvAlpha
{
    //zz:设置topIv的alpha
    if(self.navigationBar.backgroundImageView){
        if(self.navigationBar.backgroundImageViewTopIv){
            if(!self.navigationBar.backgroundImageViewTopIv.hidden){
                self.navigationBar.backgroundImageViewTopIv.alpha = topIvAlpha;
            }
        }
    }
}
- (void)setNeedsNavigationBarUpdateForTintColor:(UIColor *)tintColor
{
    self.navigationBar.tintColor = tintColor;
}
- (void)setNeedsNavigationBarUpdateForShadowImageHidden:(BOOL)hidden
{
    self.navigationBar.shadowImage = (hidden == YES) ? [UIImage new] : nil;
}
- (void)setNeedsNavigationBarUpdateForTitleColor:(UIColor *)titleColor
{
    NSDictionary *titleTextAttributes = [self.navigationBar titleTextAttributes];
    if (titleTextAttributes == nil) {
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor};
        return;
    }
    NSMutableDictionary *newTitleTextAttributes = [titleTextAttributes mutableCopy];
    newTitleTextAttributes[NSForegroundColorAttributeName] = titleColor;
    self.navigationBar.titleTextAttributes = newTitleTextAttributes;
}

- (void)updateNavigationBarWithFromVC0:(UIViewController *)fromVC toVC:(UIViewController *)toVC progress:(CGFloat)progress
{
    // change navBarBarTintColor
    UIColor *fromBarTintColor = [fromVC wr_navBarBarTintColor];
    UIColor *toBarTintColor = [toVC wr_navBarBarTintColor];
    UIColor *newBarTintColor = [WRNavigationBar middleColor:fromBarTintColor toColor:toBarTintColor percent:progress];
    [self setNeedsNavigationBarUpdateForBarTintColor:newBarTintColor];
    
    // change navBarTintColor
    UIColor *fromTintColor = [fromVC wr_navBarTintColor];
    UIColor *toTintColor = [toVC wr_navBarTintColor];
    UIColor *newTintColor = [WRNavigationBar middleColor:fromTintColor toColor:toTintColor percent:progress];
    [self setNeedsNavigationBarUpdateForTintColor:newTintColor];
    
    // change navBarTitleColor
    UIColor *fromTitleColor = [fromVC wr_navBarTitleColor];
    UIColor *toTitleColor = [toVC wr_navBarTitleColor];
    UIColor *newTitleColor = [WRNavigationBar middleColor:fromTitleColor toColor:toTitleColor percent:progress];
    [self setNeedsNavigationBarUpdateForTitleColor:newTitleColor];
    
    // change navBar _UIBarBackground alpha
    CGFloat fromBarBackgroundAlpha = [fromVC wr_navBarBackgroundAlpha];
    CGFloat toBarBackgroundAlpha = [toVC wr_navBarBackgroundAlpha];
    CGFloat newBarBackgroundAlpha = [WRNavigationBar middleAlpha:fromBarBackgroundAlpha toAlpha:toBarBackgroundAlpha percent:progress];
    [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:newBarBackgroundAlpha];
}
//zzz
- (void)updateNavigationBarWithFromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC progress:(CGFloat)progress{
    UIViewController *topVC = fromVC;
    [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:progress topVC:topVC];
}
- (void)updateNavigationBarWithFromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC progress:(CGFloat)progress topVC:(UIViewController *)topVC
{
    UIImage *fromVC_barBgImage = [fromVC wr_navBarBackgroundImage];
    UIImage *toVC_barBgImage = [toVC wr_navBarBackgroundImage];
    if(fromVC_barBgImage==nil && toVC_barBgImage==nil){
        // change navBarBarTintColor
        UIColor *fromBarTintColor = [fromVC wr_navBarBarTintColor];
        UIColor *toBarTintColor = [toVC wr_navBarBarTintColor];
        UIColor *newBarTintColor = [WRNavigationBar middleColor:fromBarTintColor toColor:toBarTintColor percent:progress];
        [self setNeedsNavigationBarUpdateForBarTintColor:newBarTintColor];
        
        // change navBar _UIBarBackground alpha
        CGFloat fromBarBackgroundAlpha = [fromVC wr_navBarBackgroundAlpha];
        CGFloat toBarBackgroundAlpha = [toVC wr_navBarBackgroundAlpha];
        CGFloat newBarBackgroundAlpha = [WRNavigationBar middleAlpha:fromBarBackgroundAlpha toAlpha:toBarBackgroundAlpha percent:progress];
        [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:newBarBackgroundAlpha];
    }
    else{
        //NSLog(@"progress==%f",  progress);
        UIImage *fromVC_barBgImage = [fromVC wr_navBarBackgroundImage];
        UIImage *toVC_barBgImage = [toVC wr_navBarBackgroundImage];
        CGFloat fromBarBackgroundAlpha0 = [fromVC wr_navBarBackgroundAlpha];
        CGFloat toBarBackgroundAlpha0 = [toVC wr_navBarBackgroundAlpha];
        CGFloat fromBarBackgroundAlpha = fromBarBackgroundAlpha0;
        CGFloat toBarBackgroundAlpha = toBarBackgroundAlpha0;
        if(fromBarBackgroundAlpha>1.0){
            fromBarBackgroundAlpha=1.0;
        }
        if(toBarBackgroundAlpha>1.0){
            toBarBackgroundAlpha=1.0;
        }
        //隐藏时alpha为负值
        if(fromBarBackgroundAlpha0<0.0||toBarBackgroundAlpha0<0.0){
            if(fromBarBackgroundAlpha0<0.0&&toBarBackgroundAlpha0<0.0){
                fromBarBackgroundAlpha=0.0;
                toBarBackgroundAlpha=0.0;
            }
            else if(fromBarBackgroundAlpha<0.0){
                fromBarBackgroundAlpha=toBarBackgroundAlpha;
            }
            else if(toBarBackgroundAlpha<0.0){
                toBarBackgroundAlpha=fromBarBackgroundAlpha;
            }
        }
        fromVC_barBgImage = fromVC_barBgImage!=nil?fromVC_barBgImage:[UIImage imageWithColor:[fromVC wr_navBarBarTintColor]];
        toVC_barBgImage   = toVC_barBgImage!=nil?toVC_barBgImage:[UIImage imageWithColor:[toVC wr_navBarBarTintColor]];
        CGFloat newBarBackgroundAlpha = [WRNavigationBar middleAlpha:fromBarBackgroundAlpha toAlpha:toBarBackgroundAlpha percent:progress];
        
        //1:先设置两个背景image
        UIImage *top_image = nil;
        UIImage *down_image = nil;
        if(topVC==fromVC){//pop
            top_image = fromVC_barBgImage;
            down_image = toVC_barBgImage;
        }
        if(topVC==toVC){//push
            top_image = toVC_barBgImage;
            down_image = fromVC_barBgImage;
        }
        if(fromBarBackgroundAlpha0<0.0||toBarBackgroundAlpha0<0.0){
            if(fromBarBackgroundAlpha0<0.0&&toBarBackgroundAlpha0<0.0){
                [self setNeedsNavigationBarUpdateForBarBackgroundImage:toVC_barBgImage];
            }else if(fromBarBackgroundAlpha0<0.0){
                [self setNeedsNavigationBarUpdateForBarBackgroundImage:toVC_barBgImage];
            }else if(toBarBackgroundAlpha0<0.0){
                [self setNeedsNavigationBarUpdateForBarBackgroundImage:fromVC_barBgImage];
            }
        }else{
            [self setNeedsNavigationBarUpdateForBarBackgroundImage:down_image topImage:top_image];
        }
        
        //2:整体backView
        [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:newBarBackgroundAlpha];//背景alpha
        
        //3:topIv
        if(fromBarBackgroundAlpha0<0.0||toBarBackgroundAlpha0<0.0){
            //不需要处理
        }else if(top_image!=down_image){
            CGFloat topBarBackgroundAlpha = [topVC wr_navBarBackgroundAlpha];
            topBarBackgroundAlpha = topBarBackgroundAlpha>1.0?1.0:topBarBackgroundAlpha;
            CGFloat topIvAlpha = [WRNavigationBar middleAlpha:0.0 toAlpha:topBarBackgroundAlpha percent:1-progress];//pop
            if(topVC==fromVC){//pop
                topIvAlpha = [WRNavigationBar middleAlpha:0.0 toAlpha:topBarBackgroundAlpha percent:1-progress];
            }
            if(topVC==toVC){//push
                topIvAlpha = [WRNavigationBar middleAlpha:0.0 toAlpha:topBarBackgroundAlpha percent:progress];
            }
            //NSLog(@"before:topIvAlpha==%f",topIvAlpha);
            topIvAlpha = topIvAlpha/newBarBackgroundAlpha;
            //NSLog(@"比例后before:topIvAlpha==%f",topIvAlpha);
            topIvAlpha = topIvAlpha>1.0?1.0:topIvAlpha;
            //NSLog(@"修正后before:topIvAlpha==%f",topIvAlpha);
            //假如隐藏alpha应为0 TO DO
            [self setNeedsNavigationBarUpdateForBarBackgroundAlpha_topIvAlpha:topIvAlpha];//背景alpha
        }
    }
    
    // change navBarTintColor
    UIColor *fromTintColor = [fromVC wr_navBarTintColor];
    UIColor *toTintColor = [toVC wr_navBarTintColor];
    UIColor *newTintColor = [WRNavigationBar middleColor:fromTintColor toColor:toTintColor percent:progress];
    [self setNeedsNavigationBarUpdateForTintColor:newTintColor];
    
    // change navBarTitleColor
    UIColor *fromTitleColor = [fromVC wr_navBarTitleColor];
    UIColor *toTitleColor = [toVC wr_navBarTitleColor];
    UIColor *newTitleColor = [WRNavigationBar middleColor:fromTitleColor toColor:toTitleColor percent:progress];
    [self setNeedsNavigationBarUpdateForTitleColor:newTitleColor];
    
    // change navBar _UIBarBackground alpha
    //CGFloat fromBarBackgroundAlpha = [fromVC wr_navBarBackgroundAlpha];
    //CGFloat toBarBackgroundAlpha = [toVC wr_navBarBackgroundAlpha];
    //CGFloat newBarBackgroundAlpha = [UIColor middleAlpha:fromBarBackgroundAlpha toAlpha:toBarBackgroundAlpha percent:progress];
    //[self setNeedsNavigationBarUpdateForBarBackgroundAlpha:newBarBackgroundAlpha];
}


#pragma mark - call swizzling methods active 主动调用交换方法
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        SEL needSwizzleSelectors[4+1+2] = {
            NSSelectorFromString(@"_updateInteractiveTransition:"),
            @selector(setNavigationBarHidden:),//zzz
            @selector(setNavigationBarHidden:animated:),//zzz
            @selector(popViewControllerAnimated:),//zzz
            @selector(popToViewController:animated:),
            @selector(popToRootViewControllerAnimated:),
            @selector(pushViewController:animated:)
        };
      
        for (int i = 0; i < 4+1+2;  i++) {
            SEL selector = needSwizzleSelectors[i];
            NSString *newSelectorStr = [[NSString stringWithFormat:@"wr_%@", NSStringFromSelector(selector)] stringByReplacingOccurrencesOfString:@"__" withString:@"_"];
            Method originMethod = class_getInstanceMethod(self, selector);
            Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelectorStr));
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}
//zzz
- (void)wr_setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    if(hidden==YES){
        [self.topViewController wr_setNavBarBackgroundAlpha_justValue:-1.0];//表示导航栏隐藏了
    }
    [self wr_setNavigationBarHidden:hidden animated:animated];
}
- (void)wr_setNavigationBarHidden:(BOOL)hidden
{
    if(hidden==YES){
        [self.topViewController wr_setNavBarBackgroundAlpha_justValue:-1.0];//表示导航栏隐藏了
    }
    [self wr_setNavigationBarHidden:hidden];
}

//zzz
//解决ios11当前vc在viewWillAppear中设置[self.navigationController setNavigationBarHidden:YES animated:NO]，再pop时并不走当前的popToViewController的bug
- (nullable UIViewController *)wr_popViewControllerAnimated:(BOOL)animated
{
    NSLog(@"");
    if (@available(iOS 11.0, *) || YES) {//ios9.3.4也与ios11一样表现
        if(self.navigationBarHidden==YES
           ||(self.viewControllers.count>=2&&self.viewControllers[self.viewControllers.count-2].wr_navBarBackgroundAlpha<0)//或者前一个vc的wr_navBarBackgroundAlpha小于0
           ){
            __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(popNeedDisplay)];
            [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
            [CATransaction setCompletionBlock:^{
                [displayLink invalidate];
                displayLink = nil;
                wrPopDisplayCount = 0;
            }];
            [CATransaction setAnimationDuration:wrPopDuration];
            [CATransaction begin];
            UIViewController *vc = [self wr_popViewControllerAnimated:animated];
            [CATransaction commit];
            return vc;
        }
    }
    UIViewController *vc = [self wr_popViewControllerAnimated:animated];
    return vc;
}

- (NSArray<UIViewController *> *)wr_popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"");
    if (@available(iOS 11.0, *)) {
        //ios11在vc中主动调用popToViewController方法时，会首先来这，后面shouldPopItem的后面代码再来一次，造成动画过程两次则导航栏会闪一下的感觉，（ios10情况暂未知）
        if(self.viewControllers.count==self.navigationBar.items.count){//主动且第一次进入时相等
            NSArray<UIViewController *> *vcs = [self wr_popToViewController:viewController animated:animated];
            return vcs;
        }
    }
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(popNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        wrPopDisplayCount = 0;
    }];
    [CATransaction setAnimationDuration:wrPopDuration];
    [CATransaction begin];
    NSArray<UIViewController *> *vcs = [self wr_popToViewController:viewController animated:animated];
    [CATransaction commit];
    return vcs;
}

- (NSArray<UIViewController *> *)wr_popToRootViewControllerAnimated:(BOOL)animated
{
    //NSLog(@"");
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(popNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        wrPopDisplayCount = 0;
    }];
    [CATransaction setAnimationDuration:wrPopDuration];
    [CATransaction begin];
    NSArray<UIViewController *> *vcs = [self wr_popToRootViewControllerAnimated:animated];
    [CATransaction commit];
    return vcs;
}

// change navigationBar barTintColor smooth before pop to current VC finished
- (void)popNeedDisplay
{
    if (self.topViewController != nil && self.topViewController.transitionCoordinator != nil)
    {
        wrPopDisplayCount += 1;
        CGFloat popProgress = [self wrPopProgress];
        UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
        [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:popProgress];
        
        //NSLog(@"transitionDuration==%f",self.topViewController.transitionCoordinator.transitionDuration);//transitionDuration==0.350000
    }
}

- (void)wr_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(pushNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        wrPushDisplayCount = 0;
        [viewController setPushToCurrentVCFinished:YES];
    }];
    [CATransaction setAnimationDuration:wrPushDuration];
    [CATransaction begin];
    [self wr_pushViewController:viewController animated:animated];
    [CATransaction commit];
}

// change navigationBar barTintColor smooth before push to current VC finished or before pop to current VC finished
- (void)pushNeedDisplay
{
    if (self.topViewController != nil && self.topViewController.transitionCoordinator != nil)
    {
        wrPushDisplayCount += 1;
        CGFloat pushProgress = [self wrPushProgress];
        UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
        //[self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:pushProgress];//old
        //zzz
        [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:pushProgress topVC:toVC];//zzz
        
        //NSLog(@"transitionDuration==%f",self.topViewController.transitionCoordinator.transitionDuration);//transitionDuration==0.350000
    }
}

#pragma mark - deal the gesture of return
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    //NSLog(@"");
    __weak typeof (self) weakSelf = self;
    id<UIViewControllerTransitionCoordinator> coor = [self.topViewController transitionCoordinator];
    if ([coor initiallyInteractive] == YES)
    {
        NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
        if ([sysVersion floatValue] >= 10)
        {
            [coor notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                __strong typeof (self) pThis = weakSelf;
                [pThis dealInteractionChanges:context];
            }];
        }
        else
        {
            [coor notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                __strong typeof (self) pThis = weakSelf;
                [pThis dealInteractionChanges:context];
            }];
        }
        return YES;
    }
    
    NSUInteger itemCount = self.navigationBar.items.count;
    NSUInteger n = self.viewControllers.count >= itemCount ? 2 : 1;
    UIViewController *popToVC = self.viewControllers[self.viewControllers.count - n];
    [self popToViewController:popToVC animated:YES];
    return YES;
}

// deal the gesture of return break off
- (void)dealInteractionChanges0:(id<UIViewControllerTransitionCoordinatorContext>)context
{
    void (^animations) (UITransitionContextViewControllerKey) = ^(UITransitionContextViewControllerKey key){
        UIColor *curColor = [[context viewControllerForKey:key] wr_navBarBarTintColor];
        CGFloat curAlpha = [[context viewControllerForKey:key] wr_navBarBackgroundAlpha];
        [self setNeedsNavigationBarUpdateForBarTintColor:curColor];
        [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:curAlpha];
    };
    
    // after that, cancel the gesture of return
    if ([context isCancelled] == YES)
    {
        double cancelDuration = [context transitionDuration] * [context percentComplete];
        [UIView animateWithDuration:cancelDuration animations:^{
            animations(UITransitionContextFromViewControllerKey);
        }];
    }
    else
    {
        // after that, finish the gesture of return
        double finishDuration = [context transitionDuration] * (1 - [context percentComplete]);
        [UIView animateWithDuration:finishDuration animations:^{
            animations(UITransitionContextToViewControllerKey);
        }];
    }
}
- (void)dealInteractionChanges:(id<UIViewControllerTransitionCoordinatorContext>)context
{
    //NSLog(@"");
    void (^animations) (UITransitionContextViewControllerKey) = ^(UITransitionContextViewControllerKey key){
        UIColor *curColor = [[context viewControllerForKey:key] wr_navBarBarTintColor];
        CGFloat curAlpha = [[context viewControllerForKey:key] wr_navBarBackgroundAlpha];
        //[self setNeedsNavigationBarUpdateForBarTintColor:curColor];//old
        //[self setNeedsNavigationBarUpdateForBarBackgroundAlpha:curAlpha];//old
        
        //zzz
        UIImage *vc1_barBgImage = [[context viewControllerForKey:UITransitionContextFromViewControllerKey] wr_navBarBackgroundImage];
        UIImage *vc2_barBgImage = [[context viewControllerForKey:UITransitionContextToViewControllerKey] wr_navBarBackgroundImage];
        if(vc1_barBgImage==nil&&vc2_barBgImage==nil){
            [self setNeedsNavigationBarUpdateForBarTintColor:curColor];//old
            [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:curAlpha];//old
        }else{
            //NSLog(@"");
            if(1){//动画体
                CGFloat curAlpha = [[context viewControllerForKey:key] wr_navBarBackgroundAlpha];
                curAlpha = curAlpha>1.0?1.0:curAlpha;
                [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:curAlpha];
                //topIv:最后要动画成的alph值
                //push
                CGFloat topIvAlpha = 1.0;
                //pop
                if([key isEqualToString:UITransitionContextToViewControllerKey]){
                    topIvAlpha = 0.0;
                }
                [self setNeedsNavigationBarUpdateForBarBackgroundAlpha_topIvAlpha:topIvAlpha];//背景alpha
            }
        }
    };
    
    // after that, cancel the gesture of return
    if ([context isCancelled] == YES)
    {
        double cancelDuration = [context transitionDuration] * [context percentComplete];
        [UIView animateWithDuration:cancelDuration animations:^{
            animations(UITransitionContextFromViewControllerKey);
        }];
    }
    else
    {
        // after that, finish the gesture of return
        double finishDuration = [context transitionDuration] * (1 - [context percentComplete]);
        [UIView animateWithDuration:finishDuration animations:^{
            animations(UITransitionContextToViewControllerKey);
        }];
    }
}

- (void)wr_updateInteractiveTransition:(CGFloat)percentComplete
{
    //NSLog(@"");
    UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
    [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:percentComplete];
    
    [self wr_updateInteractiveTransition:percentComplete];
}

@end


//==========================================================================
#pragma mark - UIViewController
//==========================================================================
@implementation UIViewController (WRAddition)

static char kWRPushToCurrentVCFinishedKey;
static char kWRPushToNextVCFinishedKey;
static char kWRNavBarBackgroundImageKey;
static char kWRNavBarBarTintColorKey;
static char kWRNavBarBackgroundAlphaKey;
static char kWRNavBarTintColorKey;
static char kWRNavBarTitleColorKey;
static char kWRStatusBarStyleKey;
static char kWRNavBarShadowImageHiddenKey;
static char kWRCustomNavBarKey;

// navigationBar barTintColor can not change by currentVC before fromVC push to currentVC finished
- (BOOL)pushToCurrentVCFinished
{
    id isFinished = objc_getAssociatedObject(self, &kWRPushToCurrentVCFinishedKey);
    return (isFinished != nil) ? [isFinished boolValue] : NO;
}
- (void)setPushToCurrentVCFinished:(BOOL)isFinished
{
    objc_setAssociatedObject(self, &kWRPushToCurrentVCFinishedKey, @(isFinished), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// navigationBar barTintColor can not change by currentVC when currentVC push to nextVC finished
- (BOOL)pushToNextVCFinished
{
    id isFinished = objc_getAssociatedObject(self, &kWRPushToNextVCFinishedKey);
    return (isFinished != nil) ? [isFinished boolValue] : NO;
}
- (void)setPushToNextVCFinished:(BOOL)isFinished
{
    objc_setAssociatedObject(self, &kWRPushToNextVCFinishedKey, @(isFinished), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// navigationBar backgroundImage
- (UIImage *)wr_navBarBackgroundImage
{
    UIImage *image = (UIImage *)objc_getAssociatedObject(self, &kWRNavBarBackgroundImageKey);
    image = (image == nil) ? [WRNavigationBar defaultNavBarBackgroundImage] : image;
    return image;
}
- (void)wr_setNavBarBackgroundImage:(UIImage *)image
{
    if ([[self wr_customNavBar] isKindOfClass:[UINavigationBar class]])
    {
//        UINavigationBar *navBar = (UINavigationBar *)[self wr_customNavBar];
//        [navBar wr_setBackgroundImage:image];
    }
    else {
        objc_setAssociatedObject(self, &kWRNavBarBackgroundImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

// navigationBar barTintColor
- (UIColor *)wr_navBarBarTintColor
{
    UIColor *barTintColor = (UIColor *)objc_getAssociatedObject(self, &kWRNavBarBarTintColorKey);
    return (barTintColor != nil) ? barTintColor : [WRNavigationBar defaultNavBarBarTintColor];
}
- (void)wr_setNavBarBarTintColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRNavBarBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([[self wr_customNavBar] isKindOfClass:[UINavigationBar class]])
    {
//        UINavigationBar *navBar = (UINavigationBar *)[self wr_customNavBar];
//        [navBar wr_setBackgroundColor:color];
    }
    else
    {
        BOOL isRootViewController = (self.navigationController.viewControllers.firstObject == self);
        if (([self pushToCurrentVCFinished] == YES || isRootViewController == YES) && [self pushToNextVCFinished] == NO) {
            [self.navigationController setNeedsNavigationBarUpdateForBarTintColor:color];
        }
    }
}

// navigationBar _UIBarBackground alpha
- (CGFloat)wr_navBarBackgroundAlpha
{
    id barBackgroundAlpha = objc_getAssociatedObject(self, &kWRNavBarBackgroundAlphaKey);
    return (barBackgroundAlpha != nil) ? [barBackgroundAlpha floatValue] : [WRNavigationBar defaultNavBarBackgroundAlpha];
    
}
- (void)wr_setNavBarBackgroundAlpha:(CGFloat)alpha
{
    objc_setAssociatedObject(self, &kWRNavBarBackgroundAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([[self wr_customNavBar] isKindOfClass:[UINavigationBar class]])
    {
//        UINavigationBar *navBar = (UINavigationBar *)[self wr_customNavBar];
//        [navBar wr_setBackgroundAlpha:alpha];
    }
    else
    {
        BOOL isRootViewController = (self.navigationController.viewControllers.firstObject == self);
        if (([self pushToCurrentVCFinished] == YES || isRootViewController == YES) && [self pushToNextVCFinished] == NO) {
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:alpha];
        }
    }
}
//zzz
- (void)wr_setNavBarBackgroundAlpha_justValue:(CGFloat)alpha
{
    objc_setAssociatedObject(self, &kWRNavBarBackgroundAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// navigationBar tintColor
- (UIColor *)wr_navBarTintColor
{
    UIColor *tintColor = (UIColor *)objc_getAssociatedObject(self, &kWRNavBarTintColorKey);
    return (tintColor != nil) ? tintColor : [WRNavigationBar defaultNavBarTintColor];
}
- (void)wr_setNavBarTintColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRNavBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([[self wr_customNavBar] isKindOfClass:[UINavigationBar class]])
    {
//        UINavigationBar *navBar = (UINavigationBar *)[self wr_customNavBar];
//        navBar.tintColor = color;
    }
    else
    {
        if ([self pushToNextVCFinished] == NO) {
            [self.navigationController setNeedsNavigationBarUpdateForTintColor:color];
        }
    }
}

// navigationBartitleColor
- (UIColor *)wr_navBarTitleColor
{
    UIColor *titleColor = (UIColor *)objc_getAssociatedObject(self, &kWRNavBarTitleColorKey);
    return (titleColor != nil) ? titleColor : [WRNavigationBar defaultNavBarTitleColor];
}
- (void)wr_setNavBarTitleColor:(UIColor *)color
{
    objc_setAssociatedObject(self, &kWRNavBarTitleColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([[self wr_customNavBar] isKindOfClass:[UINavigationBar class]])
    {
//        UINavigationBar *navBar = (UINavigationBar *)[self wr_customNavBar];
//        navBar.titleTextAttributes = @{NSForegroundColorAttributeName:color};
    }
    else
    {
        if ([self pushToNextVCFinished] == NO) {
            [self.navigationController setNeedsNavigationBarUpdateForTitleColor:color];
        }
    }
}

// statusBarStyle
- (UIStatusBarStyle)wr_statusBarStyle
{
    id style = objc_getAssociatedObject(self, &kWRStatusBarStyleKey);
    return (style != nil) ? [style integerValue] : [WRNavigationBar defaultStatusBarStyle];
}
- (void)wr_setStatusBarStyle:(UIStatusBarStyle)style
{
    objc_setAssociatedObject(self, &kWRStatusBarStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsStatusBarAppearanceUpdate];
}

// shadowImage
- (void)wr_setNavBarShadowImageHidden:(BOOL)hidden
{
    objc_setAssociatedObject(self, &kWRNavBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController setNeedsNavigationBarUpdateForShadowImageHidden:hidden];
    
}
- (BOOL)wr_navBarShadowImageHidden
{
    id hidden = objc_getAssociatedObject(self, &kWRNavBarShadowImageHiddenKey);
    return (hidden != nil) ? [hidden boolValue] : [WRNavigationBar defaultNavBarShadowImageHidden];
}

// custom navigationBar
- (UIView *)wr_customNavBar
{
    UIView *navBar = objc_getAssociatedObject(self, &kWRCustomNavBarKey);
    return (navBar != nil) ? navBar : [UIView new];
}
- (void)wr_setCustomNavBar:(UINavigationBar *)navBar
{
    objc_setAssociatedObject(self, &kWRCustomNavBarKey, navBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        SEL needSwizzleSelectors[3] = {
            @selector(viewWillAppear:),
            @selector(viewWillDisappear:),
            @selector(viewDidAppear:)
        };
        
        for (int i = 0; i < 3;  i++) {
            SEL selector = needSwizzleSelectors[i];
            NSString *newSelectorStr = [NSString stringWithFormat:@"wr_%@", NSStringFromSelector(selector)];
            Method originMethod = class_getInstanceMethod(self, selector);
            Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelectorStr));
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}

- (void)wr_viewWillAppear:(BOOL)animated
{
    //NSLog(@"");
    if ([self canUpdateNavigationBar] == YES)
    {
        [self setPushToNextVCFinished:NO];
        [self.navigationController setNeedsNavigationBarUpdateForTintColor:[self wr_navBarTintColor]];
        [self.navigationController setNeedsNavigationBarUpdateForTitleColor:[self wr_navBarTitleColor]];
    }
    [self wr_viewWillAppear:animated];
    
    //下面这个不起作用，为YES时进不去：怪哉！
//    NSLog(@"self.navigationController.navigationBarHidden==YES");
//    if (@available(iOS 11.0, *)) {
//        if(self.navigationController.navigationBarHidden==YES){
//            [self.navigationController navigationBar:self.navigationController.navigationBar shouldPopItem:nil];
//        }
//    }
}

- (void)wr_viewWillDisappear:(BOOL)animated
{
    //NSLog(@"");
    if ([self canUpdateNavigationBar] == YES) {
        [self setPushToNextVCFinished:YES];
    }
    [self wr_viewWillDisappear:animated];
}

- (void)wr_viewDidAppear:(BOOL)animated
{
    //NSLog(@"");
    if ([self canUpdateNavigationBar] == YES)
    {
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
        
        //测试一下
        //zzz:要么把setNeedsNavigationBarUpdateForShadowImageHidden这一句放在上面的wr_viewWillAppear中，要么改成下面这样：ios11-bug
        if(/* DISABLES CODE */ (0)){
            [self.navigationController setNeedsNavigationBarUpdateForShadowImageHidden:[self wr_navBarShadowImageHidden]];
            [self.navigationController.navigationBar layoutIfNeeded];
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:[self wr_navBarBackgroundAlpha]];
        }
    }
    [self wr_viewDidAppear:animated];
}

- (BOOL)canUpdateNavigationBar
{
    //NSLog(@"self.navigationController.navigationBarHidden==%@",@(self.navigationController.navigationBarHidden));
    //NSLog(@"self.navigationController.viewControllers.count==%@",@(self.navigationController.viewControllers.count));
    //NSLog(@"self.navigationController.navigationBar.items.count==%@",@(self.navigationController.navigationBar.items.count));
        
    //zzz
    //保持原代码逻辑不变，做如下处理：
    if(self.navigationController){
        UIViewController *fromVC = [self.navigationController.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [self.navigationController.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
        if(fromVC==self){//0:当前self的VC的viewWillDisappear
            //原来的
        }else if(toVC==self){//1:viewWillAppear与2:viewDidAppear
            if([self.navigationController.viewControllers containsObject:self]||self.navigationController==self.parentViewController){//直接在导航栏VC中,以防容器类VC的viewWillAppearg与viewDidAppear修改容器VC的导航栏
                return YES;
            }
        }
        //if(fromVC==nil&&toVC==nil){//根vc不在push与pop时,或者tab切换时
        //    return YES;
        //}
    }
    
    if (self.navigationController && CGRectEqualToRect(self.view.frame, [UIScreen mainScreen].bounds)) {
        return YES;
    } else {
        return NO;
    }
}

@end




#pragma mark - UIImage
@implementation UIImage (ZZAdd)
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end



