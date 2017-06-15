//
//  ActivityPool.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "ActivityPool.h"

@interface ActivityPool()
@property (strong,nonatomic) NSMutableArray *activityArray;
@property (strong,nonatomic) NSMutableArray *targetActivities;
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


- (instancetype)init {
    _activityArray = [NSMutableArray new];
    _targetActivities = [NSMutableArray new];
    return self;
}
- (void) saveActivity : (Activity*) inputActivity
{
    [_activityArray addObject:inputActivity];
    //and then save to coreData
    
}

- (NSMutableArray*) activityOfDate : (NSDate*) targetDate
{
    [_targetActivities removeAllObjects];
    for(Activity* act in _activityArray)
    {
        if ([targetDate compare:act.startTime] == NSOrderedDescending && [targetDate compare:act.endTime] == NSOrderedAscending) {
            //目標時間在活動開始時間與結束時間的區間中
            [_targetActivities addObject:act];
        }
        else if([targetDate compare:act.startTime] == NSOrderedSame||[targetDate compare:act.endTime]==NSOrderedSame)
        {
            //目標時間與活動開始或結束時間相等
            [_targetActivities addObject:act];
        }
        else if([targetDate compare:act.startTime] == NSOrderedDescending&&[act.startTime compare:act.endTime]==NSOrderedSame)
        {
            //目標時間在活動開始時間後 且活動開始時間與結束時間相等
            [_targetActivities addObject:act];
        }
    }
    
    return _targetActivities;
}

- (NSMutableArray*) activityBeforeDate : (NSDate*) targetDate
{

    [_targetActivities removeAllObjects];
    for(Activity* act in _activityArray)
    {
        if ([targetDate compare:act.endTime] == NSOrderedDescending) {
            //目標時間在活動結束時間後
            [_targetActivities addObject:act];
        }
    }
    
    return _targetActivities;
}

- (NSMutableArray*) activityAfterDate : (NSDate*) targetDate
{
    [_targetActivities removeAllObjects];
    for(Activity* act in _activityArray)
    {
        if ([targetDate compare:act.startTime] == NSOrderedAscending) {
            //目標時間在活動開始時間前
            [_targetActivities addObject:act];
        }
    }
    return _targetActivities;
}

- (NSMutableArray*) activityBetweenDates : (NSDate*) startDate Second:(NSDate*)endDate
{
    [_targetActivities removeAllObjects];
    
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
                [_targetActivities addObject:act];
                continue;
            }
        }
        
        if ([act.startTime compare:endDate] == NSOrderedAscending ||[act.startTime compare:endDate] == NSOrderedSame)
        {
            //活動的開始時間比區段結束時間早或相等
            //if([act.endTime compare:endDate] == NSOrderedDescending)
            //{
                //活動的結束時間比區段結束時間晚 XX不正確的條件
                [_targetActivities addObject:act];
                continue;
            //}
        }
    }
    return _targetActivities;
}

- (Activity*) contentOfActivity : (NSString*) activityTitle
{
    Activity *targetActivity = [Activity new];
    for(Activity* act in _activityArray)
    {
        if([act.title isEqualToString:activityTitle])
        {
            targetActivity = act;
            break;
        }
    }
    return targetActivity;
}

@end
