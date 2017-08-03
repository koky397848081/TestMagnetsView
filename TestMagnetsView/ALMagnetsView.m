//
//  ALMagnetsView.m
//  ALApp
//
//  Created by Tywin on 2017/5/5.
//  Copyright © 2017年 AiLi. All rights reserved.
//

#import "ALMagnetsView.h"
#import <SDAutoLayout.h>
#import <POP.h>

#define ColorWithRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@implementation ALMagnetsView
{
    UIView *_firstView;
    UIView *_secondView;
    UIImageView *_coverImageView;
    UILabel *_memberLabel1;
    UILabel *_titleLabel1;
    UILabel *_titleLabel2;
    UILabel *_pointLabel2;
    UILabel *_memberLabel2;
    
    NSInteger _index;
}

- (instancetype)initWithFrame:(CGRect)frame withIndex:(NSInteger )index
{
    self = [super initWithFrame:frame];
    if (self) {
        _index = index;
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    [self firstView];
    [self secondView];
    
}

- (void)firstView
{
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _coverImageView  = [[UIImageView alloc] init];
        [_firstView addSubview:_coverImageView];
        _coverImageView.sd_layout.topSpaceToView(_firstView,0).rightSpaceToView(_firstView,0).leftSpaceToView(_firstView,0).bottomSpaceToView(_firstView,0);
        _titleLabel1 = [[UILabel alloc] init];
        _titleLabel1.textColor = [UIColor whiteColor];
        _titleLabel1.textAlignment = NSTextAlignmentCenter;
        [_firstView addSubview:_titleLabel1];
        _titleLabel1.sd_layout.leftSpaceToView(_firstView,5).rightSpaceToView(_firstView,5).centerXIs(_firstView.frame.size.height/2).heightIs(30);
        _memberLabel1 = [[UILabel alloc] init];
        _memberLabel1.textColor = [UIColor whiteColor];
        [_firstView addSubview:_memberLabel1];
        _memberLabel1.sd_layout.leftSpaceToView(_firstView,10).bottomSpaceToView(_firstView,5).rightSpaceToView(_firstView,5).heightIs(20);
        [self addSubview:_firstView];
    }
}

- (void)secondView
{
    if (!_secondView) {
        _secondView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
        _titleLabel2 = [[UILabel alloc] init];
        _titleLabel2.textColor = [UIColor whiteColor];
        _titleLabel2.textAlignment = NSTextAlignmentCenter;
        [_secondView addSubview:_titleLabel2];
        _titleLabel2.sd_layout.topSpaceToView(_secondView,10).leftSpaceToView(_secondView,0).rightSpaceToView(_secondView,0).heightIs(30);
        _pointLabel2 = [[UILabel alloc] init];
        _pointLabel2.textColor = [UIColor whiteColor];
        _pointLabel2.textAlignment = NSTextAlignmentCenter;
        [_secondView addSubview:_pointLabel2];
        _pointLabel2.sd_layout.topSpaceToView(_titleLabel2,5).leftSpaceToView(_secondView,0).rightSpaceToView(_secondView,0).heightIs(20);
        _memberLabel2 = [[UILabel alloc] init];
        _memberLabel2.textColor = [UIColor whiteColor];
        [_secondView addSubview:_memberLabel2];
        _memberLabel2.sd_layout.leftSpaceToView(_secondView,10).bottomSpaceToView(_secondView,5).rightSpaceToView(_secondView,5).heightIs(20);
        [self addSubview:_secondView];
        switch (_index) {
            case 0:
            {
                _secondView.backgroundColor = ColorWithRGB(255, 156, 63);
            }
                break;
            case 1:
            {
                _secondView.backgroundColor = ColorWithRGB(254, 129, 122);
            }
                break;
            case 2:
            {
                _secondView.backgroundColor = ColorWithRGB(4, 208, 186);
            }
                break;
            case 3:
            {
                _secondView.backgroundColor = ColorWithRGB(88, 183, 225);
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)setObj:(NSObject *)obj
{
    [_coverImageView setImage:[UIImage imageNamed:@"img"]];
    
    _titleLabel1.text = @"测试标题";
    _memberLabel1.text = @"12人参与";
    _titleLabel2.text = @"测试标题";
    _pointLabel2.text = @"10积分";
    _memberLabel2.text = @"12人参与*1个月后结束";
    [self performSelector:@selector(firstAnimation) withObject:nil afterDelay:_index*5+((arc4random() % 5) + 3)];
}

- (void)firstAnimation
{
    POPBasicAnimation* basicAnimation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basicAnimation1.toValue = @(-self.frame.size.height/2);
    basicAnimation1.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    basicAnimation1.duration = 0.5f;
    basicAnimation1.completionBlock = ^(POPAnimation *anim, BOOL finished){
        if (finished) {
            _firstView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
            [_firstView pop_removeAllAnimations];
        }
    };
    [_firstView.layer pop_addAnimation:basicAnimation1 forKey:@"frameChange1"];
    
    POPBasicAnimation* basicAnimation2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basicAnimation2.toValue = @(self.frame.size.height/2);
    basicAnimation2.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    basicAnimation2.duration = 0.5f;
    basicAnimation2.completionBlock = ^(POPAnimation *anim, BOOL finished){
        if (finished) {
            _secondView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            [self performSelector:@selector(secondAnimatin) withObject:nil afterDelay:(arc4random() % 5) + 3];
            [_secondView pop_removeAllAnimations];
        }
    };
    [_secondView.layer pop_addAnimation:basicAnimation2 forKey:@"frameChange2"];
}

- (void)secondAnimatin
{
    POPBasicAnimation* basicAnimation3 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basicAnimation3.toValue = @(self.frame.size.height/2);
    basicAnimation3.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    basicAnimation3.duration = 0.5f;
    basicAnimation3.completionBlock = ^(POPAnimation *anim, BOOL finished){
        if (finished) {
            _firstView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            [_firstView pop_removeAllAnimations];
        }
    };
    [_firstView.layer pop_addAnimation:basicAnimation3 forKey:@"frameChange3"];
    
    POPBasicAnimation* basicAnimation4 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    basicAnimation4.toValue = @(-self.frame.size.height/2);
    basicAnimation4.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    basicAnimation4.duration = 0.5f;
    basicAnimation4.completionBlock = ^(POPAnimation *anim, BOOL finished){
        if (finished) {
            _secondView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
            [self performSelector:@selector(firstAnimation) withObject:nil afterDelay: (arc4random() % 5) + 3];
            [_secondView pop_removeAllAnimations];
        }
    };
    [_secondView.layer pop_addAnimation:basicAnimation4 forKey:@"frameChange4"];
}
@end
