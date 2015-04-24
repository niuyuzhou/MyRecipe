//
//  Config.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-20.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "Type.h"
#import "Tag.h"
#import "Area.h"

typedef void (^CompletionBlock)(void);
typedef void (^ErrorBlock)(void);

extern NSString *const BCApplicationId;
extern NSString *const BCClientKey;

extern NSString *const DPLoginStatusChangedNotification;
extern NSString *const DPServerObjectUpdatedNotification;
extern NSString *const DPLocalObjectUploadedNotification;

extern NSString *const DPServerObjectIdKey;

extern NSString *const DPNoImagesSuggestion;
extern NSString *const DPEmptyFieldSuggestion;
extern NSString *const DPLoginFailedSuggestion;
extern NSString *const DPRegisterFailedSuggestion;
extern NSString *const DPUpToServerFailedSuggestion;
extern NSString *const DPNoDraftToUpSuggestion;
extern NSString *const DPAddFailedSuggestion;
extern NSString *const DPSaveFailedSuggestion;
extern NSString *const DPDeleteFailedSuggestion;
extern NSString *const DPGetServerDataFailedSuggestion;
extern NSString *const DPGetShangHuImageDataFailedSuggestion;

extern NSString *const DPLocatingFailedSuggestion;
extern NSString *const DPAddSuccessSuggestion;

extern NSString *const DPSaveSuccessSuggestion;
extern NSString *const DPDeleteSuccessSuggestion;

extern NSString *const DPUpToServerSuccessSuggestion;
extern NSString *const DPUpToServerWaitingSuggestion;
extern NSString *const DPFindShangHuOnServerWaitingSuggestion;
extern NSString *const DPFindMyShangHuOnServerWaitingSuggestion;
extern NSString *const DPGetShangHuImageDataWaitingSuggestion;

extern NSString *const DPServerTableMyRecipe;
extern NSString *const DPServerTableType;
extern NSString *const DPServerTableTag;

@interface Config : NSObject

#pragma mark - 所有Recipe界面查看方式
@property (nonatomic, strong) NSMutableArray *analyzeMode;

#pragma mark - 分类管理界面查看方式
@property (nonatomic, strong) NSMutableArray *categoryManageMode;

#pragma mark - 服务器所有用户
@property (strong, nonatomic) NSMutableArray *allUsers;

#pragma mark - 服务器所有用户、标签、分类统计
@property (nonatomic, strong) NSMutableDictionary *allUserFeedsCount;
@property (nonatomic, strong) NSMutableDictionary *allTypeFeedsCount;
@property (nonatomic, strong) NSMutableDictionary *allTagFeedsCount;
@property (nonatomic, strong) NSMutableDictionary *allAreaFeedsCount;

#pragma mark - 服务器所有查询结果
@property (nonatomic, strong) NSMutableDictionary *allQueryResult;

#pragma mark - 我的菜谱
@property (strong, nonatomic) NSMutableArray *myRecipes;


#pragma mark - 程序是否第一次启动
@property (nonatomic, assign) BOOL isFirstRunning;

#pragma mark - Setting
@property (nonatomic, strong) NSMutableDictionary *generalSettingField;
@property (nonatomic, strong) NSMutableDictionary *accountSettingField;
@property (nonatomic, strong) NSMutableDictionary *settingField;

#pragma mark - Add
@property (nonatomic, strong) NSMutableDictionary *generalAddField;
@property (nonatomic, strong) NSMutableDictionary *optionalAddField;
@property (nonatomic, strong) NSMutableDictionary *addField;

#pragma mark - 默认口味
@property (nonatomic, strong) NSMutableArray *defaultType;

#pragma mark - 默认菜式
@property (nonatomic, strong) NSMutableArray *defaultTag;

#pragma mark - 默认菜系
@property (nonatomic, strong) NSMutableArray *defaultArea;

#pragma mark - 默认制作方法
@property (nonatomic, strong) NSMutableArray *defaultDirection;


+ (Config *)sharedConfigInstance;
- (void)initConfigData;
- (void)initDefaultData;
- (void)initDataBase;

#pragma mark - 从服务器获取所有的Recipe，在其中将自己上传的赋值给myRecipes变量
- (void)initMyShangHusWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)initAllUsersOnServerWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)countAllUserFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)countAllTypeFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)countAllTagFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)countAllAreaFeedsWithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
#pragma mark -
- (void)initFeedsOfQueryKey:(NSString *)queryKey andQueryValue:(NSString *)queryValue WithCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
@end