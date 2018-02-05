//
//  HeaderView.h
//  sectionDemo
//
//  Created by 裴文芹 on 2017/10/12.
//  Copyright © 2017年 cnwanweb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

@property (copy, nonatomic) void(^selectSectionBlock)(void);

- (void)updateViewWithTitle:(NSString *)title showSection:(BOOL)show;

@end
