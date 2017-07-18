//
//  ViewController.m
//  全局共享指示器
//
//  Created by dongguozheng on 2017/7/18.
//  Copyright © 2017年 dongguozheng. All rights reserved.
//

#import "ViewController.h"
#import "MyActiveIndicatorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [MyActiveIndicatorView setText:@"精彩内容，马上开始~"];
    [MyActiveIndicatorView startActive];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        [MyActiveIndicatorView stopActive];
//
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
