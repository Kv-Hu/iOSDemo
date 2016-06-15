//
//  KVAddViewController.h
//  contacts
//
//  Created by Kevin on 16/6/15.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVAddViewController,KVContact;
@protocol KVAddViewControllerDelegate <NSObject>

@optional

- (void)addViewController:(KVAddViewController *)addVc didClickAddBtnWithContact:

        (KVContact *)contact;

@end

@class KVContactViewController;

@interface KVAddViewController : UIViewController

@property (nonatomic, weak) id <KVAddViewControllerDelegate> delegate;



@end
