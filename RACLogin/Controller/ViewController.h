//
//  ViewController.h
//  textRunloop
//
//  Created by 魏琦 on 16/6/29.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQLoginView.h"
#import "WQLoginViewModel.h"
@interface ViewController : UIViewController
@property(nonatomic,strong)WQLoginViewModel *loginViewModel;
@property(nonatomic,strong)WQLoginView* loginView;


@end

