//
//  DPWoDeShangHuController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "DPCaoGaoXiangCell.h"
#import "DPXiangXiXinXiController.h"

@interface DPWoDeShangHuController : UIViewController <
	UITableViewDataSource,
	UITableViewDelegate
>

//@property (strong, nonatomic) NSMutableArray *myShangHus
@property (strong, nonatomic) NSMutableArray *myRecipes;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)refreshMyShangHu:(id)sender;

@end
