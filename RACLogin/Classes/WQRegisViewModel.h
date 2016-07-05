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
    WQRegisViewModelStatus_Doding = 1,  //注册中
    WQRegisViewModelStatus_Success,  //注册成功
    WQRegisViewModelStatus_Fail,    //注册失败
    WQSnedCodeViewModelStatus_Doding,//发送中
    WQSendCodeViewModelStatus_Success,//发送成功
    WQSendCodeViewModelStatus_Fail//发送失败
    
};
@interface WQRegisViewModel : NSObject
@property(nonatomic, strong) NSString* phoneNum;
@property(nonatomic, strong) NSString* securityCode;
@property(nonatomic, strong) NSError* error;
@property(nonatomic, assign )WQRegisViewModelStatus status;
@property(nonatomic, strong) RACSignal* enablePhoneNumTextField;
@property(nonatomic, strong) RACSignal* enableSecurityCodeTextField;
@property(nonatomic, strong) RACCommand* regisCommand;
@property(nonatomic, strong) RACCommand* sendCodeCommand;




-(void)initEnableSignal;
-(RACSignal*)requestRegisSignal;
-(RACSignal*)requestSecurityCode;

@end
