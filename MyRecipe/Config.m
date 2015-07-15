	//
	//  Config.m
	//  BestCanteen
	//
	//  Created by niuyuzhou on 14-2-20.
	//  Copyright (c) 2014年 foodie. All rights reserved.
	//

#import "Config.h"

NSString *const BCApplicationId = @"ry1w41u8mqrk05kimkme98gpvdw2isjhi8g13avznrbzodch";
NSString *const BCClientKey = @"1hedsflkcdfj928js35nkyz21a937pw49h2hbj61a25bj4cc";

NSString *const DPLoginStatusChangedNotification = @"DPLoginStatusChangedNotification";
NSString *const DPServerObjectUpdatedNotification = @"DPServerObjectUpdatedNotification";
NSString *const DPLocalObjectUploadedNotification = @"DPLocalObjectUploadedNotification";

NSString *const DPServerObjectIdKey = @"DPServerObjectIdKey";

NSString *const DPNoImagesSuggestion = @"该菜谱暂时还没有图片！";
NSString *const DPEmptyFieldSuggestion = @"输入框不能为空！";
NSString *const DPLoginFailedSuggestion = @"请检查您的用户名和密码是否有误，\n或待稍后网络状况良好时重试！";
NSString *const DPRegisterFailedSuggestion = @"请检查您的用户名和邮箱格式是否有误，\n或待稍后网络状况良好时重试！";
NSString *const DPUpToServerFailedSuggestion = @"上传失败，\n请待稍后网络状况良好时重试！";
NSString *const DPNoDraftToUpSuggestion = @"没有需要上传的草稿，\n请先添加一条草稿后重试！";
NSString *const DPAddFailedSuggestion = @"添加失败！";
NSString *const DPSaveFailedSuggestion = @"保存失败！";
NSString *const DPDeleteFailedSuggestion = @"删除失败！";
NSString *const DPGetServerDataFailedSuggestion = @"加载失败，\n请待稍后网络状况良好时重试！";
NSString *const DPGetShangHuImageDataFailedSuggestion = @"加载菜谱图片失败，\n请待稍后网络状况良好时重试！";

NSString *const DPLocatingFailedSuggestion = @"定位失败，\n应用可能无权使用当前位置，\n或待稍后网络状况良好时重试！";;
NSString *const DPAddSuccessSuggestion = @"添加成功！";
NSString *const DPSaveSuccessSuggestion = @"保存成功！";
NSString *const DPDeleteSuccessSuggestion = @"删除成功！";
NSString *const DPUpToServerSuccessSuggestion = @"上传成功！";
NSString *const DPUpToServerWaitingSuggestion = @"正在上传...";
NSString *const DPFindShangHuOnServerWaitingSuggestion = @"正在查询所有菜谱信息...";
NSString *const DPFindMyShangHuOnServerWaitingSuggestion = @"正在查询您的菜谱信息...";
NSString *const DPGetShangHuImageDataWaitingSuggestion = @"正在加载菜谱图片...";

NSString *const DPServerTableMyRecipe = @"MyRecipe";
NSString *const DPServerTableType = @"Type";
NSString *const DPServerTableTag = @"Tag";

@implementation Config

+ (Config *)sharedConfigInstance
{
    static dispatch_once_t  onceToken;
    static Config * sharedConfigInstance;
	
    dispatch_once(&onceToken, ^{
        sharedConfigInstance = [[Config alloc] init];
    });
    return sharedConfigInstance;
}

