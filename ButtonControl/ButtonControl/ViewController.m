//
//  ViewController.m
//  ButtonControl
//
//  Created by Nigel Lee on 16/6/28.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text = @"50";
    self.doSomethingButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nameTextFieldDoneEditing:(UITextField*)sender {
    [sender resignFirstResponder];
}

- (IBAction)numberTextFieldDoneEditing:(UITextField*)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    long progress = lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%ld", progress];
}

- (IBAction)switchChanged:(UISwitch*)sender {
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)toggleControl:(UISegmentedControl*)sender {
    // 0 == switches index
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }
    else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

- (IBAction)doSomethingButtonPressed:(UIButton*)sender {
    // ios 8.3 UIAlertController instead of UIActionSheet
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"Are you sure?"
                                                                             message: nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet
                                          ];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle: @"Yes, I'm sure!"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:nil
                                    ];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"NO Way!"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil
                                   ];
    
    // add button into UIAlertController object
    [alertController addAction: defaultAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController: alertController animated: YES completion: nil];
}
@end
