//
//  ViewController.h
//  ButtonControl
//
//  Created by Nigel Lee on 16/6/28.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)leftBtnPressed:(id)sender;
- (IBAction)rightBtnPressed:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@end

