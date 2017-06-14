//
//  ActivityPool.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "ActivityPool.h"

@interface ActivityPool()
@property (nonatomic,retain) NSMutableArray *myArray;

@end

@implementation ActivityPool


+ (instancetype) sharedInstance
{
    static ActivityPool *instance = nil;
    if (!instance) {
        instance = [[ActivityPool alloc] init];
    }
    return instance;
}
//欲獲取ActivityPool 則用這條
//ActivityPool *ap = [ActivityPool sharedInstance];

@end
