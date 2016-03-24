//
//  ViewController.m
//  UITextFieldShowcases
//
//  Created by Ryan Lee on 22/3/2016.
//  Copyright © 2016 Ryan Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register keyboard notifications for keyboard show/hide event in viewDidLoad
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Adjust scroll view's content inset when keyboard shows
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

// Reset the scroll view's content inset when keyboard hides
- (void)keyboardWillHide:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

// Dismiss keyboard when touch outside of keyboard
// Need to mark the View's custom class as UIControl
- (IBAction)contentVIewTouchUpInside:(id)sender {
    [((UIView *)sender) endEditing:YES];
}

@end
