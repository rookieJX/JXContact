//
//  JXContactController.m
//  JXContact
//
//  Created by 王加祥 on 16/4/26.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXContactController.h"

@interface JXContactController ()

@end

@implementation JXContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 这句代码的意思就是当tableView某行有数据的时候我们就展示数据
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
}

#pragma mark - 注销按钮
- (void)cancel {
    UIAlertController * alertControl = [UIAlertController alertControllerWithTitle:@"注销" message:@"是否要注销" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * actionOk = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    UIAlertAction * actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertControl addAction:actionOk];
    [alertControl addAction:actionCancel];
    [self presentViewController:alertControl animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"textLabel-%zd",indexPath.section];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"detailTextLabel-%zd",indexPath.row];
    return cell;
}


@end
