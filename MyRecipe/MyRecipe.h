//
//  MyRecipe.h
//  MyRecipe
//
//  Created by niuyuzhou on 15-3-25.
//  Copyright (c) 2015年 foodie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MyRecipe : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * editTime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * ingredient;
@property (nonatomic, retain) NSString * direction;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) NSString * area;

@end
