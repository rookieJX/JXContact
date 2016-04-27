//
//  JXContactModel.m
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXContactModel.h"

@implementation JXContactModel

+ (instancetype)contactWithName:(NSString *)name mobile:(NSString *)mobile {
    JXContactModel * model = [[self alloc] init];
    
    model.name = name;
    model.mobile = mobile;
    
    return model;
}
@end
