//
//  DPXiangXiTongJiController.m
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-24.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "DPXiangXiTongJiController.h"

@implementation DPXiangXiTongJiController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = self.selectedQueryKey;
}

- (void)viewWillAppear:(BOOL)animated
{
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

#pragma mark - IBActions

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.selectedQueryResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CaoGaoXiangCell";
	CaoGaoXiangCell *caoGaoXiangCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	[caoGaoXiangCell configureWithShangHuOnServer:self.selectedQueryResult[indexPath.row]];
	
	return caoGaoXiangCell;
}

#pragma mark - Segue management

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowSelectedShangHuOnServer"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		
		AVObject *myRecipeOnServer = self.selectedQueryResult[indexPath.row];
		
        DPXiangXiXinXiController *xiangXiXinXiController = (DPXiangXiXinXiController *)[segue destinationViewController];
		xiangXiXinXiController.myRecipeOnServer = myRecipeOnServer;
		xiangXiXinXiController.viewMode = ViewModeServerNoEdit;
    }
}

@end
