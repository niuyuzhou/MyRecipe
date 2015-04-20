//
//  DPCaoGaoXiangCell.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "MyRecipe.h"
#import "DateUtil.h"

@interface DPCaoGaoXiangCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *editTime;

//- (void)configureWithShangHu:(ShangHu *)shangHu;
- (void)configureWithMyRecipe:(MyRecipe *)myRecipe;
- (void)configureWithShangHuOnServer:(AVObject *)shangHuOnServer;
- (void)configureWithUsernameOnServer:(NSString *)username andFeedsCount:(NSInteger)count;
- (void)configureWithCategoryNameOnServer:(NSString *)categoryName andFeedsCount:(NSInteger)count;

@end
