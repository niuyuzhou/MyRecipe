//
//  DPTianJiaCell.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPXiangXiXinXiCell : UITableViewCell <
    UITextFieldDelegate
>

@property (strong, nonatomic) NSString *fieldKey;
@property (strong, nonatomic) IBOutlet UILabel *fieldLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

- (void)configureOnKey:(NSString *)fieldKey withField:(NSString *)field andContent:(NSString *)content;

@end