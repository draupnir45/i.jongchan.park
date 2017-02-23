//
//  SettingViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"

@interface SettingViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UISwitch *tintSwitch;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseID"];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"즐겨찾기 포켓몬";
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            } else {
                cell.textLabel.text = @"배틀식스";
                UISwitch *switchView = [[UISwitch alloc] init];
                cell.accessoryView = switchView;
                [switchView addTarget:self action:@selector(battleSix:) forControlEvents:UIControlEventValueChanged];
            }
            break;
        default:
            cell.textLabel.text = @"틴트컬러 바꾸기";
            UISwitch *switchView = [[UISwitch alloc] init];
            cell.accessoryView = switchView;
            self.tintSwitch = switchView;
            [switchView addTarget:self action:@selector(tintColorChange:) forControlEvents:UIControlEventValueChanged];
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            self.tintSwitch.on = appDelegate.tintChanged;
            break;
    }
    
    if ([cell.accessoryView isMemberOfClass:[UISwitch class]]) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)battleSix:(UISwitch *)sender {
    ////////////////////////이씀!!!
    NSLog(@"여섯마리 제한 넣을 필요 있음");
    
    NSIndexPath *indexPath = [_tableView indexPathForCell:(UITableViewCell *)[sender superview]];
    NSLog(@"s:%ld, r:%ld", indexPath.section, indexPath.row);
}


- (void)tintColorChange:(UISwitch *)sender {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate setTintChanged:sender.on];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self performSegueWithIdentifier:@"FavoritePokemonSegue" sender:[tableView cellForRowAtIndexPath:indexPath]];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"즐겨찾기";
            break;
            
        default:
            return @"사용자 설정";
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return @"배틀식스 모드를 켜면 즐겨찾기가 6마리까지만 포함되며, 같은 포켓몬을 집어넣을 수도 있습니다.";
    } else {
        return nil;
    }


}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"FavoritePokemonSegue"]) {
//        
//    }
//}

@end
