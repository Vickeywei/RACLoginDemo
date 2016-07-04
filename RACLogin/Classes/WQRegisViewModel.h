//
//  WQRegisViewModel.h
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
typedef NS_ENUM(NSInteger, WQRegisViewModelStatus) {
    WQRegisViewModelStatus_Doding = 1,  //请求中
    WQRegisViewModelStatus_Success,  //请求成功
    WQRegisViewModelStatus_Fail    //请求失败
};
@interface WQRegisViewModel : NSObject
@property(nonatomic, strong) NSString* phoneNum;
@property(nonatomic, strong) NSString* securityCode;
@property(nonatomic, strong) NSError* error;
@property(nonatomic, assign )WQRegisViewModelStatus status;
@property(nonatomic,strong) RACSignal* enablePhoneNumTextField;
@property(nonatomic,strong) RACSignal* enableSecurityCodeTextField;
@property(nonatomic,strong) RACCommand* regisCommand;
@property(nonatomic,strong) RACCommand* sendCodeCommand;


-(void)initEnableSignal;
-(RACSignal*)requestRegisSignal;
-(RACSignal*)requestSecurityCode;

@end
