//
//  ActivityPageDataSource.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/15.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "ActivityPageDataSource.h"

@implementation ActivityPageDataSource
#pragma datasourceOfTableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //[cell.textLabel setText:[_yourItemsArray objectAtIndex:indexPath.row]];
    //NSLog(@"%@",[_yourItemsArray objectAtIndex:indexPath.row]);
    return cell;
}
@end
