//
//  calendarPage.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "calendarPage.h"
#import <NotificationCenter/NotificationCenter.h>
#import "FSCalendar.h"
#import "LunarDay.h"
#import "CustomerCalendar.h"

@interface calendarPage ()
@property (strong, nonatomic) NSCalendar *gregorian;
@property (strong, nonatomic) NSCalendar *lunarCalendar;
@property (strong, nonatomic) NSArray<NSString *> *lunarChars;
@property (weak, nonatomic) IBOutlet UILabel *todayTitle;
@property (strong, nonatomic) CustomerCalendar* calenderDataSource;
@end

@implementation calendarPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //_calendar.scrollDirection = FSCalendarScrollDirectionVertical;//垂直拉動
    //_calendar.appearance.borderRadius = 0;//方形選擇匡
    
    
    _calenderDataSource = [CustomerCalendar new];//[[CustomerCalendar alloc] init]
    //更動上面那行的日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY / MM / dd"];
    NSString *stringFromDate = [formatter stringFromDate:[NSDate date]];
    [formatter setDateFormat:@"YYYY/YYYY_M_dd"];
    NSString *findToday = [formatter stringFromDate:[NSDate date]];
    LunarDay *Lday = [[LunarDay alloc] initWithJSON :findToday];
    NSLog(@"今日宜 %@ \n不宜 %@",[[Lday nml_Y] substringToIndex:5],[[Lday nml_J] substringToIndex:5]);
    _todayTitle.text = stringFromDate;
    _calendar.dataSource = _calenderDataSource;
    [_calendar reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date
{
    NSInteger day = [_lunarCalendar component:NSCalendarUnitDay fromDate:date];
    return _lunarChars[day-1]; // 初一、初二、初三...
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
