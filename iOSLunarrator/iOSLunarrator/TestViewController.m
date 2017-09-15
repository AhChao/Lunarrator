//
//  TestViewController.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/5.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property NSMutableArray* detailArr;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"./Resource/LunarCalendar/2017/2017_5_24" ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    _detailArr = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
