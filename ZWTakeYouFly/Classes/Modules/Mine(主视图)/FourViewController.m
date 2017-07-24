//
//  FourViewController.m
//  ZWTakeYouFly
//
//  Created by zhangwei on 17/7/24.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "FourViewController.h"
#import "WRNavigationBar.h"

@interface FourViewController ()

@end

@implementation FourViewController

#pragma mark --------------------------LifeCycle----------------------/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [UIColor wr_setDefaultNavBarTintColor:[UIColor blackColor]];
    // 设置导航栏标题默认颜色
    [UIColor wr_setDefaultNavBarTitleColor:[UIColor blackColor]];
     [self wr_setNavBarBackgroundAlpha:0.2];
    
}
#pragma mark --------------------------SetUp----------------------/


#pragma mark --------------------------NetWork----------------------/


#pragma mark --------------------------Event----------------------/


#pragma mark --------------------------Lazy----------------------/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
