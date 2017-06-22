//
//  SettingViewController.m
//  BiblyPlay
//
//  Created by 박종찬 on 2017. 2. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseID"];
    
    cell.textLabel.text = @"자동 로그인";
    UISwitch *ssoSwitch = [[UISwitch alloc] init];
    cell.accessoryView = ssoSwitch;
    [ssoSwitch addTarget:self action:@selector(setSSO:) forControlEvents:UIControlEventValueChanged];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}

-(void)setSSO:(UISwitch *)sender {
    NSLog(@"SSO세팅!");
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"SingleSignON"];
}
- (IBAction)stopBtnSelected:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
