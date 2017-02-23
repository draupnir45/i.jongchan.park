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
    
    return cell;
}
- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)battleSix:(UISwitch *)sender {
    ////////////////////////이씀!!!
    NSLog(@"여섯마리 제한 넣을 필요 있음");
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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"FavoritePokemonSegue"]) {
//        
//    }
//}

@end
