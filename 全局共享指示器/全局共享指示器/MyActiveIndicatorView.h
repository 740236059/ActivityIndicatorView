//
//  MyActiveIndicatorView.h
//  全局共享指示器
//
//  Created by dongguozheng on 2017/7/18.
//  Copyright © 2017年 dongguozheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyActiveIndicatorView : UIView


//获取单利对象
+(MyActiveIndicatorView *)shareActiveIndicatorView;

//开始
+(void)startActive;

//关闭
+(void)stopActive;

//设置文案
+(void)setText:(NSString *)text;

@property (nonatomic ,strong)UILabel *titleLabel;

@property (nonatomic ,assign)BOOL show;

@end
