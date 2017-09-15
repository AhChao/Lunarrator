//
//  goodDay.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "goodDay.h"
#import "LunarDay.h"
#import "explanation.h"
#import "calendarPage.h"
@interface goodDay ()
@property(nonatomic, strong) UITableView *tblOptions;
@property(nonatomic, strong) UIButton *btnAlert;
@property(nonatomic, strong) NSString *yjType;
@end
@implementation goodDay

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    //for(int i = 1; i <= 20; i++) {
        //[arOptions addObject:[NSString stringWithFormat:@"Option %i", i]];
    //}
    [self setButBorder: _btnExplaination];
    [self setButBorder: _btnBack];
    [self setButBorder: _btnSearch];
    _yjType = @"nml_Y";
    if([_yjType isEqual: @"nml_Y"]){
        _btnY.layer.borderWidth=1.0f;
        _btnY.layer.borderColor=[[UIColor redColor] CGColor];
        _btnY.layer.cornerRadius = 5;
    }
    arOptions = @[
                  @[@"嫁娶",@"納采",@"問名",@"納婿",@"歸寧",@"安床",@"合帳",@"冠笄",@"訂盟",@"進人口"],
                  @[@"入宅",@"安香",@"安門",@"修造",@"動土",@"上梁",@"豎柱",@"掘井",@"破屋",@"補垣"],
                  @[@"開市",@"掛匾",@"立券",@"納財",@"開倉",@"經絡",@"造車器",@"醞釀"],
                  @[@"祭祀",@"祈福",@"求嗣",@"開光",@"沐浴",@"齋醮",@"酬神",@"普渡",@"造廟"],
                  @[@"出行",@"移徙",@"分居",@"出火",@"理髮",@"習藝",@"栽種",@"納畜",@"捕捉",@"放水"],
                  @[@"修墳",@"啟鑽",@"破土",@"安葬",@"立碑",@"謝土",@"除服",@"移柩",@"入殮",@"解除"],
                ];
    
//    [arOptions addObject:[NSString stringWithFormat:@"嫁娶"]];
//    [arOptions addObject:[NSString stringWithFormat:@"納采"]];
//    [arOptions addObject:[NSString stringWithFormat:@"問名"]];
//    [arOptions addObject:[NSString stringWithFormat:@"納婿"]];
//    [arOptions addObject:[NSString stringWithFormat:@"歸寧"]];
//    [arOptions addObject:[NSString stringWithFormat:@"安床"]];
//    [arOptions addObject:[NSString stringWithFormat:@"合帳"]];
//    [arOptions addObject:[NSString stringWithFormat:@"冠笄"]];
//    [arOptions addObject:[NSString stringWithFormat:@"訂盟"]];
//    [arOptions addObject:[NSString stringWithFormat:@"進人口"]];

    //
    arSelectedRows = [[NSMutableArray alloc] init];
    
    _btn.layer.borderWidth=1.0f;
    _btn.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    _btn.layer.cornerRadius = 5;
    
    _lblResult.lineBreakMode = UILineBreakModeWordWrap;
    _lblResult.numberOfLines = 0;
    

    //
    sDatePicker = [[UIDatePicker alloc]init];
    sDatePicker.datePickerMode=UIDatePickerModeDate;
    
    [self.sDate setInputView:sDatePicker];
    

    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelecteSDate)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn,nil]];
    [self.sDate setInputAccessoryView:toolBar];
    
    eDatePicker = [[UIDatePicker alloc]init];
    eDatePicker.datePickerMode=UIDatePickerModeDate;
    
    [self.eDate setInputView:eDatePicker];
    
    UIToolbar *toolBarE = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtnE = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelecteEDate)];
    UIBarButtonItem *spaceE = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBarE setItems:[NSArray arrayWithObjects:spaceE,doneBtnE,nil]];
    [self.eDate setInputAccessoryView:toolBarE];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY/M/d"];
    self.eDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:eDatePicker.date]];
    self.sDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:sDatePicker.date]];
}

- (IBAction)typeSelect:(id)sender {
    _tblOptions = [[UITableView alloc] initWithFrame:CGRectMake(0, 15, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tblOptions.delegate = self;
    _tblOptions.dataSource = self;
    [self.view addSubview:_tblOptions];
    //
    _btnAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnAlert.frame = CGRectMake(20, self.view.frame.size.height - 50 + 5, self.view.frame.size.width - 20 - 20, 50 - 10);
    [_btnAlert setTitle:@"Selected Rows" forState:UIControlStateNormal];
    [_btnAlert addTarget:self action:@selector(btnAlertTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnAlert];
}


-(void)ShowSelecteSDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY/M/d"];
    self.sDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:sDatePicker.date]];
    [self.sDate resignFirstResponder];
}
-(void)ShowSelecteEDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY/M/d"];
    self.eDate.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:eDatePicker.date]];
    [self.eDate resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}
- (IBAction)btnYclick:(id)sender {
    _yjType = @"nml_Y";
    if([_yjType isEqual: @"nml_Y"]){
        _btnY.layer.borderWidth=1.0f;
        _btnY.layer.borderColor=[[UIColor redColor] CGColor];
        _btnY.layer.cornerRadius = 5;
        _btnJ.layer.borderWidth=0;
        _btnJ.layer.borderColor=[[UIColor whiteColor] CGColor];
        _btnJ.layer.cornerRadius = 0;
    }
}
- (IBAction)btnJclick:(id)sender {
    _yjType = @"nml_J";
    if([_yjType isEqual: @"nml_J"]){
        _btnJ.layer.borderWidth=1.0f;
        _btnJ.layer.borderColor=[[UIColor redColor] CGColor];
        _btnJ.layer.cornerRadius = 5;
        _btnY.layer.borderWidth=0;
        _btnY.layer.borderColor=[[UIColor whiteColor] CGColor];
        _btnY.layer.cornerRadius = 0;
    }
}

