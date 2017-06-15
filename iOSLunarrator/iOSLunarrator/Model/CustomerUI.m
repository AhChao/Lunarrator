//
//  CustomerUI.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/15.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "CustomerUI.h"

@implementation CustomerUI

- (void)setButBorder:(UIButton*) btn{
    //btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn.frame = CGRectMake(0,0,50,50); // x,y自行設定
    //btn.layer.backgroundColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 1.0f; //設定邊線寬度
    btn.layer.borderColor = [UIColor whiteColor].CGColor; //設定邊線顏色
    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
    btn.layer.cornerRadius = 15.0f;
}
@end
