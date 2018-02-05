//
//  HeaderView.m
//  sectionDemo
//
//  Created by 裴文芹 on 2017/10/12.
//  Copyright © 2017年 cnwanweb. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImgV;

@end

@implementation HeaderView


- (void)updateViewWithTitle:(NSString *)title showSection:(BOOL)show
{
    self.titleLab.text = title;
    if (show) {
        [UIView animateWithDuration:1.0f animations:^{
            self.arrowImgV.transform = CGAffineTransformMakeRotation(M_PI/2);
        }];
    } else {
        [UIView animateWithDuration:1.0f animations:^{
            self.arrowImgV.transform = CGAffineTransformMakeRotation(0);
        }];
    }
}

- (IBAction)buttonAction:(UIButton *)sender {
   
    
    if (self.selectSectionBlock) {
        self.selectSectionBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
