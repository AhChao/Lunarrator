//
//  calendarPage.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/13.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@interface calendarPage : UIViewController
@property (strong, nonatomic) NSCalendar *chineseCalendar;
@property (strong, nonatomic) NSArray<NSString *> *lunarChars;
@property (weak, nonatomic) IBOutlet FSCalendar *lunarCalendar;

@end
