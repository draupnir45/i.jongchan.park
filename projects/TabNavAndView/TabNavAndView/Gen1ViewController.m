//
//  Gen1ViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Gen1ViewController.h"
#import "DetailViewController.h"
#import "PokemonDataSingleton.h"
#import "PokemonTableViewCell.h"

@interface Gen1ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;
@property PokemonDataSingleton *sharedData;


@end

@implementation Gen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1세대";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    self.sharedData = [PokemonDataSingleton sharedData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 151;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PokemonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId"];
    if (cell != nil) {
    } else {
        cell = [[PokemonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"NO.%ld",indexPath.row +1];
    cell.textLabel.text = self.sharedData.pokemonName[indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thumbnails/thumbnail_%ld.png",indexPath.row+1]]];
    return cell;
    
}
#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:[tableView cellForRowAtIndexPath:indexPath]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *detailView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//        detailView.title = self.sharedData.pokemonName[indexPath.row];
//        detailView.contentsForPm = self.sharedData.pokemonDescription[indexPath.row];
        detailView.pokemonIndex = indexPath.row;
    }
}


@end
