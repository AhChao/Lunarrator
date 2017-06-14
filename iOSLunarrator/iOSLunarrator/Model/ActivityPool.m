//
//  ActivityPool.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "ActivityPool.h"

@interface ActivityPool()
@property (nonatomic,retain) NSMutableArray *activityArray;

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


- (void) saveActivity : (Activity*) inputActivity
{
    [_activityArray addObject:inputActivity];
    //and then save to coreData
    
}

- (NSMutableArray*) activityOfDate : (NSDate*) targetDate
{
    NSMutableArray* targetActivities;
    for(Activity* act in _activityArray)
    {
        if ([targetDate compare:act.startTime] == NSOrderedDescending && [targetDate compare:act.endTime] == NSOrderedAscending) {
            //目標時間在開始時間與結束時間的區間中
            [targetActivities addObject:act];
        }
        else if([targetDate compare:act.startTime] == NSOrderedSame||[targetDate compare:act.endTime]==NSOrderedSame)
        {
            //目標時間與開始或結束時間相等
            [targetActivities addObject:act];
        }
    }
    
    return targetActivities;
}

- (NSMutableArray*) activityBetweenDates : (NSDate*) startDate Second:(NSDate*)endDate
{
    NSMutableArray* targetActivities;
    
    //例如區間為16~19號，則應該回傳的活動有
    //1. 16號前開始的活動，但在16號後結束
    //2. 19號前開始的活動，但在19號後開始
    for(Activity* act in _activityArray)
    {
        if ([act.startTime compare:startDate] == NSOrderedAscending ||[act.startTime compare:startDate] == NSOrderedSame)
        {
            //活動的開始時間比區段開始時間早或相等
            if([act.endTime compare:startDate] == NSOrderedDescending)
            {
                //活動的結束時間比區段開始時間晚
                [targetActivities addObject:act];
                continue;
            }
        }
        
        if ([act.startTime compare:endDate] == NSOrderedAscending ||[act.startTime compare:endDate] == NSOrderedSame)
        {
            //活動的開始時間比區段結束時間早或相等
            if([act.endTime compare:endDate] == NSOrderedDescending)
            {
                //活動的結束時間比區段結束時間晚
                [targetActivities addObject:act];
                continue;
            }
        }
    }
    return targetActivities;
}

@end
