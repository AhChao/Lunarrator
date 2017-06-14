//
//  ActivityPool.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Activity.h"

@interface ActivityPool : NSObject

+ (instancetype) sharedInstance;
- (void) saveActivity : (Activity*) inputActivity;
- (Activity*) activityOfDate : (NSDate*) targetDate;
- (NSMutableArray*) activityBetweenDates : (NSDate*) startDate Second:(NSDate*)endDate;

@end
