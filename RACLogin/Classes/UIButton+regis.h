//
//  UIButton+regis.h
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (regis)
/**
 *  注册倒计时
 *
 *  @param startTime  倒计时总时长
 *  @param title      还没开始倒计时的title
 *  @param subTitle   倒计时时的title
 *  @param mainColor  倒计时前的颜色
 *  @param countColor 倒计时时的颜色
 */
- (void)startWithTime:(NSInteger)startTime title:(NSString*)title countDownTitle:(NSString*)subTitle
            mainColor:(UIColor*)mainColor countColor:(UIColor*)countColor;

@end
