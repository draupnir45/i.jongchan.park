//
//  ViewController.m
//  PlistPrac
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[DataCenter sharedData] contacts];
    
    if (_dataArray == nil) {
        _dataArray = @[];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataCenter sharedData] contacts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseID"];
    }
    
//    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    NSDictionary *cellData = self.dataArray[indexPath.row];
    
    [cell.textLabel setText: [cellData objectForKey:@"name"]];
    [cell.detailTextLabel setText:[cellData objectForKey:@"phoneNumber"]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@", [self.dataArray objectAtIndex:indexPath.row]);

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)addButoonTapped:(id)sender {
    
    UIAlertController *insertAlert = [UIAlertController alertControllerWithTitle:@"추가하기" message:@"전화번호를 추가해 보세요." preferredStyle:UIAlertControllerStyleAlert];
    
    [insertAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"이름"];
//        [textField setTextContentType:UITextContentTypeName];
    }];
    
    [insertAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"전화번호"];
//        [textField setTextContentType:UITextContentTypeTelephoneNumber];
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"저장" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [insertAlert dismissViewControllerAnimated:YES completion:nil];
        
        NSMutableArray *array = [[self dataArray] mutableCopy];
        
        [array insertObject:@{@"name" : [[insertAlert.textFields objectAtIndex:0] text], @"phoneNumber" : [[insertAlert.textFields objectAtIndex:1] text]} atIndex:0];
        
        self.dataArray = array;
        [[DataCenter sharedData] setContacts:self.dataArray];
        
        [[DataCenter sharedData] saveData];
        
        [self.tableView reloadData];

        
    }];
    
    [insertAlert addAction:okAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [insertAlert addAction:cancelAction];
    
    [self presentViewController:insertAlert animated:YES completion:nil];
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *array = [self.dataArray mutableCopy];
        [array removeObjectAtIndex:indexPath.row];
        self.dataArray = array;
        [[DataCenter sharedData] setContacts:self.dataArray];
        [[DataCenter sharedData] saveData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



@end
