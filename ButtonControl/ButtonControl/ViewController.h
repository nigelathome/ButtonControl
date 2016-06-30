//
//  ViewController.h
//  ButtonControl
//
//  Created by Nigel Lee on 16/6/28.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)nameTextFieldDoneEditing:(UITextField*)sender;
- (IBAction)numberTextFieldDoneEditing:(UITextField*)sender;
- (IBAction)sliderChanged:(UISlider*)sender;
- (IBAction)switchChanged:(UISwitch*)sender;
- (IBAction)toggleControl:(UISegmentedControl*)sender;
- (IBAction)doSomethingButtonPressed:(UIButton*)sender;
- (IBAction)backgroundTap:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch*leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch*rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;
@end

