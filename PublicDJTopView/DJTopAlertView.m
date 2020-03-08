//
//  topAlertView.m
//  topAlertDemo
//
//  Created by yh-imac on 2020/3/2.
//  Copyright © 2020 hselenat. All rights reserved.
//

#import "DJTopAlertView.h"

#define ViewHeight 64
#define DJStartHeight [UIScreen mainScreen].bounds.size.height
#define DJStartWidth [UIScreen mainScreen].bounds.size.width

#define Sta_Height [[UIApplication sharedApplication] statusBarFrame].size.height
#define FullScreen       Sta_Height==44.f
#define Nav_Height       (FullScreen?88.f:64.f)

@interface DJTopAlertView()

@property (nonatomic, strong) UILabel *titleLabel;
//最左侧imageview
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;

@end
@implementation DJTopAlertView

#pragma mark 初始化
- (instancetype)init{
    if (self = [super init]) {
        
        self.frame = CGRectMake(_leftRightMargin, -Nav_Height, DJStartWidth-_leftRightMargin*2, ViewHeight);
        [self setBackgroundColor:[UIColor blackColor]];
        //初始化宽高
        self.tipsStr = @"";
        self.leftRightMargin = 20;
        self.cornerRadiusFloat = 0;
        self.alertBgColor = [UIColor whiteColor];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.cornerRadiusFloat;
        NSLog(@"123");
    }
    return self;
}
#pragma mark UI初始化
- (void)setLeftRightMargin:(CGFloat)leftRightMargin{
    _leftRightMargin = leftRightMargin;
    self.frame = CGRectMake(leftRightMargin, self.frame.origin.y, DJStartWidth-leftRightMargin*2, self.frame.size.height);
}
- (void)setAlertBgColor:(UIColor *)alertBgColor{
    
    _alertBgColor = alertBgColor;
    [self setBackgroundColor:_alertBgColor];
    
}
#pragma 中心的centerImageView
- (UIImageView *)centerImageView{
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] init];
        _centerImageView.frame = CGRectMake(self.frame.size.width*0.25, (ViewHeight - 30)/2, 30, 30);
        _centerImageView.layer.masksToBounds = YES;
        _centerImageView.layer.cornerRadius = 15;
        [self addSubview:_centerImageView];
    }
    return _centerImageView;
}
#pragma 左侧的leftImageView
- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.frame = CGRectMake(10, (ViewHeight - 40)/2, 40, 40);
        _leftImageView.layer.masksToBounds = YES;
        _leftImageView.layer.cornerRadius = 20;
        [self addSubview:_leftImageView];
    }
    return _leftImageView;
}
#pragma 左侧的icon
- (void)setLeftIcon:(UIImage *)leftIcon{
    if (!leftIcon) {
        _leftIcon = [UIImage imageNamed:@""];
    }else{
        _leftIcon = leftIcon;
    }
    float w = 0;
    if (_leftIcon) {
        w = 45;
    }
    _titleLabel.frame = CGRectMake(w, (ViewHeight-40)/2, self.frame.size.width - w*2, 40);
    [self.leftImageView setImage:_leftIcon];
}
#pragma titleLabel
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        float w = 0;
        if (_leftIcon) {
            w = 45;
        }
        _titleLabel.frame = CGRectMake(w, (ViewHeight-40)/2, self.frame.size.width - w*2, 40);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}
#pragma titleLabel.text
- (void)setTipsStr:(NSString *)tipsStr{
    if (!tipsStr) {
        _tipsStr = @"";
    }else{
        _tipsStr = tipsStr;
    }
    self.titleLabel.text = _tipsStr;
}
#pragma centerIcon 富文本形式添加图片
- (void)setCenterIcon:(UIImage *)centerIcon{
    
    _centerIcon = centerIcon;
    if (!centerIcon) {
        _centerIcon = [UIImage imageNamed:@""];
    }else{
        _centerIcon = centerIcon;
    }
    float w = 0;
    if (_centerIcon) {
        w = 45;
    }
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(self.centerImageView.frame)+10, (ViewHeight-40)/2, self.frame.size.width - w*2, 40);
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.centerImageView setImage:_centerIcon];
}
#pragma 设置字体颜色
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.titleLabel.textColor = _textColor;
}
#pragma 设置圆角
- (void)setCornerRadiusFloat:(CGFloat)cornerRadiusFloat{
    _cornerRadiusFloat = cornerRadiusFloat;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = _cornerRadiusFloat;
}
#pragma mark 根据Type设置视图
- (void)alertWithType:(topAlertType)type title:(NSString *)title{
    
    self.tipsStr = title;
    self.titleLabel.text = title;
    switch (type)
    {
        case topAlertTypeSuccess:
        {
            self.backgroundColor = self.alertBgColor;
            self.titleLabel.textColor = [UIColor blackColor];
            self.textColor = [UIColor blackColor];
        }
            break;
        case tohnTopAlertTypeError:
        {
            self.backgroundColor = self.alertBgColor;
            self.titleLabel.textColor = [UIColor blackColor];
            self.textColor = [UIColor blackColor];
        }
            break;
        case tohnTopAlertTypeMessage:
        {
            self.backgroundColor = self.alertBgColor;
            self.titleLabel.textColor = [UIColor blackColor];
            self.textColor = [UIColor blackColor];
            
        }
            break;
        
        default:
            break;
    }

}
#pragma mark -  展示提示框
- (void)show{
    
    [UIView animateWithDuration:0.618f
                     delay:0
    usingSpringWithDamping:0.9f
     initialSpringVelocity:8.0f
                   options:UIViewAnimationOptionCurveEaseInOut
                animations:^{

                    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];

                    self.center = CGPointMake(self.center.x, 32+Nav_Height);

                }completion:^(BOOL finished) {
                    
                }];

}
#pragma mark - 移除提示框
- (void)removeAlert{
    __weak typeof(self) weakSelf = self;
    [UIView transitionWithView:self duration:0.25 options:0 animations:^{
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2,-ViewHeight/2);
    } completion:^(BOOL finished) {
        
        weakSelf.leftRightMargin = 20;

        //左边icon
        weakSelf.leftIcon = [UIImage imageNamed:@""];
        [weakSelf.leftImageView removeFromSuperview];
        weakSelf.leftImageView = nil;
        //中间icon
        weakSelf.centerIcon = [UIImage imageNamed:@""];
        [weakSelf.centerImageView removeFromSuperview];
        weakSelf.centerImageView = nil;
        //标题颜色
        weakSelf.textColor = [UIColor clearColor];
        //标题
        weakSelf.tipsStr = @"";
        //圆角
        weakSelf.cornerRadiusFloat = 0;
        weakSelf.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [weakSelf removeFromSuperview];
    }];
    
    
}
- (void)dismiss{
    [self removeAlert];
}
@end
