//
//  FavoritePMViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 22..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "FavoritePMViewController.h"
#import "DetailViewController.h"
#import "PokemonData.h"
#import "SettingData.h"
#import "PokemonTableViewCell.h"



@interface FavoritePMViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;
@property PokemonData *sharedData;
@property SettingData *settings;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *EditButton;

@end



@implementation FavoritePMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1세대";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    self.sharedData = [PokemonData sharedData];
    self.settings = [SettingData sharedSettings];


}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settings.favoritePokemonIndexes.count;
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
    
    NSInteger pmIndex = [[self.settings.favoritePokemonIndexes objectAtIndex:indexPath.row] integerValue];
    cell.numberLabel.text = [NSString stringWithFormat:@"NO.%03ld",pmIndex+1];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. %@",indexPath.row+1, self.sharedData.pokemonName[pmIndex]];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thumbnails/thumbnail_%ld.png",pmIndex+1]]];
    return cell;
    
}



#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:[tableView cellForRowAtIndexPath:indexPath]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}



- (IBAction)startEditing:(id)sender {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
        [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
    }
    
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.settings.favoritePokemonIndexes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *detailView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSInteger pmIndex = [[self.settings.favoritePokemonIndexes objectAtIndex:indexPath.row] integerValue];
        detailView.pokemonIndex = pmIndex;
    }
}

@end
