//
//  YJCommentInputView.m
//  电影评论输入框
//
//  Created by  jason on 16/1/21.
//  Copyright © 2016年 renlairenwang. All rights reserved.
//

#import "YJCommentInputView.h"

@implementation YJCommentInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 注册通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:nil];
        
        self.tintColor = [UIColor greenColor];
    }
    return self;
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textChange:(NSNotification*)notice{

    
    NSLog(@"%@",notice.object);
    
    [self setNeedsDisplay];
}

- (void)setYj_placeholder:(NSString *)yj_placeholder {

    _yj_placeholder = yj_placeholder;
    
    [self setNeedsDisplay];
}

- (void)setYj_placeholderColer:(UIColor *)yj_placeholderColer {

    _yj_placeholderColer = yj_placeholderColer;
    
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {

    [super setFont:font];
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {

    if (self.hasText) {
        
        return;
    }
    

    NSLog(@"%@",NSStringFromCGRect(rect));
    
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.yj_placeholderColer?self.yj_placeholderColer:[UIColor grayColor];
    
    CGFloat x = 5;
    CGFloat w = rect.size.width - 2*x;
    CGFloat y = 8;
    CGFloat h = rect.size.height - 2*y;
    
    [self.yj_placeholder drawInRect:CGRectMake(x, y, w, h) withAttributes:attrs];
    
    
    
    
    
}

@end
