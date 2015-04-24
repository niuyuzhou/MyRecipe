//
//  WoDeShangHuController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "CaoGaoXiangCell.h"
#import "XiangXiTongJiController.h"

typedef NS_ENUM(NSUInteger, AnalyzeMode) {
	AnalyzeModeUser = (1UL << 1),
	AnalyzeModeType = (1UL << 2),
	AnalyzeModeTag = (1UL << 3),
    AnalyzeModeArea = (1UL << 4),
};

@interface YunTongJiController : UIViewController <
	UITableViewDataSource,
	UITableViewDelegate,
	UIActionSheetDelegate
>

@property (assign, nonatomic) AnalyzeMode analyzeMode;
@property (strong, nonatomic) NSArray *allUsers;
@property (strong, nonatomic) NSArray *defaultType;
@property (strong, nonatomic) NSArray *defaultTag;
@property (strong, nonatomic) NSArray *defaultArea;

@property (nonatomic, strong) NSDictionary *allUserFeedsCount;
@property (nonatomic, strong) NSDictionary *allTypeFeedsCount;
@property (nonatomic, strong) NSDictionary *allTagFeedsCount;
@property (nonatomic, strong) NSDictionary *allAreaFeedsCount;

@property (strong, nonatomic) NSString *selectedQueryKey;
@property (strong, nonatomic) NSArray *selectedQueryResult;

@property (strong, nonatomic) NSMutableArray *titleArray;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)switchCategory:(id)sender;
- (IBAction)refreshallUsersShangHus:(id)sender;

@end