- (IBAction)search:(id)sender {
    NSString *result = @"";
    //NSLog(_btn.currentTitle);
    NSArray *myBtnWords = [_btn.currentTitle componentsSeparatedByString:@", "];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    NSDate *startDate = sDatePicker.date;
    NSDate *nextDate = startDate;
    NSDate *endDate = eDatePicker.date;
    //endDate = [endDate dateByAddingTimeInterval:60*60*24*1];
    //NSComparisonResult result = [nextDate compare:endDate];
    do{
        NSDateFormatter *formatterYYYY = [[NSDateFormatter alloc]init];
        [formatterYYYY setDateFormat:@"YYYY"];
        NSString *YYYY  = [NSString stringWithFormat:@"%@",[formatterYYYY   stringFromDate:nextDate]];
        NSDateFormatter *formatterM = [[NSDateFormatter alloc]init];
        [formatterM setDateFormat:@"M"];
        NSString *M  = [NSString stringWithFormat:@"%@",[formatterM stringFromDate:nextDate]];
        NSDateFormatter *formatterd = [[NSDateFormatter alloc]init];
        [formatterd setDateFormat:@"d"];
        NSString *d  = [NSString stringWithFormat:@"%@",[formatterd stringFromDate:nextDate]];
        LunarDay *Lday = [[LunarDay alloc] initWithJSON :[NSString stringWithFormat:@"%@/%@_%@_%@",YYYY,YYYY,M,d]];
        if([_yjType  isEqual: @"nml_Y"]){
            //NSLog([NSString stringWithFormat:@"%@/%@/%@ %@",YYYY,M,d,Lday.nml_Y]);
            NSArray *myWords = [Lday.nml_Y componentsSeparatedByString:@"、"];
            for(int j = 0; j < myBtnWords.count; j++){
                for(int i =0; i < myWords.count; i++){
                    //NSLog(myWords[i]);
                    if([myBtnWords[j] isEqualToString:myWords[i]]){
                        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@/%@/%@ %@\n",YYYY,M,d,Lday.nml_Y]];
                        break;
                    }
                }
            }
        }else if([_yjType  isEqual: @"nml_J"]){
            //NSLog([NSString stringWithFormat:@"%@/%@/%@ %@",YYYY,M,d,Lday.nml_J]);
            NSArray *myWords = [Lday.nml_J componentsSeparatedByString:@"、"];
            for(int j = 0; j < myBtnWords.count; j++){
                for(int i =0; i < myWords.count; i++){
                    //NSLog(myWords[i]);
                    if([myBtnWords[j] isEqualToString:myWords[i]]){
                        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@/%@/%@ %@\n",YYYY,M,d,Lday.nml_J]];
                        break;
                    }
                }
            }
            
        }
        nextDate = [nextDate dateByAddingTimeInterval:60*60*24*1];
    }while ([nextDate compare:endDate] == NSOrderedAscending);
    if([result  isEqual: @""]){
        result = @"查無相關資料！";
    }
    _lblResult.text = result;
    _txtvResult.text = result;
}

-(void)btnAlertTapped:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You selected" message:[[self getSelections] componentsJoinedByString:@", "] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    [_btn setTitle:[[self getSelections] componentsJoinedByString:@", "] forState:UIControlStateNormal];
    [_tblOptions removeFromSuperview];
    [_btnAlert removeFromSuperview];
}
- (IBAction)btnExplanationClick:(id)sender {
    explanation *exp = [[explanation alloc] initWithNibName:@"explanation" bundle:nil];
    [self presentModalViewController:exp animated:YES];
    
}
- (IBAction)btnBackClick:(id)sender {
    
    calendarPage* calendarpage;
    
    calendarpage = [[calendarPage alloc] initWithNibName:@"calendarPage" bundle:nil];
    
    [self presentModalViewController:calendarpage animated:YES];
}
-(NSArray *)getSelections {
    NSMutableArray *selections = [[NSMutableArray alloc] init];
    for(NSString *title in arSelectedRows) {
        [selections addObject:title];
    }
    //NSArray* section = [arOptions objectAtIndex:indexPath.section];
    //cell.textLabel.text = (NSString*)[section objectAtIndex:indexPath.row];
    return selections;
}
- (void)setButBorder:(UIButton*) btn{
    //btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //btn.frame = CGRectMake(0,0,50,50); // x,y自行設定
    //btn.layer.backgroundColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 1.0f; //設定邊線寬度
    btn.layer.borderColor = [UIColor whiteColor].CGColor; //設定邊線顏色
    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
    btn.layer.cornerRadius = 15.0f;
}
#pragma mark 	UITextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}


#pragma mark UITableView delegate functions

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *ret = @"";
    if(section == 0){
        ret = @"婚姻類";
    }else if(section == 1){
        ret = @"營建類";
    }else if(section == 2){
        ret = @"工商類";
    }else if(section == 3){
        ret = @"祭祀類";
    }else if(section == 4){
        ret = @"生活類";
    }else if(section == 5){
        ret = @"喪葬類";
    }
    return ret;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray*)arOptions[section]).count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    }
    NSString* type = arOptions[indexPath.section][indexPath.row];
    cell.textLabel.text = type;
    if([arSelectedRows containsObject:type]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return arOptions.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSArray* section = [arOptions objectAtIndex:indexPath.section];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString* type = arOptions[indexPath.section][indexPath.row];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [arSelectedRows addObject:type];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [arSelectedRows removeObject:type];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
