//
//  JXContactModel.m
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXContactModel.h"

@implementation JXContactModel

static NSString * nameKey = @"name";
static NSString * mobileKey = @"mobile";


+ (instancetype)contactWithName:(NSString *)name mobile:(NSString *)mobile {
    JXContactModel * model = [[self alloc] init];
    
    model.name = name;
    model.mobile = mobile;
    
    return model;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:nameKey];
    [aCoder encodeObject:_mobile forKey:mobileKey];
    
}

// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:nameKey];
        _mobile = [aDecoder decodeObjectForKey:mobileKey];
        
    }
    return self;
}
@end
