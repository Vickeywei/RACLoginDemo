//
//  NSString+PhoneNum.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/5.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "NSString+PhoneNum.h"

@implementation NSString (PhoneNum)
- (BOOL)scannerPhoneNum {
    NSString* phoneRegex = @"^1[3|4|5|6|7|8][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
    
}
@end