- (id)init {
	if (self == [super init]) {
		if (![[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstRunning"]) {
			self.isFirstRunning = YES;
		} else {
			self.isFirstRunning = NO;
		}
	}
	return self;
}

- (void)initConfigData {
	[self initSettingConfigData];
	[self initAddConfigData];
	[self initAnalyzeConfigData];
	
	[self initGeneralConfigData];
}

- (void)initGeneralConfigData {
	self.allQueryResult = [NSMutableDictionary dictionary];
}

- (void)initAnalyzeConfigData
{
	self.analyzeMode = [NSMutableArray arrayWithArray:@[@"按作者", @"按口味", @"按菜式", @"按菜系"]];
    //self.categoryManageMode = [NSMutableArray arrayWithArray:@[@"Recipe标签", @"Recipe分类"]];
    self.categoryManageMode = nil;
}

- (void)initFeedsOfQueryKey:(NSString *)queryKey andQueryValue:(NSString *)queryValue WithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
{
	AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
	
	query.cachePolicy = kAVCachePolicyCacheElseNetwork;
	query.maxCacheAge = 3600;
	[query whereKey:queryKey equalTo:queryValue];
	
	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		if (objects) {
			[self.allQueryResult setObject:objects forKey:queryValue];
			if (completionBlock) {
				completionBlock();
			}
		} else {
			if (errorBlock) {
				errorBlock();
			}
		}
	}];
}

- (void)initMyShangHusWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	AVUser * currentUser = [AVUser currentUser];
	
	if (currentUser != nil) {
		NSString *username = currentUser.username;
		AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
		
		query.cachePolicy = kAVCachePolicyNetworkElseCache;
		query.maxCacheAge = 3600;
		[query whereKey:@"author" equalTo:username];
		
		[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
			if (objects) {
				self.myRecipes = [NSMutableArray arrayWithArray:objects];
				if (completionBlock) {
					completionBlock();
				}
			} else {
				if (errorBlock) {
					errorBlock();
				}
			}
		}];
	}
}

- (void)initAllUsersOnServerWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	AVQuery * query = [AVUser query];
	query.cachePolicy = kAVCachePolicyCacheElseNetwork;
	
		//设定缓存有效期
	query.maxCacheAge = 4 * 3600;
	
	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		if (objects) {
			self.allUsers = [NSMutableArray arrayWithArray:objects];
			if (completionBlock) {
				completionBlock();
			}
		} else {
			if (errorBlock) {
				errorBlock();
			}
		}
	}];
}

- (void)countAllUserFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	self.allUserFeedsCount = [NSMutableDictionary dictionary];
	
	for (AVUser *user in self.allUsers) {
		__block NSString *username = user.username;
		__block BOOL isAllUserCounted = NO;
		
		AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
		
		query.cachePolicy = kAVCachePolicyCacheThenNetwork;
		query.maxCacheAge = 4 * 3600;
		[query whereKey:@"author" equalTo:username];
		
		[query countObjectsInBackgroundWithBlock:^(NSInteger count, NSError *error) {
			if (!error) {
				[self.allUserFeedsCount setObject:[NSNumber numberWithInteger:count] forKey:username];
				
				if (self.allUsers.count == self.allUserFeedsCount.count) {
					isAllUserCounted = YES;
				}
				if (completionBlock && isAllUserCounted) {
					completionBlock();
				}
			} else {
				if (errorBlock) {
					errorBlock();
				}
			}
		}];
	}
}

- (void)countAllTypeFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	self.allTypeFeedsCount = [NSMutableDictionary dictionary];
	
	for (Type *type in self.defaultType) {
		__block NSString *typeName = [type valueForKey:@"name"];
		__block BOOL isAllTypeCounted = NO;
		
		AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
		
		query.cachePolicy = kAVCachePolicyCacheThenNetwork;
		query.maxCacheAge = 4 * 3600;
		[query whereKey:@"type" equalTo:typeName];
		
		[query countObjectsInBackgroundWithBlock:^(NSInteger count, NSError *error) {
			if (!error) {
				[self.allTypeFeedsCount setObject:[NSNumber numberWithInteger:count] forKey:typeName];
				
				if (self.defaultType.count == self.allTypeFeedsCount.count) {
					isAllTypeCounted = YES;
				}
				if (completionBlock && isAllTypeCounted) {
					completionBlock();
				}
			} else {
				if (errorBlock) {
					errorBlock();
				}
			}
		}];
	}
}

