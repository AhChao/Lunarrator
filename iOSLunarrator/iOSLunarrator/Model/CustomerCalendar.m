//
//  CustomerCalendar.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "CustomerCalendar.h"
#import "LunarDay.h"
#import <math.h>

@interface CustomerCalendar ()

@property (strong, nonatomic) NSArray<NSString *> *lunarChars;
@property (strong, nonatomic) NSCalendar *chineseCalendar;
@property (strong, nonatomic) NSArray<EKEvent *> *events;

@end


@implementation CustomerCalendar

#pragma mark - FSCalendarDataSource

- (nullable NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    self.lunarChars = @[@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"二一",@"二二",@"二三",@"二四",@"二五",@"二六",@"二七",@"二八",@"二九",@"三十"];
    EKEvent *event = [self eventsForDate:date].firstObject;
    if (event) {
        return event.title; // 春分、秋分、儿童节、植树节、国庆节、圣诞节...
    }
    _chineseCalendar=[NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSInteger day = [_chineseCalendar component:NSCalendarUnitDay fromDate:date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/YYYY_M_d"];
    NSString *findToday = [formatter stringFromDate:date];
    LunarDay *Lday = [[LunarDay alloc] initWithJSON :findToday];
    
    NSString *returnString=_lunarChars[day-1];
    returnString=[returnString stringByAppendingString:@"\n"];
    returnString=[returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    returnString=[returnString stringByAppendingString:@"\n"];
    returnString=[returnString stringByAppendingString:[[Lday nml_J] substringToIndex:MIN(5, Lday.nml_J.length)]];
    return _lunarChars[day-1]; // 初一、初二、初三...
    //return returnString;

}

- (NSArray<EKEvent *> *)eventsForDate:(NSDate *)date
{
    NSArray<EKEvent *> *filteredEvents = [self.events filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(EKEvent * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject.occurrenceDate isEqualToDate:date];
    }]];
    return filteredEvents;
}
@end
