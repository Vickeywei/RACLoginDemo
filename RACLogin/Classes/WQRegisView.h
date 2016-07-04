//
//  WQRegisView.h
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@interface WQRegisView : UIView
//用户注册输入框
@property(nonatomic, strong) UITextField* phoneNumTextField;
@property(nonatomic, strong) UIImageView* phoneNumTextFieldBackgroudImageView;
@property(nonatomic, strong) UIView* phoneNumTextFieldLeftView;
@property(nonatomic, strong) UIImageView* phoneNumTextFieldImageIcon;

//验证码输入框
@property(nonatomic, strong) UITextField* securityCodeTextField;
@property(nonatomic, strong) UIImageView* securityCodeTextFieldBackgroundImageView;
@property(nonatomic, strong) UIView* securityCodeTextFieldLeftView;
@property(nonatomic, strong) UIImageView* securityCodeTextFieldImageIcon;

//发送验证码按钮
@property(nonatomic, strong) UIButton* sendCodeBtn;
@property(nonatomic, strong) UIImage* sendCodeBtnBackgroundImage;
@property(nonatomic, assign) CGFloat  circularBead;
@property(nonatomic, strong) UIColor* titleColor;
@property(nonatomic, strong) UIColor* sendColor;


//注册按钮
@property(nonatomic, strong) UIButton* regisButton;
@property(nonatomic, strong) UIImage* regisButtonBackImage;
@property(nonatomic, assign) CGFloat regisCircularBead;

//注册按钮和发送验证码按钮是否切圆角
@property(nonatomic, assign) BOOL isCirCular;
@property(nonatomic, strong) RACSubject* sendRecondSignal;


- (instancetype)initWithFrame:(CGRect)frame
     sendCodeButtonTitleColor:(UIColor*)titleColor
                    sendColor:(UIColor*)sendColor;




@end