- (void)countAllTagFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	self.allTagFeedsCount = [NSMutableDictionary dictionary];
	
	for (Tag *tag in self.defaultTag) {
		__block NSString *tagName = [tag valueForKey:@"name"];
		__block BOOL isAllTagCounted = NO;
		
		AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
		
		query.cachePolicy = kAVCachePolicyCacheThenNetwork;
		query.maxCacheAge = 4 * 3600;
		[query whereKey:@"tag" equalTo:tagName];
		
		[query countObjectsInBackgroundWithBlock:^(NSInteger count, NSError *error) {
			if (!error) {
				[self.allTagFeedsCount setObject:[NSNumber numberWithInteger:count] forKey:tagName];
				
				if (self.defaultTag.count == self.allTagFeedsCount.count) {
					isAllTagCounted = YES;
				}
				if (completionBlock && isAllTagCounted) {
					completionBlock();
				}
			} else {
				if (errorBlock) {
					errorBlock();
				}
			}
		}];
	}
}

- (void)countAllAreaFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	self.allAreaFeedsCount = [NSMutableDictionary dictionary];
	
	for (Area *area in self.defaultArea) {
		__block NSString *areaName = [area valueForKey:@"name"];
		__block BOOL isAllAreaCounted = NO;
		
		AVQuery *query = [AVQuery queryWithClassName:DPServerTableMyRecipe];
		
		query.cachePolicy = kAVCachePolicyCacheThenNetwork;
		query.maxCacheAge = 4 * 3600;
		[query whereKey:@"area" equalTo:areaName];
		
		[query countObjectsInBackgroundWithBlock:^(NSInteger count, NSError *error) {
			if (!error) {
				[self.allAreaFeedsCount setObject:[NSNumber numberWithInteger:count] forKey:areaName];
				
				if (self.defaultArea.count == self.allAreaFeedsCount.count) {
					isAllAreaCounted = YES;
				}
				if (completionBlock && isAllAreaCounted) {
					completionBlock();
				}
			} else {
				if (errorBlock) {
					errorBlock();
				}
			}
		}];
	}
}

- (void)initSettingConfigData {
    self.generalSettingField = [NSMutableDictionary dictionaryWithDictionary:@{@"clearCache" : @"Clear cache"}];

	self.accountSettingField = [NSMutableDictionary dictionaryWithDictionary:@{@"logInLogOut" : @"Login"}];
	
	self.settingField = [NSMutableDictionary dictionaryWithDictionary:@{@"Common tools" : self.generalSettingField, @"My account" : self.accountSettingField}];
}

- (void)initAddConfigData {
    self.generalAddField = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                           @"name" : @"Name",
                                                                           @"ingredient" : @"Ingredient",
                                                                           @"direction" : @"Direction"}];
    self.optionalAddField = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                            @"tag" : @"Tag",
																			@"type" : @"Type",
                                                                            @"area" : @"Area"}];
	self.addField = [NSMutableDictionary dictionaryWithDictionary:@{
																	@"Basic" : self.generalAddField,
																	@"Optional" : self.optionalAddField}];}


