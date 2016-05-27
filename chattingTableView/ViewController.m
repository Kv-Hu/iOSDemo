//
//  ViewController.m
//  chattingTableview
//
//  Created by Kevin on 16/5/26.
//
//

#import "ViewController.h"
#import "KVMessage.h"
#import "KVMessageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSArray *messages;

@end

@implementation ViewController

-(NSArray *)messages{
    if (_messages==nil) {
       NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray  *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *messageArray = [NSMutableArray array];
        
        KVMessage *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            KVMessage *message = [KVMessage messageWithDict:dict];
            message.hideTime = [message.time isEqualToString:lastMessage.time];
            
            [messageArray addObject:message];
            
            lastMessage =message;
        }
        _messages = messageArray;
    }
    return _messages;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark  <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    KVMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message"];
    cell.message = self.messages[indexPath.row];
    return cell;
    
}


#pragma mark   <UITableViewDelegate>


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    KVMessage *message = self.messages[indexPath.row];
    return message.cellHeight;

}



@end
