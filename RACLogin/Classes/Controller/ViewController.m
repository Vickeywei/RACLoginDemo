//
//  ViewController.m
//  textRunloop
//
//  Created by 魏琦 on 16/6/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()



@end

@implementation ViewController

- (void)loadView {
    _loginView = [[WQLoginView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth,ScreenHeight)];
    self.view = _loginView;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.loginViewModel,userName) = self.loginView.userName.rac_textSignal;
    RAC(self.loginViewModel,password) = self.loginView.password.rac_textSignal;
    

    
    RAC(self.loginView.userNameBackgroundImageview,highlighted) =  self.loginViewModel.enableUserNameSignal;
    RAC(self.loginView.userNameIcon,highlighted) = self.loginViewModel.enableUserNameSignal;
    RAC(self.loginView.passwordBackgroundImageView,highlighted) = self.loginViewModel.enablePasswordSignal;
    RAC(self.loginView.passwordImageView,highlighted) = self.loginViewModel.enablePasswordSignal;
    //绑定登录按钮
    self.loginView.loginButton.rac_command = self.loginViewModel.lohinCommand;
    [[self.loginView.userName rac_signalForControlEvents:UIControlEventEditingDidEnd]
     subscribeNext:^(id x) {
         [self.loginView.password becomeFirstResponder];
     }];
   
    
    
    //注册按钮的事件,和忘记密码的事件由子类自行完成
    



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
