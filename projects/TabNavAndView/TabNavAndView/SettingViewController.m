//
//  SettingViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SettingViewController.h"
#import "AppDelegate.h"
#import "SettingData.h"

@interface SettingViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UISwitch *tintSwitch;
@property (nonatomic, weak) UISwitch *battleSixSwitch;
@property (weak) SettingData *settings;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    
    self.settings = [SettingData sharedSettings];
    

    
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
                UISwitch *battleSixSwitch = [[UISwitch alloc] init];
                battleSixSwitch.on = self.settings.battleSixEnabled;//로드
                self.battleSixSwitch = battleSixSwitch;
                cell.accessoryView = self.battleSixSwitch;
                [self.battleSixSwitch addTarget:self action:@selector(battleSix:) forControlEvents:UIControlEventValueChanged];
            }
            break;
        default:
            cell.textLabel.text = @"틴트컬러 바꾸기";
            UISwitch *switchView = [[UISwitch alloc] init];
            cell.accessoryView = switchView;
            self.tintSwitch = switchView;
            [switchView addTarget:self action:@selector(tintColorChange:) forControlEvents:UIControlEventValueChanged];
            self.tintSwitch.on = self.settings.tintColorChanged;
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
    if (self.settings.favoritePokemonIndexes.count > 6) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"이미 6마리 이상을 등록했습니다!"
                                                                       message:@"목록에서 해제하시겠어요?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:cancel];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){

            [self performSegueWithIdentifier:@"FavoritePokemonSegue" sender:self];
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
        
        [self.battleSixSwitch setOn:NO];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
    self.settings.battleSixEnabled = sender.on;//세이브
    }
    
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
        return @"배틀식스 모드를 켜면 즐겨찾기가 6마리까지만 포함됩니다.";
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
