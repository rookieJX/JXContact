//
//  JXLoginModel.h
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXLoginModel : NSObject<NSCoding>
/** 登录名 */
@property (nonatomic,strong) NSString * loginName;

/** 登录密码 */
@property (nonatomic,strong) NSString * loginPwd;

/** 是否是自动登录 */
@property (nonatomic,assign)BOOL isAuto;

/** 是否是记住密码 */
@property (nonatomic,assign)BOOL isRemember;

@end
