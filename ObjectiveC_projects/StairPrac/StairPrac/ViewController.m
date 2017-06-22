//
//  ViewController.m
//  StairPrac
//
//  Created by 박종찬 on 2017. 2. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak)UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
    
//    NSLog(@"%ld",(long)[self stairAlgoToTargetNumb:6]);
//    
//    CustomView *custom = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
//    [self.view addSubview: custom];
//    
//    [custom setDataWithImgURL:@"test.jpg" name:@"박종찬" msg:@"ㅁ이ㅓ론이ㅏㅓ몬ㅇ해ㅕㅗㅇㄹ해ㅕㅁㅇㄴ로ㅑㅕ유ㅑㅎㅁ뇨ㅠㅊㄹ먄요ㅠㅐㄹㅁ여류ㅛㅐㄴ"];
    
    
    
}

//-(NSInteger)stairAlgoToTargetNumb:(NSInteger)target {
//    switch (target) {
//        case 1:
//            return 1;
//            break;
//        case 2:
//            return 2;
//            break;
//        default:
//            return [self stairAlgoToTargetNumb:target - 1] + [self stairAlgoToTargetNumb:target -2];
//            break;
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseID"];
    }
    
    [cell setDataWithImgURL:@"test.jpg" name:@"박종찬" msg:@"ㅁ이ㅓ론이ㅏㅓ몬ㅇ해ㅕㅗㅇㄹ해ㅕㅁㅇㄴ로ㅑㅕ유ㅑㅎㅁ뇨ㅠㅊㄹ먄요ㅠㅐㄹㅁ여류ㅛㅐㄴ"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}



@end
