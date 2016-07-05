//
//  WQRegisViewModel.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQRegisViewModel.h"
#import "UIButton+regis.h"
#import <UIKit/UIKit.h>
@interface WQRegisViewModel ()
@property(nonatomic, strong)RACSignal* enableRegisSignal;
@property(nonatomic, strong)RACSignal* enableSendCodeSignal;



@end

@implementation WQRegisViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initEnableSignal];
        [self bindSignal];
    }
    return self;
    
}



- (RACSignal *)requestRegisSignal {
    return nil;
}

- (void)bindSignal {
    _regisCommand = [[RACCommand alloc] initWithEnabled:_enableRegisSignal signalBlock:^RACSignal *(id input) {
      return  [self requestRegisSignal];
        
    }];
    _sendCodeCommand = [[RACCommand alloc] initWithEnabled:_enableSendCodeSignal signalBlock:^RACSignal *(id input) {
        NSLog(@"%@",input);
        UIButton* button = input;
        UIColor* mainColor = [UIColor whiteColor];
        UIColor* countColor = [UIColor cyanColor];
        [button startWithTime:60 title:@"获取验证码" countDownTitle:@"重新获取" mainColor:mainColor countColor:countColor];
        
        return [self requestSecurityCode];
        
        
    }];
    // 注册成功
    @weakify(self);
    [_regisCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        self.status = WQRegisViewModelStatus_Success;
    }];
    
    // 注册失败
    [_regisCommand.errors subscribeNext:^(id x) {
        @strongify(self);
        self.error = x;
        self.status = WQRegisViewModelStatus_Fail;
    }];
    
    // 注册中
    [[_regisCommand.executing skip:1] subscribeNext:^(id x) {
        @strongify(self);
        BOOL result = [x boolValue];
        if (result) {
            self.status = WQRegisViewModelStatus_Doding;
        }
    }];
    // 验证码发送成功
    
    [_sendCodeCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        self.status = WQSendCodeViewModelStatus_Success;
    }];
    
    // 验证码发送失败
    [_sendCodeCommand.errors subscribeNext:^(id x) {
        @strongify(self);
        self.error = x;
        self.status = WQSendCodeViewModelStatus_Fail;
    }];
    
    // 验证码发送中
    [[_sendCodeCommand.executing skip:1] subscribeNext:^(id x) {
        @strongify(self);
        BOOL result = [x boolValue];
        if (result) {
            self.status = WQSnedCodeViewModelStatus_Doding;
        }
    }];
    
}

- (RACSignal *)requestSecurityCode {
    return nil;
    
}

- (void)initEnableSignal {
    

    _enablePhoneNumTextField = [RACObserve(self, phoneNum) map:^id(NSString* phoneNum) {
        return @(phoneNum.length > 0);
    }];
    
    _enableSecurityCodeTextField = [RACObserve(self, securityCode) map:^id(NSString* securityCode) {
        return @(securityCode.length == 6);
    }];
    
    _enableRegisSignal = [RACSignal combineLatest:@[_enableSecurityCodeTextField,_enablePhoneNumTextField] reduce:^id(NSNumber* value1, NSNumber* value2){
        return @([value1 boolValue] && [value2 boolValue]);
    }];
    _enableSendCodeSignal = [RACSignal combineLatest:@[_enablePhoneNumTextField] reduce:^id(NSNumber* value1){
        return @([value1 boolValue]);
        
    }];
    

}
@end
