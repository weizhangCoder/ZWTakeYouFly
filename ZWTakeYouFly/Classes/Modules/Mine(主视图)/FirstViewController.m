//
//  FirstViewController.m
//  ZWTakeYouFly
//
//  Created by zhangwei on 17/7/24.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

#pragma mark --------------------------LifeCycle----------------------/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

     NSLog(@"viewDid  %@",NSStringFromCGRect(self.view.frame));
    UIButton * add = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:add];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent = NO;
    }
//    
//    UIButton * add_2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    add_2.frame = CGRectMake(0, self.view.frame.size.height - 20 - 49 - 64 - 34 - 24, 20, 20);
//    [self.view addSubview:add_2];
//    self.view.backgroundColor = [UIColor redColor];
////    [self.navigationController setNavigationBarHidden:YES];
    
       NSLog(@"viewDidLayoutSubviews  %@",NSStringFromCGRect(self.view.frame));
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
      NSLog(@"viewDidLayoutSubviews  %@",NSStringFromCGRect(self.view.frame));
    
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
