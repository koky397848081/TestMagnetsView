//
//  ALMagnetsView.h
//  ALApp
//
//  Created by Tywin on 2017/5/5.
//  Copyright © 2017年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALMagnetsView : UIView

@property (nonatomic, strong) NSObject *obj;
- (instancetype)initWithFrame:(CGRect)frame withIndex:(NSInteger )index;
@end
