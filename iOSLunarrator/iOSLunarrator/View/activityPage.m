//
//  activityPage.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "activityPage.h"

@interface activityPage ()
@property (weak, nonatomic) IBOutlet UITextView *activityContent;

@end

@implementation activityPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startTimeSelect:(id)sender {
    UIDatePicker *datePicker;
    NSDate *date = datePicker.date;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY/MM/dd"];
    [sender setTitle: [df stringFromDate:date]];
}
- (IBAction)endTimeSelect:(id)sender {
    UIDatePicker *datePicker;
    NSDate *date = datePicker.date;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY/MM/dd"];
    [sender setTitle: [df stringFromDate:date]];
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
