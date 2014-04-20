//
//  DEMOFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "SigninViewController.h"
#import "UIColor+coolColors.h"

@interface DEMOFirstViewController () {
    __strong NSMutableArray *eventArray;
}

@end

@implementation DEMOFirstViewController

-(void)viewDidLoad {
    /* * * * * * * * * * * * * * * * *
     * Validating User
     * * * * * * * * * * * * * * * * */
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"role"] isEqualToString:@""]) {
        SigninViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController presentViewController:controller animated:NO completion:nil];
    }
    
    /* * * * * * * * * * * * * * * * *
     * UIView Customization
     * * * * * * * * * * * * * * * * */
    self.view.backgroundColor = [UIColor coolLightGray];
    self.eventFeeder.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor coolPurple]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    /* * * * * * * * * * * * * * * * *
     * Data For the UITableView
     * * * * * * * * * * * * * * * * */
    eventArray = [@[@"hello", @"this", @"is"] mutableCopy];

}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [eventArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.backgroundColor = [UIColor clearColor];
    // Configure the cell...
    cell.textLabel.text = eventArray[indexPath.row];
    return cell;
}


@end
