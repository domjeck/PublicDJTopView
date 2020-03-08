//
//  DJTopAlertViewManager.m
//  topAlertDemo
//
//  Created by yh-imac on 2020/3/2.
//  Copyright © 2020 hselenat. All rights reserved.
//

#import "DJTopAlertViewManager.h"
@interface DJTopAlertViewManager()
@property (nonatomic, assign) NSInteger dismisstime;

@property (nonatomic,strong) NSTimer *dismisTimer;

@end
@implementation DJTopAlertViewManager
#pragma mark 创建单例
+ (DJTopAlertViewManager *)shareManager
{
    static DJTopAlertViewManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[DJTopAlertViewManager alloc]init];
        shareManager.alertView = [[DJTopAlertView alloc]init];
        shareManager.alertView.userInteractionEnabled = YES;
        //添加手势
        //滑动手势，关闭view
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:shareManager action:@selector(dismissWithType:)];
        [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
        [shareManager.alertView addGestureRecognizer:recognizer];
        //点击手势，关闭view，触发代理
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:shareManager action:@selector(dismissWithType:)];
        [shareManager.alertView addGestureRecognizer:tap];
    });
    return shareManager;
}
#pragma mark 显示弹窗
- (void)showWithType:(topAlertType)type title:(NSString *)title
{
    _dismisstime = 3;//将时间重置为0
    self.dismisTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                          target:self
                                                        selector:@selector(dismisAlertWithTimer:)
                                                        userInfo:nil
                                                         repeats:YES];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow addSubview:self.alertView];
        [self.alertView alertWithType:type title:title];
        
        [self.alertView show];
    });
}
- (void)dismisAlertWithTimer:(NSTimer *)timer
{
    _dismisstime--;
    if (_dismisstime == 0){
        [self.dismisTimer invalidate];
        
        [self.alertView dismiss];
    }
}
- (void)dismissWithType:(UIGestureRecognizer*)type{
    
    _dismisstime = 3;
    [self.dismisTimer invalidate];
    [self.alertView dismiss];

    if ([type isKindOfClass:[UITapGestureRecognizer class]]) {

        if (self.block) {
            _block(didSelectedDJTopAlertViewDone);
        }
        
    }else{
        
        if (self.block) {
            _block(didSelectedDJTopAlertViewCancle);
        }
        
    }
    [self.alertView dismiss];
}

@end
