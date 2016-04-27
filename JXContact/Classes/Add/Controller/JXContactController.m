//
//  JXContactController.m
//  JXContact
//
//  Created by 王加祥 on 16/4/26.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXContactController.h"
#import "JXAddViewController.h"
#import "JXContactModel.h"
#import "JXEditController.h"
@interface JXContactController ()<JXAddViewControllerDelegate>

/** 模型列表 */
@property (nonatomic,strong) NSMutableArray * contacts;


@end

@implementation JXContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 返回按钮
    [self backItem];
    
    // 设置导航栏
    [self setupNavigitiaonItem];
}

#pragma mark - 返回按钮
- (void)backItem {
    UIBarButtonItem * item = [[UIBarButtonItem alloc] init];
    item.title = @"Back";
    self.navigationItem.backBarButtonItem = item;
}

- (void)setupNavigitiaonItem {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 这句代码的意思就是当tableView某行有数据的时候我们就展示数据
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addContact)];
    
}
#pragma mark - 导航栏按钮监听
#pragma mark 注销事件
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

#pragma mark 添加事件
- (void)addContact {
    JXAddViewController * add = [[JXAddViewController alloc] init];
    add.delegate = self;
    [self.navigationController pushViewController:add animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    JXContactModel * model = self.contacts[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",model.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.mobile];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JXContactModel * model = self.contacts[indexPath.row];
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"JXDetails" bundle:[NSBundle mainBundle]];
    JXEditController * edit = [story instantiateViewControllerWithIdentifier:@"detail"];
    edit.contact = model;
    edit.block = ^(){
        [self.tableView reloadData];
    };
    [self.navigationController pushViewController:edit animated:YES];
}

#pragma mark - JXAddViewControllerDelegate
- (void)addViewController:(JXAddViewController *)addVC addBtnClicked:(JXContactModel *)contact {
    [self.contacts addObject:contact];
    [self.tableView reloadData];
}


#pragma mark - 懒加载
- (NSMutableArray *)contacts {
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}
@end
