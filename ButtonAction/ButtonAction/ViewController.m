//
//  ViewController.m
//  ButtonAction
//
//  Created by Nigel Lee on 16/6/27.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    self.statusLabel.font = [UIFont systemFontOfSize:17];
//    self.statusLabel.adjustsFontSizeToFitWidth = YES;
    CGSize maximumLabelSize = CGSizeMake(100, 9999);
    CGSize expectSize = [self.statusLabel sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
//    self.statusLabel.frame = CGRectMake(20, 70, expectSize.width, expectSize.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
//    self.statusLabel.text = plainText;
    self.statusLabel.text = @"cedsfjl";
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)rightbuttonPressed:(id)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    
}

@end
