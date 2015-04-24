//
//  CaoGaoXiangController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "XiangXiXinXiController.h"
#import "TianJiaController.h"
#import "MyRecipe.h"
#import "CaoGaoXiangCell.h"

@interface CaoGaoXiangController : UIViewController <
	NSFetchedResultsControllerDelegate,
	UITableViewDataSource,
	UITableViewDelegate
>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (strong, nonatomic) IBOutlet UITableView *draftTableView;

- (IBAction)editDraft:(id)sender;

@end
