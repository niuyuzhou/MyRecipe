//
//  DPXiangXiTongJiController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-24.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "CaoGaoXiangCell.h"
#import "DPXiangXiXinXiController.h"

@interface DPXiangXiTongJiController : UIViewController <
	UITableViewDataSource,
	UITableViewDelegate
>

@property (strong, nonatomic) NSString *selectedQueryKey;
@property (strong, nonatomic) NSArray *selectedQueryResult;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
