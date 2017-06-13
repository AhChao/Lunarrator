//
//  ViewController.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/2.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "ViewController.h"
#import "LunarDay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LunarDay *day0524 = [[LunarDay alloc] initWithJSON :@"2017/2017_5_24"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
