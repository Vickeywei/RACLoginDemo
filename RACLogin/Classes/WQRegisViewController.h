//
//  WQRegisViewController.h
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WQRegisViewModel.h"
#import "WQRegisView.h"
@interface WQRegisViewController : UIViewController
@property(nonatomic, strong)WQRegisView* regisView;
@property(nonatomic, strong)WQRegisViewModel* regisViewModel;

@end
