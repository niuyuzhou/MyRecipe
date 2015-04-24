	//
	//  WoDeShangHuController.m
	//  BestCanteen
	//
	//  Created by niuyuzhou on 14-2-15.
	//  Copyright (c) 2014年 foodie. All rights reserved.
	//

#import "WoDeShangHuController.h"

@implementation WoDeShangHuController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initDataSource) name:DPLoginStatusChangedNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initDataSource) name:DPLocalObjectUploadedNotification object:nil];
	
	self.myRecipes = [Config sharedConfigInstance].myRecipes;
	
	if (!self.myRecipes) {
		[self initDataSource];
	}
}

- (void)initDataSource
{
	AVUser * currentUser = [AVUser currentUser];
	if (currentUser) {
		[SVProgressHUD showWithStatus:DPFindMyShangHuOnServerWaitingSuggestion];
		[[Config sharedConfigInstance] initMyShangHusWithCompletionBlock:^{
			self.myRecipes = [Config sharedConfigInstance].myRecipes;
			[self.tableView reloadData];
			[SVProgressHUD dismiss];
        } andErrorBlock:^{
            [SVProgressHUD dismiss];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:nil message:DPGetServerDataFailedSuggestion delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
            [errorAlertView show];
        }];
	} else {
		[self performSegueWithIdentifier:@"Login" sender:nil];
	}
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setEditing:NO animated:NO];
    
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

#pragma mark - IBActions

- (IBAction)refreshMyShangHu:(id)sender {
	[self initDataSource];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.myRecipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CaoGaoXiangCell";
	CaoGaoXiangCell *caoGaoXiangCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	[caoGaoXiangCell configureWithShangHuOnServer:self.myRecipes[indexPath.row]];
	
	return caoGaoXiangCell;
}

#pragma mark - Segue management

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowSelectedShangHuOnServer"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		
		//AVObject *shangHuOnServer = self.myShangHus[indexPath.row];
        AVObject *myRecipeOnServer = self.myRecipes[indexPath.row];
		
        XiangXiXinXiController *xiangXiXinXiController = (XiangXiXinXiController *)[segue destinationViewController];
		xiangXiXinXiController.myRecipeOnServer = myRecipeOnServer;
		xiangXiXinXiController.viewMode = ViewModeServerEdit;
		
    }
}

@end
