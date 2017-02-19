//
//  ViewController.m
//  CustomTableViewCopy
//
//  Created by 박종찬 on 2017. 2. 19..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"



@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property NSArray *dataArray;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
                       @"이는 청춘 청춘에서만 싹이 고행을 무엇을 원질이 있으랴? 어디 이상의 커다란 듣는다. 이것이야말로 뜨거운지라, 얼마나 굳세게 끓는 동력은 부패뿐이다. 우리 들어 바이며, 온갖 사랑의 그들의 이상의 살 칼이다. 끓는 방황하였으며, 때에, 것은 것이다. 싶이 넣는 예가 스며들어 얼음과 밥을 품으며, 심장의 사막이다.",
                       @"않는 같지 얼음이 있는 그들은 못할 평화스러운 봄바람이다. 고행을 청춘은 동산에는 봄바람이다. 같지 따뜻한 그러므로 있는 힘있다. 대중을 싶이 봄바람을 석가는 용감하고 피가 이것이다. 이는 있는 얼마나 고동을 꽃이 때문이다.",
                       @"두손을 소리다.이것은 고행을 지혜는 것이다. 전인 무엇을 것이 풀이 두기 보라. 과실이 우리는 이는 열락의 뿐이다. 곧 있음으로써 청춘을 같은 무엇을 위하여 그들을 군영과 교향악이다. 보배를 그들에게 굳세게 같은 이것이다. 품고 황금시대의 능히 청춘의 운다. 생명을 반짝이는 얼음이 이것이다."];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    [tableView reloadData];
    self.tableView = tableView;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseID"];
    }
    
    cell.customTextLabel.text = [self.dataArray objectAtIndex:indexPath.row];
//    [cell.textLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [cell.customTextLabel setNumberOfLines:0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = [self.dataArray objectAtIndex:indexPath.row];
    
    CGSize constraint = CGSizeMake(self.view.frame.size.width - 80, 20000.0f);
    
    UIFont *font = [UIFont systemFontOfSize:17];
    CGRect frame = [text boundingRectWithSize:constraint options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil];
    
    CGFloat height = MAX(frame.size.height, 44.0f);
    
    return height + 16;
    
}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 20.0;
//}



@end
