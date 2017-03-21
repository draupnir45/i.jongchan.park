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
#import "JCActivityIndicatorView.h"
#import "JCAlertController.h"
#import "PostingViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSInteger showingPage;
@property NSInteger lastPage;
@property JCActivityIndicatorView *indicatorView;
@property UIRefreshControl *tableViewRefreshControl;
@property NSInteger numberOfAllPosts;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *logOutButton;



@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //데이터 초기화
    self.dataArray = @[];
    self.lastPage = 0;
    self.showingPage = 0;
    
    //인디케이터뷰
    self.indicatorView = [[JCActivityIndicatorView alloc] init];
    
    [self updateLogOutButton];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCellImage:) name:@"gotImage" object:nil];
    
    self.title = @"메인";
    
    //리프레시 컨트롤
    self.tableViewRefreshControl = [[UIRefreshControl alloc] init];
    self.tableViewRefreshControl.backgroundColor = [UIColor lightGrayColor];
    self.tableViewRefreshControl.tintColor = [UIColor whiteColor];
    [self.tableViewRefreshControl addTarget:self
                                     action:@selector(refreshData:)
                           forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = self.tableViewRefreshControl;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self updateLogOutButton];
    static dispatch_once_t onceTokenForInitialFetch;
    dispatch_once(&onceTokenForInitialFetch, ^{
        [self loadNextPostData];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateLogOutButton {
    if ([[[DataCenter sharedData] userToken] length] == 0) {
        self.navigationItem.leftBarButtonItem = nil;
    } else {
        self.navigationItem.leftBarButtonItem = self.logOutButton;
    }
}


#pragma mark - Loading Data



- (void)loadNextPostData{
    
    self.showingPage ++;
    if (self.showingPage <= self.lastPage || self.lastPage == 0) {
        
        if (!self.tableViewRefreshControl.refreshing) { //리프레시가 아닌 상황에만 인디케이터
//            [self.indicatorView startIndicatorOnView:self.view];
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
            
            self.numberOfAllPosts = [[dataDict objectForKey:@"count"] integerValue];
            
            if (self.numberOfAllPosts % 10 == 0) {
                self.lastPage = self.numberOfAllPosts / 10;
            } else {
                self.lastPage = (self.numberOfAllPosts / 10) + 1;
            }
            
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            
            dispatch_sync(main_queue, ^{
                [self.tableView reloadData];
                
                if (self.tableViewRefreshControl.refreshing) {
                    [self.tableViewRefreshControl endRefreshing];
                } else {
//                    [self.indicatorView stopIndicator];
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
    
    [self.indicatorView startIndicatorOnView:self.view];

    [[DataCenter sharedData] logOutRequestWithCompletion:^(BOOL sucess, NSDictionary *dataDict) {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (sucess) {
                    [self.indicatorView stopIndicator];
                    [self presentViewController:[JCAlertController alertControllerWithTitle:@"로그아웃 성공!" message:nil preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:nil] animated:YES completion:nil];
                    [self updateLogOutButton];
            } else {

                    [self.indicatorView stopIndicator];
                    [self presentViewController:[JCAlertController alertControllerWithTitle:@"무언가가 잘못되었습니다." message:@"다시 시도해 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:nil];
                    [self updateLogOutButton];
            }
            
        });
    }];
}

- (void)refreshData:(id)sender {
    self.showingPage = 0;
    self.lastPage = 0;
    [self loadNextPostData];
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
    
    if ([[[DataCenter sharedData] postImageDictionary] objectForKey:[NSNumber numberWithInteger:item.postPK]]) {
        NSData *data = [[[DataCenter sharedData] postImageDictionary] objectForKey:[NSNumber numberWithInteger:item.postPK]];
        cell.customImageView.image = [UIImage imageWithData:data];
        cell.customImageView.frame = CGRectMake(0, 0, 100, 100);
    } else {
        cell.customImageView.image = [UIImage imageNamed:@"img_placeholder"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row > self.dataArray.count - 5) { //마지막 셀이 디스플레이되기 직전에 새로운 데이터를 요청.
        [self loadNextPostData];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"DetailViewSegue" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

/// image가 로드될 때마다 PK로부터 indexPath를 찾아와 이미지를 바꾸어 줍니다.
- (void)changeCellImage:(NSNotification *)notification {
    
    NSInteger postPK = [[notification.userInfo objectForKey:@"Post_PK"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.numberOfAllPosts - postPK inSection:0];
    
    CustomTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSData *data = [[[DataCenter sharedData] postImageDictionary] objectForKey:[NSNumber numberWithInteger:postPK]];
    cell.customImageView.image = [UIImage imageWithData:data];

    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:((CustomTableViewCell *)sender)];
        detailViewController.post = [self.dataArray objectAtIndex:indexPath.row];
    }
}

@end
