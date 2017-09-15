//
//  singleDay.h
//  iOSLunarrator
//
//  Created by cg lab on 2017/6/16.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface singleDay : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nml_Chong;
@property (weak, nonatomic) IBOutlet UILabel *nml_Y;
@property (weak, nonatomic) IBOutlet UILabel *nml_J;
@property (weak, nonatomic) IBOutlet UILabel *nml_Sha;
@property (weak, nonatomic) IBOutlet UILabel *nml_Js;
@property (weak, nonatomic) IBOutlet UILabel *nml_Xs;
@property (weak, nonatomic) IBOutlet UILabel *nml_Sc;
@property (weak, nonatomic) IBOutlet UILabel *nml_Yl;
@property (weak, nonatomic) IBOutlet UILabel *nml_Week;
@property (weak, nonatomic) IBOutlet UILabel *yyyymd;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@property (strong, nonatomic) NSDate *tempDate;
@end
