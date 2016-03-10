//
//  ViewController.m
//  TestScrollView
//
//  Created by Ryan Lee on 3/3/2016.
//  Copyright © 2016 Ryan Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIView *overlayView;

@property (assign, nonatomic) float initialOverlayY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.headerView.frame = CGRectOffset(self.headerView.frame, 0, -1 * CGRectGetHeight(self.headerView.frame));
    [self.scrollView addSubview:self.headerView];
    UIEdgeInsets inset = self.scrollView.contentInset;
    inset.top += CGRectGetHeight(self.headerView.frame);
    self.scrollView.contentInset = inset;
    
    
    self.headerView.frame = CGRectOffset(self.headerView.frame, 0, -1 * CGRectGetHeight(self.overlayView.frame));
    self.overlayView.frame = CGRectOffset(self.overlayView.frame, 0, -1 * CGRectGetHeight(self.overlayView.frame));
    [self.scrollView addSubview:self.overlayView];
    
    inset = self.scrollView.contentInset;
    inset.top += CGRectGetHeight(self.overlayView.frame);
    self.scrollView.contentInset = inset;
    
    self.initialOverlayY = self.overlayView.frame.origin.y;
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = self.overlayView.frame;
    float minHeight = 40;
    if (scrollView.contentOffset.y + minHeight <= self.initialOverlayY) {
        frame.origin.y = self.initialOverlayY;
    } else {
        frame.origin.y = scrollView.contentOffset.y + minHeight;
    }
    self.overlayView.frame = frame;
}

@end
