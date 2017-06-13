//
//  LunarDay.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/12.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LunarDay : NSObject
@property(nonatomic, strong) NSDictionary* calendarDic;
@property(nonatomic, strong) NSString* nml_Y;
@property(nonatomic, strong) NSString* nml_Xs;
@property(nonatomic, strong) NSString* nml_Lunar_Month;
@property(nonatomic, strong) NSString* nml_Yl;
@property(nonatomic, strong) NSString* nml_Sc;
@property(nonatomic, strong) NSString* nml_Sha;
@property(nonatomic, strong) NSString* nml_Jshi;
@property(nonatomic, strong) NSString* nml_J;
@property(nonatomic, strong) NSString* nml_Chong;
@property(nonatomic, strong) NSString* nml_Sz_Date;
@property(nonatomic, strong) NSString* animal;
@property(nonatomic, strong) NSString* nml_Js;
@property(nonatomic, strong) NSString* nml_Week;
@property(nonatomic, strong) NSString* nml_Lunar_Date;
@property(nonatomic, strong) NSString* nml_Sz_Year;
@property(nonatomic, strong) NSString* nml_Sz_Month;
@property(nonatomic, strong) NSString* nml_Sz_Hour;

- (instancetype)initWithJSON:(NSString*) DateInput;
@end
