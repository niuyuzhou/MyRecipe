//
//  Type.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-21.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

@interface NSString (Location)

+ (NSString *)stringFromLocationX:(NSString *)latitude LocationY:(NSString *)longitude;

- (NSString *)latitudeString;
- (NSString *)longitudeString;

@end
