//
//  ViewController.m
//  电影评论输入框
//
//  Created by  jason on 16/1/21.
//  Copyright © 2016年 renlairenwang. All rights reserved.
//

#import "ViewController.h"
#import "YJCommentInputView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YJCommentInputView *commentView = [[YJCommentInputView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 100)];
    
    commentView.yj_placeholder = @"这只是一个测试而已哦";
    commentView.yj_placeholderColer = [UIColor greenColor];
    
    commentView.delegate = self;
    
    commentView.backgroundColor = [UIColor redColor];
    
    
    [self.view addSubview:commentView];
    
    
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    // 限制输入长度
    NSMutableString *str = [[NSMutableString alloc] initWithString:textView.text];
    
    [str insertString:text atIndex:range.location];
    
    if (str.length<5) {
        
        NSLog(@"不能少个5个");
        
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
