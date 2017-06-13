//
//  calendarPage.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "calendarPage.h"
#import "FSCalendar.h"

@interface calendarPage ()

@end

@implementation calendarPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSInteger lunarDay = [self.chineseCalendar component:NSCalendarUnitDay fromDate:[NSDate date]];

    self.lunarChars = @[@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"二一",@"二二",@"二三",@"二四",@"二五",@"二六",@"二七",@"二八",@"二九",@"三十"];
    NSString *lunarDayString = self.lunarChars[lunarDay-1];
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
