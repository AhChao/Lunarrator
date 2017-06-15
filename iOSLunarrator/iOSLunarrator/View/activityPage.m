//
//  activityPage.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "activityPage.h"
#import "activityCreateViewController.h"
#import "CustomerUI.h"

@interface activityPage ()

@property (weak,nonatomic) CustomerUI *CUI;
@property (weak, nonatomic) IBOutlet UIButton *buildActivityBut;
@property (weak, nonatomic) IBOutlet UITabBar *activityTabBar;

@end

@implementation activityPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setButBorder:_buildActivityBut];
    _activityTabBar.selectedItem = _activityTabBar.items[0];
    _activityTabBar.delegate = self;
    // Do any additional setup after loading the view from its nib.
}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
        //your code
        NSLog(@"%@",_activityTabBar.selectedItem.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addNewActivity:(id)sender {
    activityCreateViewController* activityCreatePage;
    if (activityCreatePage == nil)
    {
        activityCreatePage = [[activityCreateViewController alloc] initWithNibName:@"activityCreateViewController" bundle:nil];
    }
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: activityCreatePage animated:YES completion:nil];
}
- (IBAction)buildActivityButClicked:(id)sender {
    activityCreateViewController* ACVC;
    if (ACVC == nil)
    {
        ACVC = [[activityCreateViewController alloc] initWithNibName:@"activityCreateViewController" bundle:nil];
    }
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: ACVC animated:YES completion:nil];
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
