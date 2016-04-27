//
//  JXContactModel.h
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXContactModel : NSObject

+ (instancetype)contactWithName:(NSString *)name mobile:(NSString *)mobile;

/** 姓名 */
@property (nonatomic,strong) NSString * name;

/** 联系方式 */
@property (nonatomic,strong) NSString * mobile;
@end
