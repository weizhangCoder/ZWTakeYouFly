//
//  AppDelegate+configThird.m
//  ZWTakeYouFly
//
//  Created by 张三 on 8/3/18.
//  Copyright © 2018年 zw. All rights reserved.
//

#import "AppDelegate+configThird.h"
#import "HcdGuideView.h"
#import <Bugly/Bugly.h>
#import "XHLaunchAd.h"

@implementation AppDelegate (configThird)

- (void)configBase{
    [self initWindow];
     // 1.键盘全局设置
    [self configureKeyboard];
    //
    [self configBugly];
    
    //    [self configLaunchAd];
    
    //    [self addGuideView];
    
    [self setUpFixiOS11]; //适配IOS 11
    
}
#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[UIButton appearance] setExclusiveTouch:YES];
    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
//    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = KWhiteColor;
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}
- (void)configLaunchAd{
    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];
    
    //配置广告数据
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"http://yun.it7090.com/image/XHLaunchAd/pic01.jpg";
    //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    imageAdconfiguration.openModel = @"http://www.it7090.com";
    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
    
}
#pragma mark - 适配
- (void)setUpFixiOS11
{
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}
- (void)configureKeyboard
{
    //1. 全局键盘设置
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldShowTextFieldPlaceholder = NO;
    manager.shouldResignOnTouchOutside = YES;
    manager.keyboardDistanceFromTextField = 90;
    //最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一个输入框点击完成，自动收起键盘
    manager.toolbarManageBehaviour =IQAutoToolbarByTag;
    manager.toolbarDoneBarButtonItemText =@"完成";//将右边Done改成完成
}
- (void)configBugly{
    BuglyConfig *config = [[BuglyConfig alloc]init];
//    config.delegate = self;
    config.debugMode = YES;
    config.version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    config.reportLogLevel = BuglyLogLevelInfo;
    [Bugly startWithAppId:@"9c97f1a1bf"
#if DEBUG
        developmentDevice:YES
#endif
                   config:config];
    
}

- (void)addGuideView{
    NSMutableArray *images = [NSMutableArray new];
    
    [images addObject:[UIImage imageNamed:@"1"]];
    [images addObject:[UIImage imageNamed:@"2"]];
    [images addObject:[UIImage imageNamed:@"3"]];
    if (images.count == 0) return;
    HcdGuideView *guideView = [HcdGuideView sharedInstance];
    guideView.window = self.window;
    [guideView showGuideViewWithImages:images
                        andButtonTitle:@"立即体验"
                   andButtonTitleColor:[UIColor whiteColor]
                      andButtonBGColor:[UIColor clearColor]
                  andButtonBorderColor:[UIColor whiteColor]];
    
    
}
//#pragma mark - BuglyDelegate
//
//-(NSString *)attachmentForException:(NSException *)exception{
//    //    [Bugly reportException:exception];
//    return [NSString stringWithFormat:@"exceptionInfo:\nname:%@\nreason:%@",exception.name,exception.reason];
//}


@end
