//
//  ViewController.m
//  UICollectionView
//
//  Created by Kevin on 16/6/6.
//
//

#import "ViewController.h"
#import "ShopCell.h"
#import "WaterFlowLayout.h"
#import "ShopModel.h"

@interface ViewController ()<UICollectionViewDataSource,WaterFlowLayoutDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@end

static NSString *identifier = @"shopCell";

@implementation ViewController

#pragma mark -
#pragma mark -  懒加载
- (NSArray *)dataArray {
    if (nil == _dataArray) {
        
        // 路
        NSString *path = [[NSBundle mainBundle] pathForResource:@"shop.plist" ofType:nil];
        
        
        // 读
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        
        // 变
        NSMutableArray *mutable = [NSMutableArray array];
        
        // 转
        for (NSDictionary *dict in tempArray) {
            ShopModel *shopModel = [ShopModel shopModelWithDict:dict];
            
            [mutable addObject:shopModel];
        }
        
        // f
        _dataArray = mutable;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 实例化一个流水布局
    WaterFlowLayout *flowlayout = [[WaterFlowLayout alloc] init];
    
    // 赋值
    //    flowlayout.imageArray = self.dataArray;
    flowlayout.delegate = self;
    
    // 2. 实力化一个collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    
    
    // 3. 设置数据源代理
    collectionView.dataSource = self;
    
    // 4. 注册一个cell
    UINib *nib = [UINib nibWithNibName:@"ShopCell" bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
    
    // 5. collectionView 添加到控制器的view上
    [self.view addSubview:collectionView];
}


// 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 内
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    cell.shopModel = self.dataArray[indexPath.item];
    
    return cell;
}


#pragma mark -
#pragma mark - 通过代理方法返回 item的高度
- (CGFloat)waterFlowLayout:(WaterFlowLayout *)waterFlowLayout withIndexPath:(NSIndexPath *)indexPath andItemWidth:(CGFloat)width {
    ShopModel *shopModel = self.dataArray[indexPath.item];
    
    return width * shopModel.h / shopModel.w;
}


@end

