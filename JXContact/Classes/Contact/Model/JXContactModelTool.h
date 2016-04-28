//
//  JXContactModelTool.h
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXContactModel;

@interface JXContactModelTool : NSObject

/**
 *  保存
 */
+ (void)saveContactModel:(JXContactModel *)contact;

/**
 *  读取
 */
+ (JXContactModel *)ContactModel;


@end
