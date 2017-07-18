//
//  MyActiveIndicatorView.m
//  全局共享指示器
//
//  Created by dongguozheng on 2017/7/18.
//  Copyright © 2017年 dongguozheng. All rights reserved.
//

#import "MyActiveIndicatorView.h"

@interface MyActiveIndicatorView () {
    UIImageView *_reImage;
}
@property (nonatomic ,strong)NSMutableArray *imageArray;
@end
static MyActiveIndicatorView *activeView = nil;
@implementation MyActiveIndicatorView

////获取单利对象
+(MyActiveIndicatorView *)shareActiveIndicatorView{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        activeView = [[MyActiveIndicatorView alloc]init];
    });
    return activeView;
}


//初始化
-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        _reImage = [[UIImageView alloc]init];
        CGRect frame = _reImage.frame;
        frame.size = CGSizeMake(100, 30);
        _reImage.frame = frame;
        CGPoint center = _reImage.center;
        center.x = self.frame.size.width / 2;
        center.y = self.frame.size.height / 2;
        _reImage.contentMode = UIViewContentModeScaleToFill;
        _reImage.center = center;
        [self getImageAnimation:_reImage];
        [self addSubview:_reImage];
        
        //lable
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2+20, self.frame.size.width, 20)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        //菊花
//        UIActivityIndicatorView *ind = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        ind.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//        [ind startAnimating];
//        [self addSubview:ind];
    }
    return self;
}


//开始
+(void)startActive{
    
    //进行安全判断，确认指示器状态
    if ([MyActiveIndicatorView shareActiveIndicatorView].show) {
        return;
    }
    [[[UIApplication sharedApplication].delegate window] addSubview:[MyActiveIndicatorView shareActiveIndicatorView]];
    
    //修改指示器状态
    [MyActiveIndicatorView shareActiveIndicatorView].show = YES;
}

//关闭
+(void)stopActive{
    
    if ([MyActiveIndicatorView shareActiveIndicatorView].show) {
        [[MyActiveIndicatorView shareActiveIndicatorView] removeFromSuperview];
    }
    [MyActiveIndicatorView shareActiveIndicatorView].show = NO;
}

//设置文字
+(void)setText:(NSString *)text{
    [MyActiveIndicatorView shareActiveIndicatorView].titleLabel.text = text;
}


//加载动图
-(void)getImageAnimation:(UIImageView *)image{
    NSMutableArray *imageArray=[NSMutableArray array];
    for (int i=0; i<11; i++) {
        NSString *str=[NSString stringWithFormat:@"refresh%d",i];
        NSString *path=[[NSBundle mainBundle]pathForResource:str ofType:@"png"];
        UIImage *image=[UIImage imageWithContentsOfFile:path];
        [imageArray addObject:image];
    }
    image.animationImages=imageArray;
    image.animationDuration=1;
    image.animationRepeatCount=0;
    [image startAnimating];
}

@end
