//
//  JXLoginModelTool.m
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXLoginModelTool.h"
#import "JXLoginModel.h"
#define PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"login.archive"]
@implementation JXLoginModelTool

+ (void)saveLoginModel:(JXLoginModel *)login {
    [NSKeyedArchiver archiveRootObject:login toFile:PATH];
    NSLog(@"%@",PATH);
}

+ (JXLoginModel *)loginModel {
    JXLoginModel * model = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
    return model;
}

@end
