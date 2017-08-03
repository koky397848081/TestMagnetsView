//
//  ViewController.m
//  TestMagnetsView
//
//  Created by jingjing on 2017/5/7.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import "ViewController.h"
#import "ALMagnetsView.h"

@interface ViewController ()
{
    __weak IBOutlet UIView *_contentView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.obj = nil;
}

- (void)setObj:(NSObject *)obj
{
    for (NSInteger i = 0; i < 4; i++) {
        [[_contentView viewWithTag:100 +i] removeFromSuperview];
        CGFloat x_p = 0.0f;
        CGFloat y_p = 0.0f;
        if (i<2) {
            x_p = (4*i)+((_contentView.frame.size.width - 4)/2)*i;
            y_p = 0;
        }else{
            x_p = (4*(i-2))+((_contentView.frame.size.width - 4)/2)*(i-2);
            y_p = 4+(_contentView.frame.size.height -4)/2;
        }
        _contentView.frame = CGRectMake(4, 44, self.view.frame.size.width-12, 185);
        ALMagnetsView *magnetsView = [[ALMagnetsView alloc] initWithFrame:CGRectMake(x_p, y_p, (_contentView.frame.size.width - 4)/2, (_contentView.frame.size.height -4)/2) withIndex:i];
        magnetsView.tag = 100 + i;
        magnetsView.clipsToBounds = YES;
        magnetsView.obj = nil;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick:)];
        tap.numberOfTapsRequired = 1;
        [magnetsView addGestureRecognizer:tap];
        [_contentView addSubview:magnetsView];
    }
}

- (void)onClick:(UITapGestureRecognizer *)tap
{
    ALMagnetsView *magnetsView = (ALMagnetsView *)tap.view;

    NSLog(@"Task select index ---->%ld",magnetsView.tag - 100);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
