//
//  homePage.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/5.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "homePage.h"
#import "calendarPage.h"
@interface homePage ()
@property (weak, nonatomic) IBOutlet UIButton *anywhere;

@end

@implementation homePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickAnywhere:(id)sender {
    calendarPage *calendarpage = [[calendarPage alloc] initWithNibName:@"calendarPage" bundle:nil];
    NSLog(@"here1");
    [self presentModalViewController:calendarpage animated:YES];
    NSLog(@"here2");
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
