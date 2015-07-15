//
//  CaoGaoXiangCell.m
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-16.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "CaoGaoXiangCell.h"

@implementation CaoGaoXiangCell

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

	// Customize the appearance of table view cells.
- (void)configureWithMyRecipe:(MyRecipe *)myRecipe {
    
		// Configure the cell to show the book's title
    self.name.text = myRecipe.name;

	NSDate *editTime = (NSDate *)[myRecipe valueForKey:@"editTime"];
	DateUtil *dateUtil = [[DateUtil alloc] initWithDateType:DateTypeMonthDayHourMinute];
	NSString *editTimeString = [dateUtil dateStringWithDate:editTime];
	
	self.editTime.text = editTimeString;
}

- (void)configureWithShangHuOnServer:(AVObject *)shangHuOnServer
{
	self.name.text = [shangHuOnServer valueForKey:@"name"];
	
	NSDate *editTime = (NSDate *)[shangHuOnServer valueForKey:@"updatedAt"];
	DateUtil *dateUtil = [[DateUtil alloc] initWithDateType:DateTypeMonthDayHourMinute];
	NSString *editTimeString = [dateUtil dateStringWithDate:editTime];
	
	self.editTime.text = editTimeString;
}

- (void)configureWithUsernameOnServer:(NSString *)username andFeedsCount:(NSInteger)count
{
	self.name.text = username;
	self.editTime.text = [NSString stringWithFormat:@"%d recipes", count];
}

- (void)configureWithCategoryNameOnServer:(NSString *)categoryName andFeedsCount:(NSInteger)count
{
	self.name.text = categoryName;
	self.editTime.text = [NSString stringWithFormat:@"%d informations", count];
}

@end
