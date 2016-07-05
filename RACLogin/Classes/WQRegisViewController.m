//
//  WQRegisViewController.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQRegisViewController.h"

#import <ReactiveCocoa.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface WQRegisViewController()



@end

@implementation WQRegisViewController

- (void)loadView {
    self.regisView = [[WQRegisView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth , ScreenHeight) sendCodeButtonTitleColor:[UIColor cyanColor] sendColor:[UIColor groupTableViewBackgroundColor]];
    self.view = self.regisView;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    RAC(self.regisViewModel, phoneNum) = self.regisView.phoneNumTextField.rac_textSignal;
    RAC(self.regisViewModel, securityCode) = self.regisView.securityCodeTextField.rac_textSignal;
    RAC(self.regisView.phoneNumTextFieldBackgroudImageView,highlighted) = self.regisViewModel.enablePhoneNumTextField;
    RAC(self.regisView.securityCodeTextFieldBackgroundImageView,highlighted) = self.regisViewModel.enableSecurityCodeTextField;
    RAC(self.regisView.phoneNumTextFieldImageIcon,highlighted) = self.regisViewModel.enablePhoneNumTextField;
    RAC(self.regisView.securityCodeTextFieldImageIcon,highlighted) = self.regisViewModel.enableSecurityCodeTextField;
    self.regisView.regisButton.rac_command = self.regisViewModel.regisCommand;
    self.regisView.sendCodeBtn.rac_command = self.regisViewModel.sendCodeCommand;

    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
