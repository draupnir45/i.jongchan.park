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
@property NSDictionary *dataDict;
@property (nonatomic, weak) UITableView *tableView;
@property CGFloat cellImageSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Twitter";
    
    self.dataDict = @{ @0 : @{ @"name" : @"주영만",
                               @"id" : @"@youngman",
                               @"tweetText" : @"이는 청춘 청춘에서만 싹이 고행을 무엇을 원질이 있으랴? 어디 이상의 커다란 듣는다. 이것이야말로 뜨거운지라, 얼마나 굳세게 끓는 동력은 부패뿐이다. 우리 들어 바이며, 온갖 사랑의 그들의 이상의 살 칼이다.",
                               @"share" : @2,
                               @"retweet" : @2,
                               @"likes" : @5 },
                       @1 : @{ @"name" : @"야곰",
                               @"id" : @"@yagom",
                               @"tweetText" : @"않는 같지 얼음이 있는 그들은 못할 평화스러운 봄바람이다.",
                               @"share" : @4,
                               @"retweet" : @20,
                               @"likes" : @3 },
                       @2 : @{ @"name" : @"홍정기",
                               @"id" : @"@junki.hong",
                               @"tweetText" : @"두손을 소리다.이것은 고행을 지혜는 것이다. 전인 무엇을 것이 풀이 두기 보라. 과실이 우리는 이는 열락의 뿐이다. 곧 있음으로써 청춘을 같은 무엇을 위하여 그들을 군영과 교향악이다.",
                               @"share" : @2,
                               @"retweet" : @10,
                               @"likes" : @2 },
                       @3 : @{ @"name" : @"짱맨",
                               @"id" : @"@king_joe",
                               @"tweetText" : @"이것이야말로 뜨거운지라, 얼마나 굳세게 끓는 동력은 부패뿐이다.",
                               @"share" : @10,
                               @"retweet" : @40,
                               @"likes" : @3 },
                       @4 : @{ @"name" : @"고고고",
                               @"id" : @"@gogogo",
                               @"tweetText" : @"두손을 소리다.이것은 고행을 지혜는 것이다. 전인 무엇을 것이 풀이 두기 보라. 과실이 우리는 이는 열락의 뿐이다.",
                               @"share" : @3,
                               @"retweet" : @2,
                               @"likes" : @1 },
                       @5 : @{ @"name" : @"떠들지마",
                               @"id" : @"@justbreakup",
                               @"tweetText" : @"두손을 소리다.이것은 고행을 지혜는 것이다. 전인 무엇을 것이 풀이 두기 보라. 과실이 우리는 이는 열락의 뿐이다. 곧 있음으로써 청춘을 같은 무엇을 위하여 그들을 군영과 교향악이다. 보배를 그들에게 굳세게 같은 이것이다. 품고 황금시대의 능히 청춘의 운다.",
                               @"share" : @3,
                               @"retweet" : @2,
                               @"likes" : @10 },
                       };
    
//    self.dataArray = @[
//                       @"이는 청춘 청춘에서만 싹이 고행을 무엇을 원질이 있으랴? 어디 이상의 커다란 듣는다. 이것이야말로 뜨거운지라, 얼마나 굳세게 끓는 동력은 부패뿐이다. 우리 들어 바이며, 온갖 사랑의 그들의 이상의 살 칼이다.",
//                       @"않는 같지 얼음이 있는 그들은 못할 평화스러운 봄바람이다. ",
//                       @"두손을 소리다.이것은 고행을 지혜는 것이다. 전인 무엇을 것이 풀이 두기 보라. 과실이 우리는 이는 열락의 뿐이다. 곧 있음으로써 청춘을 같은 무엇을 위하여 그들을 군영과 교향악이다. 보배를 그들에게 굳세게 같은 이것이다. 품고 황금시대의 능히 청춘의 운다. 생명을 반짝이는 얼음이 이것이다."];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.separatorColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    
    self.cellImageSize = 54;
    
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
    return self.dataDict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseID"];
    }

    NSDictionary *cellData = [self.dataDict objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    cell.profilePhoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row]];
    cell.nameLabel.text = [cellData objectForKey:@"name"];
    cell.idLabel.text = [cellData objectForKey:@"id"];
    cell.customTextLabel.text = [cellData objectForKey:@"tweetText"];
    cell.imageSize = self.cellImageSize;
    
    [cell.customTextLabel setNumberOfLines:0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        NSDictionary *cellData = [self.dataDict objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    
    return [self calcRowHeightForText:[cellData objectForKey:@"tweetText"]];
    
}


-(CGFloat)calcRowHeightForText:(NSString *)text {
    
    CGSize constraint = CGSizeMake(self.view.frame.size.width - self.cellImageSize - 30, 20000.0f);
    
    UIFont *font = [UIFont systemFontOfSize:17 weight:-0.3];
    CGRect frame = [text boundingRectWithSize:constraint options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil];
    
    CGFloat textHeight = MAX(frame.size.height, 44.0f);
    
    CGFloat nameLabelHeight = 20;
    
    CGFloat margin = 8;
    
    return textHeight + nameLabelHeight + (margin*3);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 20.0;
//}



@end
