//
//  JXAddViewController.m
//  JXContact
//
//  Created by yuezuo on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXAddViewController.h"
#import "JXContactModel.h"
#import "Masonry.h"

@interface JXAddViewController ()<UITextFieldDelegate>

/** 模型属性 */
@property (nonatomic,strong) JXContactModel * contact;

/** 姓名 */
@property (nonatomic,strong) UITextField * nameTextField;

/** 电话 */
@property (nonatomic,strong) UITextField * mobileTextField;

/** 添加 */
@property (nonatomic,strong) UIButton * addBtn;

@end

@implementation JXAddViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.nameTextField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加姓名
    [self setupName];
    
    // 添加联系方式
    [self setupContact];
    
    // 添加按钮
    [self setupAdd];
    
    // 添加监听事件
    [self addAction];
    
    
}


#pragma mark - 监听事件
/**
 *  监听输入框值得变化
 */
- (void)addAction {
    [self.nameTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.mobileTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)textChanged {
    self.addBtn.enabled = self.nameTextField.text.length && self.mobileTextField.text.length;
}

/**
 *   添加按钮点击
 */
- (void)addBtnClick {
    JXContactModel * model = [JXContactModel contactWithName:self.nameTextField.text mobile:self.mobileTextField.text];
    if ([self.delegate respondsToSelector:@selector(addViewController:addBtnClicked:)]) {
        [self.delegate addViewController:self addBtnClicked:model];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 创建界面
/**
 *  创建界面的名字
 */
- (void)setupName {
    // 姓名
    UILabel * nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"姓名:";
    [self.view addSubview:nameLabel];
    
    // 姓名约束
    [nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.view.mas_top).mas_equalTo(100);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    // 姓名输入框
    [self.view addSubview:self.nameTextField];
    
    // 姓名输入框约束
    [self.nameTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLabel.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.view).mas_offset(-20);
        make.centerY.mas_equalTo(nameLabel.mas_centerY);
    }];
}

/**
 *  创建界面的联系方式
 */
- (void)setupContact {
    // 联系方式
    UILabel * contactLabel = [[UILabel alloc] init];
    contactLabel.text = @"联系方式:";
    [self.view addSubview:contactLabel];
    
    // 联系方式约束
    [contactLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.nameTextField.mas_bottom).mas_offset(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    // 联系方式输入框
    [self.view addSubview:self.mobileTextField];
    
    // 联系方式输入框约束
    [self.mobileTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameTextField.mas_left);
        make.width.mas_equalTo(self.nameTextField.mas_width);
        make.centerY.mas_equalTo(contactLabel.mas_centerY);
    }];
}

/**
 *  创建添加按钮
 */
- (void)setupAdd {
    [self.view addSubview:self.addBtn];
    
    [self.addBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.mobileTextField.mas_bottom).mas_offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}
#pragma mark - 懒加载
- (UITextField *)nameTextField {
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.placeholder = @"添加联系人姓名";
        _nameTextField.delegate = self;
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _nameTextField;
}

- (UITextField *)mobileTextField {
    if (_mobileTextField == nil) {
        _mobileTextField = [[UITextField alloc] init];
        _mobileTextField.placeholder = @"添加联系人电话";
        _mobileTextField.delegate = self;
        _mobileTextField.borderStyle = UITextBorderStyleRoundedRect;
        _mobileTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _mobileTextField;
}

- (UIButton *)addBtn {
    if (_addBtn == nil) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setTitle:@"添加" forState:UIControlStateNormal];
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _addBtn.enabled = NO;
    }
    return _addBtn;
}

@end
