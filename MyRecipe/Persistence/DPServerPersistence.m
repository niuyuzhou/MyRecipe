	//
	//  AVObjectBasic.m
	//  AVOSDemo
	//
	//  Created by Travis on 13-12-12.
	//  Copyright (c) 2013年 AVOS. All rights reserved.
	//

#import "DPServerPersistence.h"

@implementation DPServerPersistence

+ (DPServerPersistence *)sharedServerPersistenceInstance
{
    static dispatch_once_t  onceToken;
    static DPServerPersistence * sharedServerPersistenceInstance;
	
    dispatch_once(&onceToken, ^{
        sharedServerPersistenceInstance = [[DPServerPersistence alloc] init];
    });
    return sharedServerPersistenceInstance;
}

//- (void)uploadShangHuToServer:(ShangHu *)shangHu withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
- (void)uploadMyRecipeToServer:(MyRecipe *)myRecipe withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock;
{
	AVObject *myRecipeToBeUpload = [AVObject objectWithClassName:DPServerTableMyRecipe];
	NSDictionary *addField = [BCConfig sharedConfigInstance].addField;
	
	for (int i = 0; i < [addField allValues].count; i ++) {
		NSMutableDictionary *rowsDictionary = [addField allValues][i];
		
		for (int j = 0; j < [rowsDictionary allValues].count; j ++) {
			NSString *key = [rowsDictionary allKeys][j];
			[myRecipeToBeUpload setObject:[myRecipe valueForKey:key] forKey:key];
		}
	}
	
	[myRecipeToBeUpload setObject:[AVUser currentUser].username forKey:@"author"];
	
	[myRecipeToBeUpload saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (succeeded) {
//            NSString *str = shangHuToBeUpload.objectId;
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

- (void)deleteObject:(AVObject *)object withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	AVObject *objectToBeDelete = [AVObject objectWithoutDataWithClassName:DPServerTableMyRecipe objectId:object.objectId];
	[objectToBeDelete deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 		if (error) {
			if (errorBlock) {
				errorBlock();
			}
		} else if (succeeded) {
			if (completionBlock) {
				completionBlock();
			}
		}
	}];
}

- (void)createObject:(AVObject *)object withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		if (error) {
			errorBlock();
		} else if (succeeded) {
			completionBlock();
		}
	}];
}

- (void)updateObject:(AVObject *)object withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	
}

- (void)findAllObject:(AVObject *)object withCompletionBlock:(CompletionBlock)completionBlock andErrorBlock:(ErrorBlock)errorBlock
{
	
}

@end
