//
//  MainViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "MainViewController.h"
#import "DataCenter.h"

@interface MainViewController ()
<UITableViewDataSource, UITableViewDelegate>


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"메인";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
//    BOOL autoLoginable = NO;
//    
//    if (!autoLoginable) {
//        [self performSegueWithIdentifier:@"LoginViewSegue" sender:nil];
//    }
}

- (IBAction)postBtnSelected:(id)sender {
    
    if ([[[DataCenter sharedData] userToken] length]>0) {
        [self performSegueWithIdentifier:@"PostingViewSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
    }
    
}
- (IBAction)logOut:(id)sender {
    
    [[DataCenter sharedData] logOutRequest];
    
    [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCiOSCell"];
    
    cell.textLabel.text = @"test";
    
    return cell;
}


@end
