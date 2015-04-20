//
//  AVObjectBasic.h
//  AVOSDemo
//
//  Created by Travis on 13-12-12.
//  Copyright (c) 2013年 AVOS. All rights reserved.
//

#import "MyRecipe.h"

@interface DPServerPersistence : NSObject

+ (DPServerPersistence *)sharedServerPersistenceInstance;

- (void)deleteObject:(AVObject *)object withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
//- (void)uploadShangHuToServer:(ShangHu *)shangHu withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
- (void)uploadMyRecipeToServer:(MyRecipe *)myRecipe withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;

@end
