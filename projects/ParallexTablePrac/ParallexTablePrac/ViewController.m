//
//  ViewController.m
//  ParallexTablePrac
//
//  Created by 박종찬 on 2017. 2. 18..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "ParallexCell.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (ParallexCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ParallexCell *cell = [tableView dequeueReusableCellWithIdentifier:@"parallexReuseID"];
    
    if (cell == nil) {
        cell = [[ParallexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"parallexReuseID"];
    }

    cell.backgroundImageView.image = [UIImage imageNamed:@"test.png"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
}

@end
