//
//  Activity.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/12.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Activity : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSDate *startTime;
@property(nonatomic, strong) NSDate *endTime;

@end
