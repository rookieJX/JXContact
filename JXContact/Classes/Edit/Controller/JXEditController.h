//
//  JXEditController.h
//  JXContact
//
//  Created by 王加祥 on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXContactModel;

typedef void(^JXEditControllerBlock)();

@interface JXEditController : UIViewController
/** 模型 */
@property (nonatomic,strong) JXContactModel * contact;

/** block */
@property (nonatomic,strong) JXEditControllerBlock block;

@end
