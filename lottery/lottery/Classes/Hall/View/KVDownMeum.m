//
//  KVDownMeum.m
//  lottery
//
//  Created by Kevin on 16/7/19.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KVDownMeum.h"
#import "kvmeumItem.h"

#define KVCols 3

#define KVItemWH KVScreenWith/KVCols

@interface KVDownMeum ()

@property(nonatomic,strong) NSArray *items;

@property(nonatomic,assign)CGFloat meumH;

@property(nonatomic,strong)NSMutableArray *mutableItems;

@end

@implementation KVDownMeum


-(NSMutableArray *)mutableItems{

    if (_mutableItems == nil) {
        _mutableItems = [NSMutableArray array];
        
    }
    return _mutableItems;
}


+(instancetype)showInView:(UIView *)view items:(NSArray *)items andOriginY:(CGFloat)originY {

    NSInteger count = items.count;
    NSInteger rows = (count - 1)/KVCols +1;
    
    CGFloat meumH = KVItemWH *rows;
    
    
    KVDownMeum *downMeum = [[KVDownMeum alloc]initWithFrame:CGRectMake(0, originY , KVScreenWith, meumH)];
    
    downMeum.items = items;
    downMeum.meumH = meumH;
    
    //添加所有按钮
    [downMeum setUpAllBtn];
    
    //添加分割线
    [downMeum setUpLines];
    //添加背景颜色
    UIView *backGroundColor = [[UIView alloc ]initWithFrame:downMeum.frame];
    backGroundColor.backgroundColor = [UIColor blackColor];
    [view addSubview:backGroundColor];
    
    
    downMeum.backgroundColor = [UIColor blackColor];
    
    
    
    //向下的动画
    
    downMeum.transform = CGAffineTransformMakeTranslation(0, -meumH);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        downMeum.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        [backGroundColor removeFromSuperview];
        
    }];
    
    [view addSubview:downMeum];
    

    return downMeum;
    
}

#pragma mark - 添加分割线
-(void)setUpLines{
    
    //列
    for (int i = 0; i < KVCols -1; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        CGFloat X = (i+1)*KVItemWH;
        CGFloat Y = 0;
        CGFloat W = 1;
        CGFloat H = _meumH;
        
        view.frame = CGRectMake(X, Y, W, H);
        
        [self addSubview:view];
    }
    
    //行
    NSInteger rows = (self.items.count -1)/KVCols+1;
    for (int i = 0; i < rows -1; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        CGFloat X = 0;
        CGFloat Y = (i+1)*KVItemWH;;
        CGFloat W = KVCols *KVItemWH;
        CGFloat H = 1;
        
        view.frame = CGRectMake(X, Y, W, H);
        [self addSubview:view];
    }

}

#pragma mark - 添加所有按钮
-(void)setUpAllBtn{
   
    
    for (KVMeumItem *item in self.items) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setImage:item.image forState:UIControlStateNormal];
        
        [self.mutableItems addObject:btn];
        
        [self addSubview:btn];
    }

}

-(void)layoutSubviews{
   

    [super layoutSubviews];
    int col = 0;
    NSInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    NSInteger count = self.items.count;
    
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = self.mutableItems[i];
   
        
        col = i%KVCols;
        row = i/KVCols;
        x = col *KVItemWH;
        y = row *KVItemWH;
        btn.frame = CGRectMake(x, y, KVItemWH, KVItemWH);
    }


}

-(void)hide{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -_meumH);

    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

//    [UIView animateWithDuration:2 animations:^{
//        self.transform = CGAffineTransformMakeTranslation(0, -_meumH);
//    }];
//    
//    [self removeFromSuperview];

}

@end
