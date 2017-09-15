//
//  explanation.h
//  iOSLunarrator
//
//  Created by cg lab on 2017/6/16.
//  Copyright © 2017年 cg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface explanation : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>{
NSArray<NSArray<NSString*>*> *arOptions;
}

@end
