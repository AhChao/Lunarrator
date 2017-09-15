//
//  explanation.m
//  iOSLunarrator
//
//  Created by cg lab on 2017/6/16.
//  Copyright © 2017年 cg. All rights reserved.
//

#import "explanation.h"
#import "goodDay.h"

@interface explanation ()
@property(nonatomic, strong) UITableView *tblOptions;
@end

@implementation explanation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tblOptions = [[UITableView alloc] initWithFrame:CGRectMake(0, 15, self.view.frame.size.width, self.view.frame.size.height-50) style:UITableViewStylePlain];
    _tblOptions.delegate = self;
    _tblOptions.dataSource = self;
    _tblOptions.layer.masksToBounds= YES;
    _tblOptions.layer.cornerRadius = 10.0f;
    [self.view addSubview:_tblOptions];
    arOptions = @[
                  @[@"嫁娶: 結婚典禮、迎親之日",
                    @"納采: 同結婚姻，收授聘金；俗稱：訂婚、文定、過訂、完聘、大定",
                    @"問名: 男女雙方各取年庚，供於神案，經數日無事即可合婚",
                    @"納婿: 同嫁娶，男方入贅於女方為婿",
                    @"歸寧: 新婚後，新娘與新郎第一次回娘家",
                    @"安床: 安置睡床臥鋪，一為新婚安置新床、二為事事不順重新安新床",
                    @"合帳: 製作蚊帳之事，今應指安置窗簾",@"冠笄:	男弱冠，女及笄，為青少年的所舉行的成年禮儀式(一般為16歲)",
                    @"訂盟: 訂婚儀式的一種，俗稱小聘(訂)",
                    @"進人口: 指收納養子女，或認乾兒子、乾女兒"],
                  @[@"入宅: 遷入新宅，即所謂新居落成典禮",
                    @"安香: 安土地公或祖先之神位",
                    @"安門: 房屋裝設門戶等工事",
                    @"修造: 僅指陽宅之改造與修理",
                    @"動土: (起基)是指陽宅建築開始動工；註：常被誤用為(破土)",
                    @"上梁: 裝上建築物屋頂的大梁，西式建築指屋頂之灌漿(預拌混凝土)",
                    @"豎柱: 架馬俗稱起工架馬；指建築場所之鷹架",
                    @"掘井: 開渠、築陰溝、開魚池；開鑿水井、池塘",
                    @"破屋: 壞垣、拆卸；拆除房屋或圍牆",
                    @"補垣: 塞穴、填坑、覆井；塞穴指堵塞洞穴或蟻穴"],
                  @[@"開市: (開工)新公司行號開業、開幕或年初頭一天開張動工",
                    @"掛匾: 指懸掛招牌或各種匾額",
                    @"立券: 交易、訂立各種契約互相買賣之事",
                    @"納財: 五穀入倉，商賈之置貨、收租、收帳、討債，借款購屋，貸款等",
                    @"開倉: 出貨財，商賈之出貨、銷貨、放債",
                    @"經絡: 安機器 安紡車",
                    @"造車器: 造舟船；製造水陸交通工具(適新車交車)",
                    @"醞釀: 割蜜、造曲釀酒，養蜂取蜜(醞釀；辛日不宜)"],
                  @[@"祭祀: 指祠堂拜祭祖先或廟宇之祭拜神明等事項",
                    @"祈福: 祈求神明降福或設醮還願等事",
                    @"求嗣: 指向神明祈求後嗣（子孫）之意",
                    @"開光: 佛像塑成後點眼入神，供奉上位之事",
                    @"沐浴: 祈福設醮或還願時清潔身體之謂",
                    @"齋醮: 廟宇建醮前需舉行的齋戒儀式",
                    @"酬神: 還願，答謝神恩",
                    @"普渡: 祭祀超渡陰界的好兄弟",
                    @"造廟: 建造寺，廟，宮，觀，堂"],
                  @[@"出行: 指遠行，如：外出旅行，觀光遊覽",
                    @"移徙: 指搬家遷移住所之意",
                    @"分居: 大家庭分家，另起爐灶，適用於分爐之出火，安香",
                    @"出火 :火指香火，即宜動神位之意",
                    @"理髮: 僅指初生嬰兒第一次剃胎髮，或出家之落髪",
                    @"習藝: 學習特殊技藝，行拜師禮",
                    @"栽種: 栽種植物，或接枝",
                    @"納畜: 牧養、收買入家畜、家禽、寵物等",
                    @"捕捉: 斷蟻，撲滅家中或農作物之害蟲生物",
                    @"放水: 建築，清理池塘或水族箱後，將水注入蓄池"],
                  @[@"修墳: 修理墳墓",
                    @"啟鑽: 指洗骨、俗謂、拾金(撿骨)",
                    @"破土: 僅指埋葬用的陰宅墓地破土，與一般建築房屋的(陽宅、動土)不同",
                    @"安葬: 處理埋葬事宜的儀式(行喪：指到喪家慰問遺族)",
                    @"立碑: 豎立墓碑或紀念碑",
                    @"謝土: 建築物完工後，所舉行的祭祀",
                    @"除服: 脫下喪服(成服：即穿上喪服)",
                    @"移柩: 行葬儀時，將棺木移出屋外之事",
                    @"入殮: 將屍體放入棺材之意",
                    @"解除: 掃捨；指沖洗宅舍、解除災厄"],
                  ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack:(id)sender {
    goodDay *goodday = [[goodDay alloc] initWithNibName:@"goodDay" bundle:nil];
    [self presentModalViewController:goodday animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; // Pre-iOS6 use UILineBreakModeWordWrap
        cell.textLabel.numberOfLines = 2;  // 0 means no max.
    }
    NSString* type = arOptions[indexPath.section][indexPath.row];
    cell.textLabel.text = type;
//    if([arSelectedRows containsObject:type]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    }
//    else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return arOptions.count;
}


@end
