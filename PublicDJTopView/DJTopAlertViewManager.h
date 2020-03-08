//
//  DJTopAlertViewManager.h
//  topAlertDemo
//
//  Created by yh-imac on 2020/3/2.
//  Copyright © 2020 hselenat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJTopAlertView.h"
NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    didSelectedDJTopAlertViewDone   = 0,  //点击继续完成
    didSelectedDJTopAlertViewCancle  = 1,  //点击取消
}didSelectedDJTopAlertViewType;

typedef void(^didSelectedTopAlertView)(didSelectedDJTopAlertViewType type);//传参类型及形参
@interface DJTopAlertViewManager : NSObject
@property (nonatomic, strong) DJTopAlertView *alertView;
@property(nonatomic, strong) didSelectedTopAlertView block;

+ (DJTopAlertViewManager *)shareManager;

- (void)showWithType:(topAlertType)type title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
