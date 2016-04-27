//
//  JXEditController.m
//  JXContact
//
//  Created by 王加祥 on 16/4/27.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXEditController.h"
#import "JXContactModel.h"

@interface JXEditController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation JXEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
    
    [self setuupInit];
}

- (void)setuupInit {
    
    self.nameTextField.text = self.contact.name;
    self.mobileTextField.text = self.contact.mobile;
    self.nameTextField.delegate = self;
    self.mobileTextField.delegate = self;
    [self.nameTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    [self.mobileTextField addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    self.nameTextField.enabled = NO;
    self.mobileTextField.enabled = NO;
    
    [self textChanged];
}

#pragma mark - 监听事件
/**
 *  导航栏编辑按钮监听事件
 */
- (void)edit:(UIBarButtonItem *)item {
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"取消";
        self.saveBtn.hidden = NO;
        self.nameTextField.enabled = YES;
        self.mobileTextField.enabled = YES;
        [self.mobileTextField becomeFirstResponder];
    } else {
        item.title = @"编辑";
        self.saveBtn.hidden = YES;
        self.nameTextField.enabled = NO;
        self.mobileTextField.enabled = NO;
        self.nameTextField.text = self.contact.name;
        self.mobileTextField.text = self.contact.mobile;
    }
}

- (void)textChanged {
    self.saveBtn.enabled = self.nameTextField.text.length && self.mobileTextField.text.length;
}
- (IBAction)saveBtnClick:(UIButton *)sender {
    self.contact.name = self.nameTextField.text;
    self.contact.mobile = self.mobileTextField.text;
    if (self.block) {
        self.block();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - UITextFieldDelegate 
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}
@end
