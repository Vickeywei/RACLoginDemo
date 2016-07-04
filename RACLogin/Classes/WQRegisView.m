//
//  WQRegisView.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQRegisView.h"
#import "UIImage+Resize.h"
#import <Masonry.h>
@implementation WQRegisView
- (instancetype)initWithFrame:(CGRect)frame
     sendCodeButtonTitleColor:(UIColor*)titleColor
                    sendColor:(UIColor*)sendColor{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpView];
        [self addContraints];
        
    }
    return self;
    
}

- (RACSubject *)sendRecondSignal {
    if (!_sendRecondSignal) {
        _sendRecondSignal = [[RACSubject alloc] init];
    }
    return _sendRecondSignal;
}

- (void)setUpView {
    /**
     *  //用户注册输入框
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
     
     //注册按钮
     @property(nonatomic, strong) UIButton* regisButton;
     @property(nonatomic, strong) UIImage* regisButtonBackImage;
     @property(nonatomic, assign) CGFloat regisCircularBead;
     
     //注册按钮和发送验证码按钮是否切圆角
     @property(nonatomic, assign) BOOL isCirCular;
     *
     *  @return <#return value description#>
     */
    
    
    _phoneNumTextField = [UITextField new];
    _phoneNumTextField.backgroundColor = [UIColor clearColor];
    _phoneNumTextField.font = [UIFont systemFontOfSize:14];
    _phoneNumTextField.placeholder = @"请输入手机号或邮箱";
    _phoneNumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_phoneNumTextField];
    
    _phoneNumTextFieldLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _phoneNumTextField.leftView = _phoneNumTextFieldLeftView;
    _phoneNumTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    _phoneNumTextFieldImageIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [_phoneNumTextFieldLeftView addSubview:_phoneNumTextFieldImageIcon];
    _phoneNumTextFieldImageIcon.image = [UIImage imageNamed:@"phone_icon_normal"];
    _phoneNumTextFieldImageIcon.highlightedImage = [UIImage imageNamed:@"phone_icon_high"];
    
    
    _phoneNumTextFieldBackgroudImageView = [UIImageView new];
    _phoneNumTextFieldBackgroudImageView.image = [UIImage resizedImageWithName:@"text_input_normal"];
    _phoneNumTextFieldBackgroudImageView.highlightedImage = [UIImage resizedImageWithName:@"text_input_high"];
    [self addSubview:_phoneNumTextFieldBackgroudImageView];
    
    
    _securityCodeTextField = [UITextField new];
    _securityCodeTextField.backgroundColor = [UIColor clearColor];
    _securityCodeTextField.font = [UIFont systemFontOfSize:14];
    _securityCodeTextField.placeholder = @"请输入您收到的6位验证码";
    [self addSubview:_securityCodeTextField];
    
    _securityCodeTextFieldLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _securityCodeTextField.leftView = _securityCodeTextFieldLeftView;
    _securityCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    _securityCodeTextFieldImageIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _securityCodeTextFieldImageIcon.image = [UIImage imageNamed:@"code_icon_normal"];
    _securityCodeTextFieldImageIcon.highlightedImage = [UIImage imageNamed:@"code_icon_high"];
    [_securityCodeTextFieldLeftView addSubview:_securityCodeTextFieldImageIcon];
    
    
    _securityCodeTextFieldBackgroundImageView = [UIImageView new];
    _securityCodeTextFieldBackgroundImageView.image = [UIImage resizedImageWithName:@"text_input_normal"];
    _securityCodeTextFieldBackgroundImageView.highlightedImage = [UIImage resizedImageWithName:@"text_input_high"];
    [self addSubview:_securityCodeTextFieldBackgroundImageView];
    
    _sendCodeBtn = [UIButton new];
    [_sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self addSubview:_sendCodeBtn];
    [_sendCodeBtn setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_disabled"] forState:UIControlStateDisabled];
    [_sendCodeBtn setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_normal"] forState:UIControlStateNormal];
    _sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    _regisButton = [UIButton new];
    [_regisButton setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_regisButton];
    [_regisButton setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_disabled"] forState:UIControlStateDisabled];
    [_regisButton setBackgroundImage:[UIImage resizedImageWithName:@"login_bg_normal"] forState:UIControlStateNormal];
    
}

- (void)addContraints {
    
    [_sendCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-30);
        make.top.equalTo(self.mas_top).offset(84);
        make.width.equalTo(@(120));
        make.height.equalTo(@(40));
        
    }];
    [_phoneNumTextFieldBackgroudImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(30));
        make.top.equalTo(_sendCodeBtn);
        make.right.equalTo(_sendCodeBtn.mas_left).offset(-20);
        make.height.equalTo(_sendCodeBtn);
    }];
    
    [_phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(_phoneNumTextFieldBackgroudImageView);
    }];
    
    [_securityCodeTextFieldBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneNumTextFieldBackgroudImageView);
        make.top.equalTo(_phoneNumTextFieldBackgroudImageView.mas_bottom).offset(20);
        make.size.equalTo(_phoneNumTextFieldBackgroudImageView);
    }];
    [_securityCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(_securityCodeTextFieldBackgroundImageView);
        
    }];
    
    [_regisButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneNumTextFieldBackgroudImageView);
        make.right.equalTo(_sendCodeBtn);
        make.top.equalTo(_securityCodeTextFieldBackgroundImageView.mas_bottom).offset(30);
        make.height.equalTo(@(40));
    }];
   
    
    
}

@end
