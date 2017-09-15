//
//  goodDay.h
//  iOSLunarrator
//
//  Created by cg on 2017/6/14.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface goodDay : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>{
    UIDatePicker *sDatePicker;
    UIDatePicker *eDatePicker;
    NSArray<NSArray<NSString*>*> *arOptions;
    NSMutableArray<NSString*> *arSelectedRows;
    //NSArray *arSelectedRows;
}
@property (weak, nonatomic) IBOutlet UITextField *sDate;
@property (weak, nonatomic) IBOutlet UITextField *eDate;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIButton *btnTest;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UITextView *txtvResult;
@property (weak, nonatomic) IBOutlet UIButton *btnY;
@property (weak, nonatomic) IBOutlet UIButton *btnJ;
@property (weak, nonatomic) IBOutlet UIButton *btnExplaination;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@end
