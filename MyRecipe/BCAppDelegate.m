//
//  BCAppDelegate.m
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-13.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "BCAppDelegate.h"

@implementation BCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [AVOSCloud setApplicationId:BCApplicationId clientKey:BCClientKey];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
	[MagicalRecord setupCoreDataStackWithStoreNamed:@"MyRecipe.sqlite"];
	
	BCConfig *config = [BCConfig sharedConfigInstance];
	[config performSelectorOnMainThread:@selector(initConfigData) withObject:nil waitUntilDone:YES];
	
	if (config.isFirstRunning) {
		[config performSelectorOnMainThread:@selector(initDefaultData) withObject:nil waitUntilDone:YES];
	} else {
        [config performSelectorOnMainThread:@selector(initDataBase) withObject:nil waitUntilDone:YES];
    }
	
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];
}

@end
