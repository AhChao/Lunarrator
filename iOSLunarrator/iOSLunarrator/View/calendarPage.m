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
#import "CustomerCalendar.h"
#import "LunarDay.h"
#import "activityPage.h"
#import "goodDay.h"
#import "singleDay.h"
@interface calendarPage ()
@property (strong, nonatomic) NSCalendar *gregorian;
@property (strong, nonatomic) NSCalendar *lunarCalendar;
@property (strong, nonatomic) NSArray<NSString *> *lunarChars;
@property (weak, nonatomic) IBOutlet UILabel *todayTitle;
@property (strong, nonatomic) CustomerCalendar* calenderDataSource;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *jLabel;
@property (weak, nonatomic) IBOutlet UIButton *singleDayBut;
@property (weak, nonatomic) IBOutlet UIButton *activityPageBut;
@property (weak, nonatomic) IBOutlet UIButton *goodDayBut;
@property (strong, nonatomic) NSDate *tempDate;
//NSDate *tempDate;
@end

@implementation calendarPage

- (void)setButBorder:(UIButton*) btn{
    //btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn.frame = CGRectMake(0,0,50,50); // x,y自行設定
    //btn.layer.backgroundColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 1.0f; //設定邊線寬度
    btn.layer.borderColor = [UIColor whiteColor].CGColor; //設定邊線顏色
    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
    btn.layer.cornerRadius = 15.0f;
}

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

    _todayTitle.text = stringFromDate;
    _calendar.dataSource = _calenderDataSource;
    _calendar.delegate = self;
    
    [self setButBorder:_singleDayBut];
    [self setButBorder:_activityPageBut];
    [self setButBorder:_goodDayBut];
    
    //以今日做為代表顯示宜忌
    [formatter setDateFormat:@"YYYY/YYYY_M_d"];
    NSString *findToday = [formatter stringFromDate:[NSDate date]];
    LunarDay *Lday = [[LunarDay alloc] initWithJSON :findToday];
    NSString *returnString=@"宜 / ";
    returnString = [returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    _yLabel.text = returnString;
    returnString = @"忌 / ";
    returnString = [returnString stringByAppendingString:[[Lday nml_J] substringToIndex:MIN(5, Lday.nml_J.length)]];
    _jLabel.text = returnString;
    
    
    [_calendar reloadData];
}
- (IBAction)goToActivityPage:(id)sender {
    activityPage* activitypage;
    if (activitypage == nil)
    {
        activitypage = [[activityPage alloc] initWithNibName:@"activityPage" bundle:nil];
    }
    //[self dismissViewControllerAnimated:YES completion:nil];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: activitypage animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition
{
    _tempDate=date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/YYYY_M_d"];
    NSString *findToday = [formatter stringFromDate:date];
    LunarDay *Lday = [[LunarDay alloc] initWithJSON :findToday];
    NSString *returnString=@"宜 / ";
    returnString = [returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    _yLabel.text = returnString;
    returnString = @"忌 / ";
    returnString = [returnString stringByAppendingString:[[Lday nml_J] substringToIndex:MIN(5, Lday.nml_J.length)]];
    _jLabel.text = returnString;
}

- (IBAction)btnGoodDayClick:(id)sender {
    goodDay *goodday = [[goodDay alloc] initWithNibName:@"goodDay" bundle:nil];
    //[self presentModalViewController:goodday animated:YES];
    [self presentViewController: goodday animated:YES completion:nil];

}
- (IBAction)btnSingleDayClick:(id)sender {
    if(_tempDate == nil){
        _tempDate = [NSDate date];
    }
    singleDay *singleday = [[singleDay alloc] initWithNibName:@"singleDay" bundle:nil];
    singleday.tempDate = _tempDate;
    //[self presentModalViewController:goodday animated:YES];
    [self presentViewController: singleday animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


