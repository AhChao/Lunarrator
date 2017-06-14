//
//  CustomerCalendar.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSCalendar.h"
#import <EventKitUI/EventKitUI.h>

@interface CustomerCalendar : NSObject <FSCalendarDataSource>

- (NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date;

@end
