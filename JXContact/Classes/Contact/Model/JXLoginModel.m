//
//  JXLoginModel.m
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXLoginModel.h"

static NSString * nameKey = @"nameKey";
static NSString * pwdKey = @"loginPwd";
static NSString * autoKey = @"isAuto";
static NSString * rememberKey = @"isRemember";

@implementation JXLoginModel


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_loginName forKey:nameKey];
    [aCoder encodeObject:_loginPwd forKey:pwdKey];
    [aCoder encodeBool:_isAuto forKey:autoKey];
    [aCoder encodeBool:_isRemember forKey:rememberKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _loginName = [aDecoder decodeObjectForKey:nameKey];
        _loginPwd = [aDecoder decodeObjectForKey:pwdKey];
        _isAuto = [aDecoder decodeBoolForKey:autoKey];
        _isRemember = [aDecoder decodeBoolForKey:rememberKey];
    }
    return self;
}
@end
