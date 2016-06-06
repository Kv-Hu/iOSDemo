//
//  WaterFlowLayout.h
//  iOSDemo
//
//  Created by Kevin on 16/6/6.
//
//

#import <UIKit/UIKit.h>
@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate <NSObject>

// item的高度
- (CGFloat)waterFlowLayout:(WaterFlowLayout *)waterFlowLayout withIndexPath:(NSIndexPath *)indexPath andItemWidth:(CGFloat)width;


@end

@interface WaterFlowLayout : UICollectionViewFlowLayout

//@property (nonatomic, strong) NSArray *imageArray;

@property (nonatomic, weak) id<WaterFlowLayoutDelegate> delegate;

@end
