//
//  WQLoginView.h
//  textRunloop
//
//  Created by 魏琦 on 16/6/30.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQLoginView : UIView
//icon
@property(nonatomic, strong) UIImageView* iconImageView;

//用户名
@property(nonatomic, strong) UITextField* userName;
@property(nonatomic, strong) UIView* userLeftView;
@property(nonatomic, strong) UIImageView* userNameBackgroundImageview;
@property(nonatomic, strong) UIImageView* userNameIcon;

//密码
@property(nonatomic, strong) UITextField* password;
@property(nonatomic, strong) UIView* passwoedLeftView;
@property(nonatomic, strong) UIImageView* passwordBackgroundImageView;
@property(nonatomic, strong) UIImageView* passwordImageView;

//登录按钮
@property(nonatomic, strong) UIButton* loginButton;
//注册按钮
@property(nonatomic, strong) UIButton* regisButton;
//忘记密码按钮
@property(nonatomic, strong) UIButton* fogotPasswordButton;
//公司署名或电话
@property(nonatomic, strong) UILabel* telLabel;

@end
