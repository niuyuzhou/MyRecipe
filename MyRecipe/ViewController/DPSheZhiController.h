//
//  DPSheZhiController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "DPSheZhiCell.h"

@interface DPSheZhiController : UIViewController <
	UITableViewDelegate,
	UITableViewDataSource
>

@property (nonatomic, strong) NSMutableDictionary *generalSettingField;
@property (nonatomic, strong) NSMutableDictionary *accountSettingField;
@property (nonatomic, strong) NSMutableDictionary *settingField;
@property (strong, nonatomic) IBOutlet UITableView *settingTableView;

@end
