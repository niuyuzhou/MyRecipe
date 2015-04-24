//
//  CaoGaoXiangCell.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "Type.h"
#import "Tag.h"

@interface FenLeiGuanLiCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *numberOfDraft;

- (void)configureWithType:(Type *)type;
- (void)configureWithTag:(Tag *)tag;
	
@end