- (void)initDefaultData {
	[self initDefaultTypeConfigData];
	[self initDefaultTagConfigData];
    [self initDefaultAreaConfigData];
    [self initDefaultDirectionData];
	[[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isFirstRunning"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	self.isFirstRunning = NO;
}

- (void)initDataBase {
    [self initTypeDataBase];
	[self initTagDataBase];
    [self initAreaDataBase];
}

- (void)initTypeDataBase {
    NSFetchedResultsController *fetchedResultsController = [Type MR_fetchAllSortedBy:@"name"
                                              ascending:NO
                                          withPredicate:nil
                                                groupBy:nil
                                               delegate:nil
                                              inContext:[NSManagedObjectContext MR_contextForCurrentThread]];
    self.defaultType = [NSMutableArray arrayWithArray:[fetchedResultsController fetchedObjects]];
}

- (void)initTagDataBase {
    NSFetchedResultsController *fetchedResultsController = [Tag MR_fetchAllSortedBy:@"name"
                                                                          ascending:NO
                                                                      withPredicate:nil
                                                                            groupBy:nil
                                                                           delegate:nil
                                                                          inContext:[NSManagedObjectContext MR_contextForCurrentThread]];
    self.defaultTag = [NSMutableArray arrayWithArray:[fetchedResultsController fetchedObjects]];
}

- (void)initAreaDataBase {
    NSFetchedResultsController *fetchedResultsController = [Area MR_fetchAllSortedBy:@"name"
                                                                          ascending:NO
                                                                      withPredicate:nil
                                                                            groupBy:nil
                                                                           delegate:nil
                                                                          inContext:[NSManagedObjectContext MR_contextForCurrentThread]];
    self.defaultArea = [NSMutableArray arrayWithArray:[fetchedResultsController fetchedObjects]];
}

// Cooking Method
- (void) initDefaultDirectionData {
    self.defaultDirection = [NSMutableArray array];
    //NSArray *directionItems = [NSMutableArray arrayWithArray:@[@"炒", @"拌", @"煎", @"炖", @"蒸", @"煮" ,@"炸", @"红烧", @"焖", @"煲", @"烩", @"烤", @"卤", @"腌"]];

    NSArray *directionItems = [NSMutableArray arrayWithArray:@[@"deep fry", @"mix", @"braise", @"brew", @"ferment", @"simmer" ,@"saute", @"ferment", @"steam", @"bake", @"brew", @"barbecue", @"smoke", @"salt"]];
    
    for (NSString *directionName in directionItems) {
        [self.defaultDirection addObject:directionName];
    }
}
// 菜系
- (void)initDefaultAreaConfigData {
	self.defaultArea = [NSMutableArray array];
    //NSArray *areaItems = [NSMutableArray arrayWithArray:@[@"本帮江浙菜", @"川菜", @"粤菜", @"湘菜", @"东北菜", @"贵州菜", @"台湾菜", @"清真菜", @"新疆菜", @"西北菜", @"素菜", @"烧烤", @"火锅", @"日本料理", @"韩国料理", @"东南亚菜", @"西餐", @"面包", @"其他"]];
    NSArray *areaItems = [NSMutableArray arrayWithArray:@[@"Shandong Cuisine", @"Sichuan Cuisine", @"Guangdong Cuisine", @"Fujian Cuisine", @"Jiangsu Cuisine", @"Zhejiang Cuisine", @"Hunan Cuisine", @"Anhui Cuisine", @"Others"]];
    
	NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
	
	for (NSString *areaName in areaItems) {
		Area *area = [Area MR_createInContext:localContext];
		[area setValue:areaName forKey:@"name"];
		[self.defaultArea addObject:area];
	}
	
	[localContext MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
		if (error) {
			NSLog(@"保存Area出错：%@", [error description]);
		}
	}];
}

// 口味
- (void)initDefaultTypeConfigData {
	self.defaultType = [NSMutableArray array];
    NSArray *typeItems = [NSMutableArray arrayWithArray:@[@"清淡", @"咖喱", @"麻辣", @"辣", @"酸", @"甜", @"糖醋", @"鱼香", @"其他"]];
    
	NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
	
	for (NSString *typeName in typeItems) {
		Type *type = [Type MR_createInContext:localContext];
		[type setValue:typeName forKey:@"name"];
		[self.defaultType addObject:type];
	}
	
	[localContext MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
		if (error) {
			NSLog(@"保存Type出错：%@", [error description]);
		}
	}];
}

// 菜式
- (void)initDefaultTagConfigData {
	self.defaultTag = [NSMutableArray array];
    NSArray *tagItems = [NSMutableArray arrayWithArray:@[@"凉菜", @"热菜", @"汤羹", @"主食", @"甜品", @"小吃", @"零食", @"其他"]];

    
	NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
	
	for (NSString *tagName in tagItems) {
		Tag *tag = [Tag MR_createInContext:localContext];
		[tag setValue:tagName forKey:@"name"];
		[self.defaultTag addObject:tag];
	}
	
	[localContext MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
		if (error) {
			NSLog(@"保存Tag出错：%@", [error description]);
		}
	}];
}

@end