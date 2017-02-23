//
//  Gen2ViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Gen2ViewController.h"
#import "DetailViewController.h"
#import "PokemonDataSingleton.h"

@interface Gen2ViewController ()

<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;
@property PokemonDataSingleton *sharedData;



@end

@implementation Gen2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"2세대";
    
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
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId"];
    if (cell != nil) {
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@",indexPath.row +152, self.sharedData.pokemonName[indexPath.row + 151]];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thumbnails/thumbnail_%ld.png",indexPath.row+152]]];
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
//        detailView.title = self.sharedData.pokemonName[indexPath.row + 152];
//        detailView.contentsForPm = self.sharedData.pokemonDescription[indexPath.row + 152];
        detailView.pokemonIndex = indexPath.row + 151;
    }
}


@end
