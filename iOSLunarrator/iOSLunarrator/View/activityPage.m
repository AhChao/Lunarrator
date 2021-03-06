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
#import "ActivityPool.h"
#import "calendarPage.h"

@interface activityPage ()

@property (weak,nonatomic) CustomerUI *CUI;
@property (weak, nonatomic) IBOutlet UIButton *buildActivityBut;
@property (weak, nonatomic) IBOutlet UITabBar *activityTabBar;
@property (weak, nonatomic) IBOutlet UITableView *activityTableView;
@property (strong, nonatomic) NSMutableArray *activitiesArray;
@property (strong, nonatomic) NSMutableArray *finishArray;
@property (weak, nonatomic) IBOutlet UIButton *backBut;
@property (weak, nonatomic) UITableViewCell *lastCell;
@property (weak, nonatomic) UITableViewCell *contentCell;
@property (weak, nonatomic) UITableViewCell *tempCell;
@property BOOL cellExpand;

@end

@implementation activityPage

- (void)viewDidLoad {
    // Do any additional setup after loading the view from its nib.
    _activityTableView.layer.masksToBounds= YES;
    _activityTableView.layer.cornerRadius = 10.0f;
    [super viewDidLoad];
    [self setButBorder:_backBut];
    [self setButBorder:_buildActivityBut];
    _activityTabBar.selectedItem = _activityTabBar.items[0];
    _activityTabBar.delegate = self;
    
    _activityTableView.dataSource = self;
    _activityTableView.delegate = self;
    _activitiesArray = [[NSMutableArray alloc] init];
    _finishArray = [[NSMutableArray alloc] init];
    [_activityTableView reloadData];
    [self tabIsToday];
    
    _cellExpand=false;
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"VDA_Trigger");
    
    //cell 樣式清除
    for(NSInteger i=0 ; i< [_activityTableView numberOfRowsInSection:0];i++)
    {
        _tempCell =[_activityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        _tempCell.contentView.backgroundColor = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
        _tempCell.textLabel.textColor = [[UIColor alloc]initWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
    }
    
    [self setButBorder:_backBut];
    [self setButBorder:_buildActivityBut];
    [_finishArray removeAllObjects];
    [_activityTableView reloadData];
    [_activitiesArray removeAllObjects];
    _activityTabBar.selectedItem = _activityTabBar.items[0];
    [self tabIsToday];
    [_activityTableView reloadData];
    
    [[_activityTabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"today.png"]];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
        //your code
    [_finishArray removeAllObjects];
    [_activityTableView reloadData];
    [_activitiesArray removeAllObjects];
    if([_activityTabBar.selectedItem.title isEqualToString:@"今日活動"])
        [self tabIsToday];
    else if ([_activityTabBar.selectedItem.title isEqualToString:@"最近活動"])
        [self tabIsRecent];
    else if ([_activityTabBar.selectedItem.title isEqualToString:@"未來活動"])
        [self tabIsFuture];
    else if ([_activityTabBar.selectedItem.title isEqualToString:@"已結束"])
        [self tabIsEnd];
    [_activityTableView reloadData];
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
- (IBAction)backButClicked:(id)sender {
    calendarPage* calendarpage;
    if (calendarpage == nil)
    {
        calendarpage = [[calendarPage alloc] initWithNibName:@"calendarPage" bundle:nil];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    //self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController: ACVC animated:YES completion:nil];
}
- (IBAction)buildActivityButClicked:(id)sender {
    activityCreateViewController* ACVC;
    if (ACVC == nil)
    {
        ACVC = [[activityCreateViewController alloc] initWithNibName:@"activityCreateViewController" bundle:nil];
    }
    //[self dismissViewControllerAnimated:YES completion:nil];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: ACVC animated:YES completion:nil];
}

#pragma mark CustomerView
- (void)setButBorder:(UIButton*) btn{
    //btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn.frame = CGRectMake(0,0,50,50); // x,y自行設定
    //btn.layer.backgroundColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 1.0f; //設定邊線寬度
    btn.layer.borderColor = [UIColor whiteColor].CGColor; //設定邊線顏色
    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
    btn.layer.cornerRadius = 15.0f;
}

#pragma mark datasourceOfTableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // If You have only one(1) section, return 1, otherwise you must handle sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_finishArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [cell.textLabel setText:[_finishArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark tabbarSwitch
//to access right data in pool => and put into tableview
-(void) tabIsToday
{
    ActivityPool *ap = [ActivityPool sharedInstance];
    _activitiesArray = [NSMutableArray arrayWithArray:[ap activityOfDate:[NSDate date]]];
    NSString *tempStr;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"M / d"];
    NSString *dateString;
    //returnString=[returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    for(Activity *act in _activitiesArray)
    {
        tempStr = @"";
        tempStr =  act.title;
        tempStr = [tempStr stringByAppendingString:@"   "];
        dateString = [dateFormat stringFromDate:act.startTime];
        tempStr = [tempStr stringByAppendingString:dateString];
        if(act.startTime != act.endTime)
        {
         tempStr = [tempStr stringByAppendingString:@" ~ "];
         dateString = [dateFormat stringFromDate:act.endTime];
         tempStr = [tempStr stringByAppendingString:dateString];
        }
        [_finishArray addObject:tempStr];
    }
}

-(void) tabIsRecent
{
    ActivityPool *ap = [ActivityPool sharedInstance];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 6;
    //算一個禮拜的週期
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];

    _activitiesArray = [NSMutableArray arrayWithArray:[ap activityBetweenDates:[NSDate date] Second:nextDate]];
    NSString *tempStr;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"M / d"];
    NSString *dateString;
    //returnString=[returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    for(Activity *act in _activitiesArray)
    {
        tempStr = @"";
        tempStr =  act.title;
        tempStr = [tempStr stringByAppendingString:@"   "];
        dateString = [dateFormat stringFromDate:act.startTime];
        tempStr = [tempStr stringByAppendingString:dateString];
        if(act.startTime != act.endTime)
        {
            tempStr = [tempStr stringByAppendingString:@" ~ "];
            dateString = [dateFormat stringFromDate:act.endTime];
            tempStr = [tempStr stringByAppendingString:dateString];
        }
        [_finishArray addObject:tempStr];
    }
}

