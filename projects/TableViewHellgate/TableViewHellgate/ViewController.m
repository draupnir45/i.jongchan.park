//
//  ViewController.m
//  TableViewHellgate
//
//  Created by 박종찬 on 2017. 2. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "JournalItems.h"
#import "SecondViewController.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate>

@property UITableView *tableView;
@property (nonatomic) NSMutableArray *dataArray;
@property SecondViewController *secondCont
;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect superViewFrame = self.view.frame;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, superViewFrame.size.width, superViewFrame.size.height*3/5) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self setDataArray];
    
//    SecondViewController *newCont = [[SecondViewController alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setDataArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 10; i++) {
        JournalItems *temp = [[JournalItems alloc] init];
        temp.journalTitle = @"타이틀입니다.";
        temp.journalContent =@"넣는 물방아 못할 같지 이상은 사막이다. 품으며, 새가 쓸쓸한 가지에 안고, 군영과 사는가 황금시대다. 피고 청춘이 사는가 사랑의 청춘의 새 듣는다. 구하지 것이다.보라, 설레는 품었기 뛰노는 위하여서. 바로 피가 끓는 인류의 ? 이것을 내려온 찾아 사람은 뜨거운지라, 보내는 아니다. 아니더면, 열락의 심장의 앞이 방황하였으며, 용감하고 끝까지 속에 피다. 품으며, 오직 가는 바이며, 자신과 기쁘며, 끓는 눈에 아니다.\n\n하는 원대하고, 품고 능히 그들의 인간의 투명하되 청춘에서만 있다. 뭇 황금시대를 충분히 만천하의 것이다. 풀이 방황하여도, 그와 공자는 굳세게 사막이다. 그들을 맺어, 밝은 실현에 위하여서, 아름다우냐? 고행을 보는 용감하고 보내는 것이다.보라, 청춘의 뭇 이상 듣는다. 싶이 실현에 넣는 오직 트고, 기쁘며, 커다란 전인 봄바람이다. 무한한 용기가 인류의 열락의 옷을 것이다. 놀이 살 이상의 우리 위하여서 품에 황금시대다.\n\n수 끝에 곳이 아니다. 맺어, 때에, 타오르고 것은 가장 약동하다. 인간의 그들은 밥을 이상 웅대한 인생을 이것이다. 그것을 구할 미인을 이상이 피어나기 것은 끓는다. 용기가 천하를 못하다 위하여, 피가 운다. 예가 황금시대를 가치를 현저하게 앞이 모래뿐일 이상, 때문이다. 창공에 싸인 그들의 듣는다. ";
        temp.writtenDate = [NSDate date];
        temp.image = [UIImage imageNamed:@"item2.png"];
        [array addObject:temp];
    }
    self.dataArray = array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"reuseForSimpleTableView"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseForSimpleTableView"];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    JournalItems *temp = [_dataArray objectAtIndex:indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy. M. d."];
    
    
    
    cell.textLabel.text = temp.journalTitle;
    [cell.textLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightMedium]];
    
    cell.detailTextLabel.text = [formatter stringFromDate:temp.writtenDate];
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium]];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.secondCont = [[SecondViewController alloc] init];
    NSLog(@"wow");
    [self presentViewController:self.secondCont animated:YES completion:nil];
}



@end
