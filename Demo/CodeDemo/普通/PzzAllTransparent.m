//
//  WeiBoMineController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar

#import "PzzAllTransparent.h"
#import "WRNavigationBar.h"
#import "AppDelegate.h"
//
#import "PzzAllTransparent2.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 220
#define NAV_HEIGHT 64

@interface PzzAllTransparent () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *topView;
@end

@implementation PzzAllTransparent

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.topView;
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"··· " style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    if(1){
        //方式一：一个空图片+返回文字
        if(0){
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            self.navigationItem.leftBarButtonItems = @[backItem, titleItem];
        }
        
        //方式二：一个图片
        if(1){
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navLeft"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            self.navigationItem.leftBarButtonItems = @[leftItem];
        }
        
        //方式三：
        if(0){
            self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"navRight"];
            self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"navRight"];
            UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            self.navigationItem.backBarButtonItem = titleItem;
            
        }
        
        //右边
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navRight"] style:UIBarButtonItemStylePlain target:self action:@selector(next)];
        self.navigationItem.rightBarButtonItems = @[rightItem];
    }
    
    // 设置导航栏颜色s
    //[self wr_setNavBarBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
    
    // 设置自定义导航栏背景图片
    [self wr_setNavBarBackgroundImage:[UIImage imageNamed:@"millcolorGrad"]];
    
    // 设置初始导航栏透明度
    [self wr_setNavBarBackgroundAlpha:0];
    
    // 设置导航栏按钮和标题颜色
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
}


- (void)next {
    PzzAllTransparent2 *allTransparent = [PzzAllTransparent2 new];
    allTransparent.title = [NSString stringWithFormat:@"好2-%d",self.navigationController.viewControllers.count];
    [self.navigationController pushViewController:allTransparent animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self wr_setNavBarBackgroundAlpha:alpha];
        //[self wr_setNavBarTintColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        //[self wr_setNavBarTitleColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
        //[self wr_setStatusBarStyle:UIStatusBarStyleDefault];
    }
    else
    {
        [self wr_setNavBarBackgroundAlpha:0];
        [self wr_setNavBarTintColor:[UIColor whiteColor]];
        [self wr_setNavBarTitleColor:[UIColor whiteColor]];
        [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==4){
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = MainViewColor;
        vc.title = [NSString stringWithFormat:@"好-%d",self.navigationController.viewControllers.count];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if(indexPath.row==5){
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = MainViewColor;
        vc.title = [NSString stringWithFormat:@"好-%d",self.navigationController.viewControllers.count];
        [vc wr_setNavBarBackgroundImage:[UIImage imageNamed:@"millcolorGrad"]];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if(indexPath.row==6){
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = MainViewColor;
        vc.title = [NSString stringWithFormat:@"好-%d",self.navigationController.viewControllers.count];
        [vc wr_setNavBarBackgroundImage:[UIImage imageNamed:@"imageNav"]];
        [vc wr_setNavBarBackgroundAlpha:0.5];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    PzzAllTransparent *allTransparent = [PzzAllTransparent new];
    allTransparent.title = [NSString stringWithFormat:@"好-%d",self.navigationController.viewControllers.count];
    [self.navigationController pushViewController:allTransparent animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(-0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)topView
{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wbBG"]];
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, IMAGE_HEIGHT);
    }
    return _topView;
}

@end
