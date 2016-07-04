//
//  UIButton+regis.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "UIButton+regis.h"

@implementation UIButton (regis)
- (void)startWithTime:(NSInteger)startTime title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mainColor countColor:(UIColor *)countColor {
    __block NSInteger timeOut = startTime;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut <=0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = mainColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }
        else {
            int allTime = (int)timeOut +1;
            int seconds = timeOut%allTime;
            NSString* timeString = [NSString stringWithFormat:@"%0.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = countColor;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeString,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
            
            
            
        }
    });
    dispatch_resume(timer);
    
    
}
@end
