//
//  DPZhuCeController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-19.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPZhuCeController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UITextField *emailTextField;

-(IBAction)signUp:(id)sender;
- (IBAction)cancel:(id)sender;

@end