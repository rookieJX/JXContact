//
//  JXLoginModelTool.h
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXLoginModel;

@interface JXLoginModelTool : NSObject

/**
 *  保存
 */
+ (void)saveLoginModel:(JXLoginModel *)login;

/**
 *  读取
 */
+ (JXLoginModel *)loginModel;

@end
