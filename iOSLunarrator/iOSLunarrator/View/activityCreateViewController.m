//
//  activityCreateViewController.m
//  iOSLunarrator
//
//  Created by cg on 2017/6/15.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "activityCreateViewController.h"
#import "Activity.h"
#import "ActivityPool.h"
#import "activityPage.h"

@interface activityCreateViewController ()
@property (weak, nonatomic) IBOutlet UITextView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *createBut;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *wholeView;
@property (weak, nonatomic) IBOutlet UIButton *startDateBut;
@property (weak, nonatomic) IBOutlet UIButton *endDateBut;
@property (weak, nonatomic) IBOutlet UITextField *activityTitle;
@property (strong, nonatomic) NSDate *pickedStartDate;
@property (strong, nonatomic) NSDate *pickedEndDate;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;

@end

@implementation activityCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _contentView.layer.borderWidth = 1.0f;
    _contentView.layer.borderColor = [[UIColor grayColor] CGColor];
    _contentView.layer.masksToBounds = YES;
    _contentView.layer.cornerRadius = 15.0f;
    _contentView.delegate = self;
    [self setButBorder:_createBut];
    [self setButBorder:_cancelBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startTimeSelect:(id)sender {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view addSubview:datePicker];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy / M / d"];
        NSString *dateString = [dateFormat stringFromDate:datePicker.date];
        _pickedStartDate = datePicker.date;
        unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:flags fromDate:_pickedStartDate];
        NSDate* dateOnly = [calendar dateFromComponents:components];
        _pickedStartDate = dateOnly;
        [_startDateBut setTitle:dateString forState:UIControlStateNormal];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:^{ }];
}

- (IBAction)endTimeSelect:(id)sender {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view addSubview:datePicker];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy / M / d"];
        NSString *dateString = [dateFormat stringFromDate:datePicker.date];
        _pickedEndDate = datePicker.date;
        unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:flags fromDate:_pickedEndDate];
        NSDate* dateOnly = [calendar dateFromComponents:components];
        _pickedEndDate = dateOnly;
        [_endDateBut setTitle:dateString forState:UIControlStateNormal];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:^{ }];
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

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"請在此輸入活動內容"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"請在此輸入活動內容";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

//建立鈕按下後
- (IBAction)activityCreateClicked:(id)sender {
    if([_pickedEndDate compare:_pickedStartDate] != NSOrderedAscending)
    {
        Activity *newActivity= [[Activity alloc] init];
        ActivityPool *pool = [ActivityPool sharedInstance];
        newActivity.title = _activityTitle.text;
        newActivity.startTime = _pickedStartDate;
        newActivity.endTime = _pickedEndDate;
        newActivity.content = _contentView.text;
    
        [pool saveActivity:newActivity];
        //save finish
        activityPage* activitypage;
        if (activitypage == nil)
        {
            activitypage = [[activityPage alloc] initWithNibName:@"activityPage" bundle:nil];
        }
    
        [self dismissViewControllerAnimated:YES completion:nil];
        //self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //[self presentViewController: activitypage animated:YES completion:nil];
    }
    else
    {
        _warningLabel.text=@"您的結束日期早於開始日期！請重新輸入";
    }
    
}
- (IBAction)cancelBtnClicked:(id)sender {
    activityPage* activitypage;
    if (activitypage == nil)
    {
        activitypage = [[activityPage alloc] initWithNibName:@"activityPage" bundle:nil];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
