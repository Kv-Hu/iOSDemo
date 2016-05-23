//
//  KVGameTableViewController.m
//  iOSDemo
//
//  Created by Kevin on 16-5-18.
//
//

#import "KVGameTableViewController.h"
#import "KVGame.h"
#import "KVGameCell.h"

@interface KVGameTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) NSMutableArray *games;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation KVGameTableViewController

-(NSArray *)games{

    if (_games == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"games.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *gameArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            KVGame *game = [KVGame gameWithDict:dict];
            [gameArray addObject:game];
        }
        _games = gameArray;
    }

    return _games;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
 //[self.tableView registerClass:[KVGameCell class] forCellReuseIdentifier:@"cell"];
}

//添加新数据
int i = 0;
- (IBAction)add{
    KVGame *game = [[KVGame alloc] init];
    game.title = [NSString stringWithFormat:@"变形金刚  变%d次", arc4random_uniform(50)];
    game.icon = @"0";
    
    game.number = [NSString stringWithFormat:@"%d",++i];
   game.levelIcon = @"5";
    game.moneyIcon = @"6";
    [self.games insertObject:game atIndex:0];
    [self.tableView reloadData];
}

//删除第一个数据
- (IBAction)remove:(UIButton *)sender {
    
    [self.games removeObjectAtIndex:0];
    [self.tableView reloadData];
}

//更新数据
- (IBAction)upDate:(UIButton *)sender {
    KVGame *game = self.games[2];
    game.title = [NSString stringWithFormat:@"什么游戏%d",arc4random_uniform(10)];
    [self.tableView reloadData];

}

//添加弹窗
- (IBAction)addAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否要删除" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.games removeObjectAtIndex:0];
        [self.tableView reloadData];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}




#pragma mark - DataSourceDelegte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.games.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = @"cell";
    
    KVGameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
    if (cell == nil) {
        NSLog(@"000");
       cell = [[KVGameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
      
    }
    
     cell.game = self.games[indexPath.row];
    return cell;
}


#pragma mark  <UITableViewDelegate>

//左滑删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.games removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    }



@end














