//
//  LunarDay.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/12.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "LunarDay.h"

@implementation LunarDay


- (instancetype)initWithJSON:(NSString*) DateInput
{
    //DateInput = YYYY/YYYY_MM_DD
    
    NSString *pathForResource=[NSString stringWithFormat:@"Resource/LunarCalendar/%@",DateInput];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathForResource ofType:@"json"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    _calendarDic = [NSJSONSerialization JSONObjectWithData:fileData options:kNilOptions error:nil];
    _nml_Y=_calendarDic[@"nml_Y"];
    NSArray *items = [_nml_Y componentsSeparatedByString:@"<"];
    _nml_Y=[items objectAtIndex:0];
    _nml_Xs=_calendarDic[@"nml_Xs"];
    _nml_Lunar_Month=_calendarDic[@"nml_Lunar_Month"];
    _nml_Yl=_calendarDic[@"nml_Yl"];
    _nml_Sc=_calendarDic[@"nml_Sc"];
    _nml_Sha=_calendarDic[@"nml_Sha"];
    _nml_Jshi=_calendarDic[@"nml_Jshi"];
    _nml_J=_calendarDic[@"nml_J"];
    _nml_Chong=_calendarDic[@"nml_Chong"];
    _nml_Sz_Date=_calendarDic[@"nml_Sz_Date"];
    _animal=_calendarDic[@"animal"];
    _nml_Js=_calendarDic[@"nml_Js"];
    _nml_Week=_calendarDic[@"nml_Week"];
    _nml_Lunar_Date=_calendarDic[@"nml_Lunar_Date"];
    _nml_Sz_Year=_calendarDic[@"nml_Sz_Year"];
    _nml_Sz_Month=_calendarDic[@"nml_Sz_Month"];
    _nml_Sz_Hour=_calendarDic[@"nml_Sz_Hour"];
    return self;
}



@end
