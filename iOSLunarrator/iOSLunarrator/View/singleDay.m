//
//  singleDay.m
//  iOSLunarrator
//
//  Created by cg lab on 2017/6/16.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "singleDay.h"
#import "LunarDay.h"
#import "calendarPage.h"
#import "CustomerUI.h"
@interface singleDay ()

@end

@implementation singleDay

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setButBorder:_btnBack];

    NSDateFormatter *formatterYYYY = [[NSDateFormatter alloc]init];
    [formatterYYYY setDateFormat:@"YYYY"];
    NSString *YYYY  = [NSString stringWithFormat:@"%@",[formatterYYYY   stringFromDate:_tempDate]];
    NSDateFormatter *formatterM = [[NSDateFormatter alloc]init];
    [formatterM setDateFormat:@"M"];
    NSString *M  = [NSString stringWithFormat:@"%@",[formatterM stringFromDate:_tempDate]];
    NSDateFormatter *formatterd = [[NSDateFormatter alloc]init];
    [formatterd setDateFormat:@"d"];
    NSString *d  = [NSString stringWithFormat:@"%@",[formatterd stringFromDate:_tempDate]];
    //NSString *YYYY = @"2017";
    //NSString *M = @"6";
    //NSString *d = @"16";
    
    LunarDay *Lday = [[LunarDay alloc] initWithJSON :[NSString stringWithFormat:@"%@/%@_%@_%@",YYYY,YYYY,M,d]];
    self.yyyymd.text = [NSString stringWithFormat:@"%@/%@/%@",YYYY,M,d];
    self.nml_Chong.text = Lday.nml_Chong;
    self.nml_Y.text = Lday.nml_Y;
    self.nml_J.text = Lday.nml_J;
    self.nml_Sha.text = Lday.nml_Sha;
    self.nml_Js.text = Lday.nml_Js;
    self.nml_Xs.text = Lday.nml_Xs;
    self.nml_Sc.text = Lday.nml_Sc;
    self.nml_Yl.text = Lday.nml_Yl;
    self.nml_Week.text = Lday.nml_Week;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBackClick:(id)sender {
    calendarPage* calendarpage;
    if (calendarpage == nil)
    {
        calendarpage = [[calendarPage alloc] initWithNibName:@"calendarPage" bundle:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setButBorder:(UIButton*) btn{
    //btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn.frame = CGRectMake(0,0,50,50); // x,y自行設定
    //btn.layer.backgroundColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 1.0f; //設定邊線寬度
    btn.layer.borderColor = [UIColor whiteColor].CGColor; //設定邊線顏色
    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
    btn.layer.cornerRadius = 15.0f;
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
