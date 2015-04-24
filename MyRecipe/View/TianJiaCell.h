//
//  TianJiaCell.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPPickerController.h"
#import "DPLocationInputController.h"

@interface TianJiaCell : UITableViewCell <
UITextFieldDelegate,
DPPickerControllerDelegate,
DPLocationInputControllerDelegate
>

@property (strong, nonatomic) NSString *fieldKey;
@property (strong, nonatomic) UILabel *fieldLabel;
@property (strong, nonatomic) UITextField *fieldTextField;

- (void)configureOnKey:(NSString *)fieldKey withField:(NSString *)field;
- (void)configureOnKey:(NSString *)fieldKey withField:(NSString *)field andContent:(NSString *)content;
- (void)configureInputView:(UIView *)inputView;

@end
