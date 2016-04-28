//
//  JXMainController.m
//  JXContact
//
//  Created by 王加祥 on 16/4/26.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXMainController.h"
#import "JXContactController.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import "JXLoginModel.h"
#import "JXLoginModelTool.h"

@interface JXMainController ()<UITextFieldDelegate>

/** 账户名输入框 */
@property (nonatomic,strong) UITextField * nameTextField;

/** 密码输入框 */
@property (nonatomic,strong) UITextField * pwdTextField;

/** 是否记住密码 */
@property (nonatomic,strong) UISwitch * isRemeber;

/** 是否自动登录 */
@property (nonatomic,strong) UISwitch * isAuto;

/** 是否记住按钮背景 */
@property (nonatomic,strong) UIView * remeberView;

/** 是否自动登录背景 */
@property (nonatomic,strong) UIView * autoView;

/** 登录按钮 */
@property (nonatomic,strong) UIButton * loginBtn;
@end

@implementation JXMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"欢迎进入我的联系";
    
    // 创建登陆界面
    [self setupContact];
    
    // 创建是否记住密码界面
    [self setupRemember];
    
    // 创建是否自动登陆界面
    [self setupAuto];
    
    // 创建点击按钮
    [self setupLogin];
    
    // 点击登陆
    [self createLogic];
    
    // 主动调用
    [self textChanged];
    
    
    // 自动登录
    JXLoginModel * loginModel = [JXLoginModelTool loginModel];
    if (loginModel.isAuto == YES) {
        [self login:nil];
    } else if (loginModel.isRemember == YES) {
        self.pwdTextField.text = loginModel.loginPwd;
    }

}


/**
 *  创建登录界面
 */
- (void)setupContact {
    
    // 创建
    UILabel * nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"用户名:";
    [self.view addSubview:nameLabel];
    
    // 添加约束
    [nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(30);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(100);
        make.width.mas_equalTo(60);
    }];
    
    // 添加用户输入框约束
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLabel.mas_right);
        make.centerY.mas_equalTo(nameLabel.mas_centerY);
        make.right.mas_equalTo(self.view.mas_right).mas_equalTo(-20);
    }];
    
    
    // 创建密码
    UILabel * pwdLabel = [[UILabel alloc] init];
    pwdLabel.text = @"密码:";
    [self.view addSubview:pwdLabel];
    
    // 创建密码约束
    [pwdLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLabel.mas_left);
        make.top.mas_equalTo(nameLabel.mas_bottom).mas_offset(30);
        make.width.mas_equalTo(nameLabel.mas_width);
    }];
    
    
    [self.view addSubview:self.pwdTextField];
    [self.pwdTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameTextField.mas_left);
        make.right.mas_equalTo(self.nameTextField.mas_right);
        make.centerY.mas_equalTo(pwdLabel.mas_centerY);
    }];
}

/**
 *   创建记住密码
 */
- (void)setupRemember {
    // 添加背景按钮
    [self.view addSubview:self.remeberView];
    // 添加背景按钮约束
    [self.remeberView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(30);
        make.width.mas_equalTo(110);
        make.top.mas_equalTo(self.pwdTextField.mas_bottom).mas_offset(40);
    }];
    
    // 背景图片添加控件
    UILabel * remeber = [[UILabel alloc] init];
    remeber.text = @"记住密码";
    remeber.font = [UIFont systemFontOfSize:15];
    [self.remeberView addSubview:remeber];
    [remeber mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.remeberView);
        make.top.mas_equalTo(self.remeberView);
        make.bottom.mas_equalTo(self.remeberView);
        make.width.mas_equalTo(60);
    }];
    
    [self.remeberView addSubview:self.isRemeber];
    [self.isRemeber mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(remeber.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(remeber.mas_centerY);
    }];
}


/**
 *   创建自动登录
 */
- (void)setupAuto {
    // 添加背景按钮
    [self.view addSubview:self.autoView];
    // 添加背景按钮约束
    [self.autoView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-30);
        make.width.mas_equalTo(self.remeberView.mas_width);
        make.top.mas_equalTo(self.remeberView.mas_top);
    }];
    
    // 背景图片添加控件
    UILabel * autoLogin = [[UILabel alloc] init];
    autoLogin.text = @"自动登录";
    autoLogin.font = [UIFont systemFontOfSize:15];
    [self.autoView addSubview:autoLogin];
    [autoLogin mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.autoView);
        make.top.mas_equalTo(self.autoView);
        make.bottom.mas_equalTo(self.autoView);
        make.width.mas_equalTo(60);
    }];
    
    [self.autoView addSubview:self.isAuto];
    [self.isAuto mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(autoLogin.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(autoLogin.mas_centerY);
    }];
}


- (void)setupLogin {
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.remeberView.mas_bottom).mas_offset(50);
        make.width.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}

- (void)createLogic {
    [self.nameTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.isRemeber addTarget:self action:@selector(rememberChanged) forControlEvents:UIControlEventValueChanged];
    [self.isAuto addTarget:self action:@selector(autoChanged) forControlEvents:UIControlEventValueChanged];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 监听事件
- (void)textChanged {
    self.loginBtn.enabled = self.nameTextField.text.length && self.pwdTextField.text.length;
}

- (void)rememberChanged {
    if (self.isRemeber.on == NO) {
        [self.isAuto setOn:NO animated:YES];
    }
}

- (void)autoChanged {
    if (self.isAuto.on == YES) {
        [self.isRemeber setOn:YES animated:YES];
    }
}

- (void)login:(UIButton *)loginBtn {
    if ([self.nameTextField.text isEqualToString:@"jxmbp"] && [self.pwdTextField.text isEqualToString:@"123456"]) {
        
        // 保存登录信息
        JXLoginModel * model = [[JXLoginModel alloc] init];
        model.isAuto = self.isAuto.on;
        model.isRemember = self.isRemeber.on;
        model.loginName = self.nameTextField.text;
        model.loginPwd = self.pwdTextField.text;
        [JXLoginModelTool saveLoginModel:model];
        
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"登陆中...";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
            JXContactController * contact = [[JXContactController alloc] init];
            contact.navigationItem.title = self.nameTextField.text;
            [self.navigationController pushViewController:contact animated:YES];
        });
        
    } else {
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"用户名或者密码错误";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.hidden = YES;
        });
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];

    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue");
}
#pragma mark - 懒加载
- (UITextField *)nameTextField {
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.delegate = self;
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.placeholder = @"请输入用户名";
        _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _nameTextField;
}

- (UITextField *)pwdTextField {
    if (_pwdTextField == nil) {
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.delegate = self;
        _pwdTextField.borderStyle = UITextBorderStyleRoundedRect;
        _pwdTextField.placeholder = @"请输入密码";
        _pwdTextField.secureTextEntry = YES;
        _pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _pwdTextField;
}

- (UIView *)remeberView {
    if (_remeberView == nil) {
        _remeberView = [[UIView alloc] init];
    }
    return _remeberView;
}

- (UIView *)autoView {
    if (_autoView == nil) {
        _autoView = [[UIView alloc] init];
    }
    return _autoView;
}

- (UISwitch *)isRemeber {
    if (_isRemeber == nil) {
        _isRemeber = [[UISwitch alloc] init];
    }
    return _isRemeber;
}

- (UISwitch *)isAuto {
    if (_isAuto == nil) {
        _isAuto = [[UISwitch alloc] init];
    }
    return _isAuto;
}

- (UIButton *)loginBtn {
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}
@end
