//
//  WQLoginViewModel.h
//  textRunloop
//
//  Created by 魏琦 on 16/6/30.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
typedef NS_ENUM(NSInteger, WQLoginViewModelStatus) {
    WQLoginViewModelStatus_Doding = 1,  //请求中
    WQLoginViewModelStatus_Success,  //请求成功
    WQLoginViewModelStatus_Fail    //请求失败
};
@interface WQLoginViewModel : NSObject
@property(nonatomic,strong) NSError* error;
@property(nonatomic,assign) WQLoginViewModelStatus status;
@property(nonatomic,strong) NSString* userName;
@property(nonatomic,strong) NSString* password;
@property(nonatomic,strong) RACSignal* enableUserNameSignal;
@property(nonatomic,strong) RACSignal* enablePasswordSignal;
@property(nonatomic,strong) RACCommand* lohinCommand;

-(void)initEnableSignal;
-(RACSignal*)requestLoginSignal;



@end
