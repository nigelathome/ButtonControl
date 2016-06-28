//
//  ViewController.h
//  ButtonAction
//
//  Created by Nigel Lee on 16/6/27.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)rightbuttonPressed:(id)sender;
- (IBAction)buttonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

