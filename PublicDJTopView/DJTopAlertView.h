//
//  DJTopAlertView.h
//  topAlertDemo
//
//  Created by yh-imac on 2020/3/2.
//  Copyright © 2020 hselenat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    tohnTopAlertTypeError   = 0,  //失败
    topAlertTypeSuccess     = 1,  //成功
    tohnTopAlertTypeMessage = 2,  //普通提示消息
}topAlertType;

@interface DJTopAlertView : UIView
//提示框背景颜色，默认颜色 白色
@property (nonatomic,weak) UIColor *alertBgColor;
//提示框左右边距，默认20
@property (nonatomic,assign) CGFloat leftRightMargin;
//左边icon
@property (nonatomic,strong) UIImage *leftIcon;
//中间icon
@property (nonatomic, strong) UIImage *centerIcon;
//标题颜色
@property (nonatomic,strong) UIColor *textColor;
//标题
@property (nonatomic, strong) NSString *tipsStr;
//圆角
@property (nonatomic, assign) CGFloat cornerRadiusFloat;

- (void)alertWithType:(topAlertType)type title:(NSString *)title;

- (void)show;
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
