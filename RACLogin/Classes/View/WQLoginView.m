//
//  WQLoginView.m
//  textRunloop
//
//  Created by 魏琦 on 16/6/30.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQLoginView.h"
#import <Masonry.h>
#import "UIImage+Resize.h"
#import "NSString+Size.h"
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
@implementation WQLoginView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
        [self addConstraint];
        
    }
    return self;
}

- (void)setUpView {
    
    //icon
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"logo"];
    [self addSubview:_iconImageView];
    
    //账户
    _userName = [[UITextField alloc] init];
    _userName.backgroundColor = [UIColor clearColor];
    _userName.font = [UIFont systemFontOfSize:14];
    _userName.placeholder = @"账号";
    _userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_userName];
    
    
    _userLeftView = [[UIView alloc]init];
    _userName.leftView = _userLeftView;
    _userName.leftViewMode = UITextFieldViewModeAlways;
    
    
    _userNameIcon = [[UIImageView alloc] init];
    _userNameIcon.image = [UIImage imageNamed:@"accout_icon_normal"];
    _userNameIcon.highlightedImage = [UIImage imageNamed:@"accout_icon_high"];
    [_userLeftView addSubview:_userNameIcon];
    
    _userNameBackgroundImageview = [[UIImageView alloc] init];
    _userNameBackgroundImageview.image = [UIImage resizedImageWithName:@"text_input_normal"];
    _userNameBackgroundImageview.highlightedImage = [UIImage resizedImageWithName:@"text_input_high"];
     [self addSubview:_userNameBackgroundImageview];
    
    //密码
    _password = [[UITextField alloc] init];
    _password.clearButtonMode = UITextFieldViewModeWhileEditing;
    _password.backgroundColor = [UIColor clearColor];
    _password.placeholder = @"密码";
    _password.font = [UIFont systemFontOfSize:14];
    [self addSubview:_password];
    
    
    _passwordBackgroundImageView = [[UIImageView alloc] init];
    _passwordBackgroundImageView.image = [UIImage resizedImageWithName:@"text_input_normal"];
    _passwordBackgroundImageView.highlightedImage = [UIImage resizedImageWithName:@"text_input_high"];
    [self addSubview:_passwordBackgroundImageView];
    
    _passwoedLeftView = [[UIView alloc] init];
    _password.leftViewMode = UITextFieldViewModeAlways;
    _password.leftView = _passwoedLeftView;
    
    _passwordImageView = [[UIImageView alloc] init];
    _passwordImageView.image = [UIImage imageNamed:@"password_icon_normal"];
    _passwordImageView.highlightedImage = [UIImage imageNamed:@"password_icon_high"];
    [_passwoedLeftView addSubview:_passwordImageView];
    
    //登录按钮
    
    _loginButton = [[UIButton alloc] init];
    _loginButton = [[UIButton alloc]init];
   
    [_loginButton setTitleColor:RGB(135, 135, 135) forState:UIControlStateDisabled];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_disabled"] forState:UIControlStateDisabled];
    [_loginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_normal"] forState:UIControlStateNormal];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_loginButton];
    _regisButton = [[UIButton alloc]init];

    _regisButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_regisButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [_regisButton setTitleColor:RGB(159, 159, 168) forState:UIControlStateNormal];
    [self addSubview:_regisButton];
    
    _fogotPasswordButton = [[UIButton alloc]init];
    
    _fogotPasswordButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_fogotPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_fogotPasswordButton setTitleColor:RGB(159, 159, 168) forState:UIControlStateNormal];
    [self addSubview:_fogotPasswordButton];
    
    _telLabel = [[UILabel alloc]init];
    _telLabel.text = @"客服电话: 56891629";
    _telLabel.font = [UIFont systemFontOfSize:12];
    _telLabel.textColor = RGB(159, 159, 159);
    _telLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_telLabel];
}

- (void)addConstraint{
    UIImage* image = [UIImage imageNamed:@"logo"];
    CGFloat top = self.bounds.size.height* (1-0.8);
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(top));
        make.centerX.equalTo(self);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
        
        
    }];
  
    CGFloat left = self.bounds.size.width*(1-0.9);
    [_userNameBackgroundImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(left));
        make.right.equalTo(@(-left));
        make.top.equalTo(_iconImageView.mas_bottom).offset(50);
        make.height.equalTo(@(40));
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_userNameBackgroundImageview);
        
    }];
    
    _userLeftView.frame = CGRectMake(0, 0,25,25);
    _userNameIcon.frame = CGRectMake(0, 0, 25, 25);
    
    [_passwordBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_userNameBackgroundImageview);
        make.top.equalTo(_userNameBackgroundImageview.mas_bottom).offset(20);
        
    }];
    
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_passwordBackgroundImageView);
        
    }];
    _passwoedLeftView.frame = CGRectMake(0, 0, 25, 25);
    _passwordImageView.frame = CGRectMake(0, 0, 25, 25);
    
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_passwordBackgroundImageView);
        make.top.equalTo(_passwordBackgroundImageView.mas_bottom).offset(50);
        make.height.equalTo(@(40));
        
        
    }];
    NSString* str = @"注册账号";
    CGSize size = [str boundStringSizeWithFont:[UIFont systemFontOfSize:14] width:self.bounds.size.width];
    
    [_fogotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginButton.mas_right);
        make.top.equalTo(_loginButton.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(size.width, size.height));
        
    }];
    
    [_regisButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginButton.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(size.width, size.height));
        make.right.equalTo(_fogotPasswordButton.mas_left).offset(-10);
        
    }];
    
    
    CGFloat bottom = self.bounds.size.height* 0.8;
    [_telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_top).offset(bottom);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, 14));
        
        
        
    }];
    
    
    
}
@end
