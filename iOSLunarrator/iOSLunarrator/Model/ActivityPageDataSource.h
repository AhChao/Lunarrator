//
//  ActivityPageDataSource.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/15.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ActivityPageDataSource : NSObject <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
