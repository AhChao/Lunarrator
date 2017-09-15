//
//  calendarPage.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@interface calendarPage : UIViewController <FSCalendarDelegate>

@property (weak, nonatomic) IBOutlet FSCalendar *calendar;

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition;

@end
