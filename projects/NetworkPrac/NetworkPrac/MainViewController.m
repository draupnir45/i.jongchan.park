//
//  MainViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "MainViewController.h"
#import "DataCenter.h"
#import "PostModel.h"
#import "CustomTableViewCell.h"
#import "JCFullScreenActivityIndicatorView.h"
#import "JCAlertController.h"
#import "PostingViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSInteger showingPage;
@property NSInteger lastPage;
@property JCFullScreenActivityIndicatorView *indicatorView;
@property UIRefreshControl *refreshControl;
@property NSInteger postCount;



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //데이터 초기화
    self.dataArray = @[];
    self.lastPage = 0;
    self.showingPage = 0;
    
    //인디케이터뷰
    self.indicatorView = [[JCFullScreenActivityIndicatorView alloc] init];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCellImage:) name:@"gotImage" object:nil];
    
    self.title = @"메인";
    
    //리프레시 컨트롤
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor lightGrayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(refreshData)
                  forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = self.refreshControl;

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    static dispatch_once_t onceTokenForInitialFetch;
    dispatch_once(&onceTokenForInitialFetch, ^{
        [self getData];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - Loading Data

- (void)refreshData {
    self.showingPage = 0;
    self.lastPage = 0;

    [self getData];
}

- (void)getData{
    
    self.showingPage ++;
    if (self.showingPage <= self.lastPage || self.lastPage == 0) {
        
        if (!self.refreshControl.refreshing) {
            [self.view addSubview:self.indicatorView];
            [self.indicatorView start];
            
        }
        
        [[DataCenter sharedData] getPostDataOnPage:self.showingPage completion:^(BOOL sucess, NSDictionary *dataDict) {
            NSArray *resultArray = [dataDict objectForKey:@"results"];
            NSMutableArray *dataArray = [self.dataArray mutableCopy];
            if (self.showingPage == 1) {
                [dataArray removeAllObjects];
            }
            for (NSDictionary *dict in resultArray) {
                PostModel *model = [[PostModel alloc] initWithDict:dict];
                [dataArray addObject:model];
            }
            
            self.dataArray = dataArray;
            
            self.postCount = [[dataDict objectForKey:@"count"] integerValue];
            
            if (self.postCount % 10 == 0) {
                self.lastPage = self.postCount / 10;
            } else {
                self.lastPage = (self.postCount / 10) + 1;
            }
            
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            
            dispatch_sync(main_queue, ^{
                [self.tableView reloadData];
                
                if (self.refreshControl.refreshing) {
                    [self.refreshControl endRefreshing];
                } else {
                    [self.view sendSubviewToBack:self.indicatorView];
                    [self.indicatorView removeFromSuperview];
                }
            });
            
            

        }];
    }
}



#pragma mark - Button Actions

- (IBAction)postBtnSelected:(id)sender {
    
    if ([[[DataCenter sharedData] userToken] length]>0) {
        [self performSegueWithIdentifier:@"PostingViewSegue" sender:self];
    } else {
        [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
    }
    
}
- (IBAction)logOut:(id)sender {
    
//    [[DataCenter sharedData] logOutRequest];
    [[DataCenter sharedData] logOutRequestWithCompletion:^(BOOL sucess, NSDictionary *dataDict) {
        if (sucess) {
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            
            dispatch_sync(main_queue, ^{
                
                [self presentViewController:[JCAlertController alertControllerWithTitle:@"로그아웃 성공!" message:nil preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:^{
                    [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
                }];
                
            });
        } else {
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            
            dispatch_sync(main_queue, ^{
                
                [self presentViewController:[JCAlertController alertControllerWithTitle:@"무언가가 잘못되었습니다." message:@"다시 시도해 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:nil];
                
            });
        }
    }];
    
    
}



#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FCiOSCell"];
    
    PostModel *item = self.dataArray[indexPath.row];
    cell.titleLabel.text = item.title;
    cell.contentLabel.text = item.content;
    
    if ([[[DataCenter sharedData] imgDict] objectForKey:[NSNumber numberWithInteger:item.postPK]]) {
        NSData *data = [[[DataCenter sharedData] imgDict] objectForKey:[NSNumber numberWithInteger:item.postPK]];
        cell.fcImageView.image = [UIImage imageWithData:data];
        cell.fcImageView.frame = CGRectMake(0, 0, 100, 100);
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row > self.dataArray.count - 2) {
        [self getData];
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"DetailViewSegue" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

- (void)changeCellImage:(NSNotification *)notification {
    
    NSInteger postPK = [[notification.userInfo objectForKey:@"Post_PK"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.postCount - postPK inSection:0];
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    
    dispatch_sync(main_queue, ^{
        
        CustomTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        NSData *data = [[[DataCenter sharedData] imgDict] objectForKey:[NSNumber numberWithInteger:postPK]];
        cell.fcImageView.image = [UIImage imageWithData:data];
        
    });
    
    
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        DetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:((CustomTableViewCell *)sender)];
        destinationVC.post = [self.dataArray objectAtIndex:indexPath.row];
//        destinationVC.imageView.image = ((CustomTableViewCell *)sender).fcImageView.image;
    }
}

@end
