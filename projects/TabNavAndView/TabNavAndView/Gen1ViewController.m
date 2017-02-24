//
//  Gen1ViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Gen1ViewController.h"
#import "DetailViewController.h"
#import "PokemonData.h"
#import "PokemonTableViewCell.h"
#import "SettingData.h"

@interface Gen1ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property UITableView *tableView;
@property PokemonData *sharedData;
@property SettingData *settings;


@end

@implementation Gen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1세대";
    
    //테이블 뷰
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    //싱글턴 객체 로드
    self.sharedData = [PokemonData sharedData];
    self.settings = [SettingData sharedSettings];
    
    //설정에서 틴트컬러 변경시 커스텀 테이블뷰 셀을 위한 옵저버
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView selector:@selector(reloadData) name:@"ReloadAppDelegateTable" object:nil];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //1세대 포켓몬 수
    return 151;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PokemonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId"];
    if (cell != nil) {
        cell.numberLabel.textColor = self.view.tintColor; //설정에서 틴트컬러 변경시 리유저블 셀의 틴트컬러를 컨트롤
    } else {
        cell = [[PokemonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    }
    
    
    //셀 기본설정
    cell.tintColor = self.view.tintColor;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    //셀 데이터
    cell.numberLabel.text = [NSString stringWithFormat:@"NO.%@",[NSString stringWithFormat:@"%03ld", indexPath.row+1]];
    cell.textLabel.text = self.sharedData.pokemonName[indexPath.row];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Thumbnails/thumbnail_%ld.png",indexPath.row+1]]];
    
    
    return cell;
    
}


#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //디테일 뷰 넘기기
    [self performSegueWithIdentifier:@"detail" sender:[tableView cellForRowAtIndexPath:indexPath]];
    
    //선택 해제 해주기
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //로우 높이 설정
    return 60;
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        DetailViewController *detailView = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        //포켓몬 인덱스 전달
        detailView.pokemonIndex = indexPath.row;
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self.tableView];
}



@end
