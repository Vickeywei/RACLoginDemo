//
//  WQLoginViewModel.m
//  textRunloop
//
//  Created by 魏琦 on 16/6/30.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQLoginViewModel.h"
@interface WQLoginViewModel()
@property(nonatomic,strong) RACSignal *enableLoginSignal;//login的状态
@end

@implementation WQLoginViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initEnableSignal];
        
        [self bindSignal];
    }
    return self;
}
- (void)initEnableSignal {
    _enableUserNameSignal = [RACObserve(self, userName) map:^id(NSString* userName) {
        return @(userName.length >0);
    }];
    _enablePasswordSignal = [RACObserve(self, password) map:^id(NSString* password) {
        return @(password.length>0);
    }];
    
    _enableLoginSignal = [RACSignal combineLatest:@[_enableUserNameSignal,_enablePasswordSignal] reduce:^id(NSNumber* value1,NSNumber* value2){
        NSLog(@"%@,%@",value1,value2);
        return @([value1 boolValue] && [value2 boolValue]);
    }];
    
    
}
- (void)bindSignal {
    _lohinCommand = [[RACCommand alloc] initWithEnabled:self.enableLoginSignal signalBlock:^RACSignal *(id input) {
        return [self requestLoginSignal];
        
    }];
    // 登录成功
    @weakify(self);
    [_lohinCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        self.status = WQLoginViewModelStatus_Success;
    }];
    
    // 登录失败
    [_lohinCommand.errors subscribeNext:^(id x) {
        @strongify(self);
        self.error = x;
        self.status = WQLoginViewModelStatus_Fail;
    }];
    
    // 登录中
    [[_lohinCommand.executing skip:1] subscribeNext:^(id x) {
        @strongify(self);
        BOOL result = [x boolValue];
        if (result) {
            self.status = WQLoginViewModelStatus_Doding;
        }
    }];
}

- (RACSignal *)requestLoginSignal {
    return nil;
}


@end
