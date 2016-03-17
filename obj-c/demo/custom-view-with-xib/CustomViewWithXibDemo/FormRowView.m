//
//  FormRowView.m
//  CustomViewWithXibDemo
//
//  Created by Ryan Lee on 17/3/2016.
//  Copyright © 2016 Ryan Lee. All rights reserved.
//

#import "FormRowView.h"

@interface FormRowView ()

@end

@implementation FormRowView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UIView *view = [[[NSBundle bundleForClass:[self class]]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        view.frame = self.bounds;
        [self addSubview:view];
    }
    return self;
}

- (void)prepareForInterfaceBuilder
{
    UIView *view = [[[NSBundle bundleForClass:[self class]]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    view.frame = self.bounds;
    [self addSubview:view];
}

@end
