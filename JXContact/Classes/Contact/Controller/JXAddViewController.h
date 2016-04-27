//
//  JXAddViewController.h
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXAddViewController,JXContactModel;

@protocol JXAddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(JXAddViewController *)addVC addBtnClicked:(JXContactModel *)contact;

@end

@interface JXAddViewController : UIViewController

@property (nonatomic,weak) id<JXAddViewControllerDelegate> delegate;

@end
