//
//  TianJiaCell.m
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "XiangXiXinXiCell.h"

@implementation XiangXiXinXiCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureOnKey:(NSString *)fieldKey withField:(NSString *)field andContent:(NSString *)content
{
	self.fieldKey = fieldKey;
	self.fieldLabel.text = field;
    self.contentLabel.text = content;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

@end