-(void) tabIsFuture
{
    ActivityPool *ap = [ActivityPool sharedInstance];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 7;
    //算一個禮拜的週期
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    
    _activitiesArray = [NSMutableArray arrayWithArray:[ap activityAfterDate:nextDate]];
    NSString *tempStr;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy / M / d"];
    NSString *dateString;
    //returnString=[returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    for(Activity *act in _activitiesArray)
    {
        tempStr = @"";
        tempStr =  act.title;
        tempStr = [tempStr stringByAppendingString:@"   "];
        dateString = [dateFormat stringFromDate:act.startTime];
        tempStr = [tempStr stringByAppendingString:dateString];
        if(act.startTime != act.endTime)
        {
            tempStr = [tempStr stringByAppendingString:@" ~ "];
            dateString = [dateFormat stringFromDate:act.endTime];
            tempStr = [tempStr stringByAppendingString:dateString];
        }
        [_finishArray addObject:tempStr];
    }
}

-(void) tabIsEnd
{
    ActivityPool *ap = [ActivityPool sharedInstance];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = -1;
    //算一個禮拜的週期
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    
    _activitiesArray = [NSMutableArray arrayWithArray:[ap activityBeforeDate:nextDate]];
    NSString *tempStr;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/ M / d"];
    NSString *dateString;
    //returnString=[returnString stringByAppendingString:[[Lday nml_Y] substringToIndex:MIN(5, Lday.nml_Y.length)]];
    for(Activity *act in _activitiesArray)
    {
        tempStr = @"";
        tempStr =  act.title;
        tempStr = [tempStr stringByAppendingString:@"   "];
        dateString = [dateFormat stringFromDate:act.startTime];
        tempStr = [tempStr stringByAppendingString:dateString];
        if(act.startTime != act.endTime)
        {
            tempStr = [tempStr stringByAppendingString:@" ~ "];
            dateString = [dateFormat stringFromDate:act.endTime];
            tempStr = [tempStr stringByAppendingString:dateString];
        }
        [_finishArray addObject:tempStr];
    }
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if([[_activityTableView cellForRowAtIndexPath:indexPath]isEqual:_contentCell])
    {
        [_activityTableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    if(![[_activityTableView cellForRowAtIndexPath:indexPath]isEqual:_lastCell]&&_lastCell!=nil)
    {
        [_activityTableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    NSArray *items = [cellText componentsSeparatedByString:@" "];
    cellText=[items objectAtIndex:0];
    NSLog(@"%@",cellText);
    ActivityPool *ap = [ActivityPool sharedInstance];
    cellText = [ap contentOfActivity:cellText].content;
    NSLog(@"內容為 %@",cellText);
    
    
    if(!_cellExpand)//目前沒有展開的cell
    {
        _cellExpand = true;
        _lastCell=[_activityTableView cellForRowAtIndexPath:indexPath];
        
        //先改datesource 再改view
        NSInteger rowOfTheCell = [indexPath row];
        rowOfTheCell+=1;
        [_finishArray insertObject:cellText atIndex:rowOfTheCell];
        [_activityTableView insertRowsAtIndexPaths:[self indexPathsForExpandRow:indexPath.row] withRowAnimation:UITableViewRowAnimationTop];
        _contentCell=[_activityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
        _contentCell.contentView.backgroundColor = [[UIColor alloc]initWithRed:0.0/255.0 green:136.0/255.0 blue:0.0/255.0 alpha:1];
        _contentCell.textLabel.textColor = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    }
    else//目前有展開的cell
    {
        if([[_activityTableView cellForRowAtIndexPath:indexPath]isEqual:_lastCell])//點擊的跟上一個cell是一樣的
        {
            //cell樣式清除
            for(NSInteger i=0 ; i< [_activityTableView numberOfRowsInSection:0];i++)
            {
                _tempCell =[_activityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
                _tempCell.contentView.backgroundColor = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
                _tempCell.textLabel.textColor = [[UIColor alloc]initWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
            }
            
            //關閉內容顯示並取消選取 清除上一個cell的標示
            NSInteger rowOfTheCell = [[_activityTableView indexPathForCell:_lastCell] row];
            rowOfTheCell+=1;
            [_finishArray removeObjectAtIndex:rowOfTheCell];
            [_activityTableView deleteRowsAtIndexPaths:[self indexPathsForExpandRow:indexPath.row] withRowAnimation:UITableViewRowAnimationTop];
            
            _cellExpand = false;
            [_activityTableView deselectRowAtIndexPath:indexPath animated:YES];
            _lastCell = nil;
        }
        /*
        else//點擊另一個cell 且本來有cell展開
        {
            //取消選取上一個並收起上一個的內容 顯示點擊的這個的內容 把上一個cell的標示指向現在這個
            int modifyForRow=0;
            [_activityTableView deselectRowAtIndexPath:[_activityTableView indexPathForCell:_lastCell] animated:YES];
            NSInteger rowOfTheCell = [[_activityTableView indexPathForCell:_lastCell] row];
            rowOfTheCell+=1;
            [_finishArray removeObjectAtIndex:rowOfTheCell];
            rowOfTheCell-=1;
            [_activityTableView deleteRowsAtIndexPaths:[self indexPathsForExpandRow:rowOfTheCell] withRowAnimation:UITableViewRowAnimationTop];
            
            _lastCell=[_activityTableView cellForRowAtIndexPath:indexPath];
            
            for(NSInteger i=0 ; i< [_activityTableView numberOfRowsInSection:0];i++)
            {
                _tempCell =[_activityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
                _tempCell.contentView.backgroundColor = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
                _tempCell.textLabel.textColor = [[UIColor alloc]initWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
            }
            
            rowOfTheCell = [indexPath row];
            //rowOfTheCell+=1;
            rowOfTheCell += modifyForRow;
            [_finishArray insertObject:cellText atIndex:rowOfTheCell];
            rowOfTheCell-=1;
            [_activityTableView insertRowsAtIndexPaths:[self indexPathsForExpandRow:rowOfTheCell] withRowAnimation:UITableViewRowAnimationTop];
            _contentCell=[_activityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
            _contentCell.contentView.backgroundColor = [[UIColor alloc]initWithRed:0.0/255.0 green:136.0/255.0 blue:0.0/255.0 alpha:1];
            _contentCell.textLabel.textColor = [[UIColor alloc]initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
            
            //_lastCell=[_activityTableView cellForRowAtIndexPath:indexPath];
        }*/
    }
}

- (NSArray *)indexPathsForExpandRow:(NSInteger)row {
    NSMutableArray *indexPaths = [NSMutableArray array];
    int ExpandCount = 1;//展開長度
    for (int i = 1; i <= ExpandCount; i++) {
        NSIndexPath *idxPth = [NSIndexPath indexPathForRow:row + i inSection:0];
        [indexPaths addObject:idxPth];
    }
    return [indexPaths copy];
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
