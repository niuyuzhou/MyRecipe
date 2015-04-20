//
//  main.m
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-13.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BCAppDelegate.h"

int main(int argc, char * argv[])
{
	@autoreleasepool {
        @try {
            UIApplicationMain(argc, argv, nil, NSStringFromClass([BCAppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(@"%s\n%@", __FUNCTION__, exception);
        }
        @finally {
            
        }
        return YES;
	}
}
