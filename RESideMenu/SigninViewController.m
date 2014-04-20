//
//  SigninViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "SigninViewController.h"

@interface SigninViewController ()

@end

@implementation SigninViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)buttonWasPressed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([self.textUsername.text isEqual:@"planner"] || [self.textUsername.text isEqual:@"client"]) {
        [defaults setObject:self.textUsername.text forKey:@"role"];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops!"
                                                        message:@"We are in pre-alpha yet, we don't recognize you."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (IBAction)tapWasEnabled:(id)sender {
    [self.textUsername resignFirstResponder];
    [self.textPassword resignFirstResponder];
}

#pragma mark - UITextfieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textUsername) {
        [self.textPassword becomeFirstResponder];
    } else if (self.textPassword == textField) {
        [self buttonWasPressed:self];
    }
    return YES;
}

@end
