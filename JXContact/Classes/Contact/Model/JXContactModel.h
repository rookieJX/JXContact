//
//  JXContactModel.h
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXContactModel : NSObject<NSCoding>

+ (instancetype)contactWithName:(NSString *)name mobile:(NSString *)mobile;

/** 姓名 */
@property (nonatomic,strong) NSString * name;

/** 联系方式 */
@property (nonatomic,strong) NSString * mobile;

/** 是否是自动登录 */
@property (nonatomic,assign)BOOL isAuto;

/** 是否是记住密码 */
@property (nonatomic,assign)BOOL isRemember;

@end
