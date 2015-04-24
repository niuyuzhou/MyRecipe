//
//  DengLuController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DengLuController : UIViewController

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forgetPasswordBarButtonItem;
@property (strong, nonatomic) IBOutlet UIButton *sendVerifyEmailButton;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;

-(IBAction)login:(id)sender;
-(IBAction)cancel:(id)sender;
- (IBAction)forgetPassword:(id)sender;
- (IBAction)sendVerifyEmail:(id)sender;

@end
