//
//  DEMOFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "SigninViewController.h"

@interface DEMOFirstViewController ()

@end

@implementation DEMOFirstViewController

-(void)viewDidLoad {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"role"] isEqualToString:@""]) {
        SigninViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController presentViewController:controller animated:NO completion:nil];
    }

}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
