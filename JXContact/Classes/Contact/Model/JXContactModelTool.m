//
//  JXContactModelTool.m
//  JXContact
//
//  Created by yuezuo on 16/4/28.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXContactModelTool.h"
#import "JXContactModel.h"

#define PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contact.archive"]

@implementation JXContactModelTool

+ (void)saveContactModel:(JXContactModel *)contact {
    [NSKeyedArchiver archiveRootObject:contact toFile:PATH];
}

+ (JXContactModel *)ContactModel {
    JXContactModel * contact = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH];
    return contact;
}
@end
