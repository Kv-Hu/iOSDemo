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

@interface KVGameTableViewController ()

@property(strong,nonatomic) NSArray *games;

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
   
}

#pragma mark - DataSourceDelegte
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.games.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = @"cell";
    
    KVGameCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        NSLog(@"000");
       cell = [[KVGameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.game = self.games[indexPath.row];
    }
    
    return cell;
}


@end














