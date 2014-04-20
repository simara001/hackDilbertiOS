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
#import "EventTableViewCell.h"
#import "PlannerAssistantViewController.h"
#import "PlannerStatisticsViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    self.view.backgroundColor = [UIColor colorWithRed:240/255. green:240./255. blue:240./255. alpha:1.0];
    self.eventFeeder.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor coolPurple]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    self.eventFeeder.separatorColor = [UIColor clearColor];
    
    /* * * * * * * * * * * * * * * * *
     * Data For the UITableView
     * * * * * * * * * * * * * * * * */
    eventArray = [@[@"hello", @"this", @"is", @"hello", @"this", @"is", @"hello", @"this", @"is"] mutableCopy];

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
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /* * * * * * * * * * * * * * * * *
     * Border Radius
     * * * * * * * * * * * * * * * * */
    cell.backgroundColor = [UIColor clearColor];
    cell.background.backgroundColor = [UIColor whiteColor];
    [cell.background.layer setBorderColor:[UIColor coolGray].CGColor];
    [cell.background.layer setBorderWidth:1.0];
    [cell.eventLogo.layer setCornerRadius:cell.eventLogo.frame.size.width/2];
    [cell.eventLogo.layer setBorderWidth:3.0];
    [cell.eventLogo.layer setBorderColor:[UIColor coolGray].CGColor];
    
    /* * * * * * * * * * * * * * * * *
     * Cell Info
     * * * * * * * * * * * * * * * * */
    NSString *imageTitle = [NSString stringWithFormat:@"Concert%d", (int)indexPath.row];
    cell.eventLogo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageTitle]];
    cell.eventName.text = @"Aerosmith";
    cell.eventCapacity.text = @"40K";
    
    /* * * * * * * * * * * * * * * * *
     * Cell's Buttons Actions
     * * * * * * * * * * * * * * * * */

    [cell.eventStatistics addTarget:self action:@selector(presentView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.eventAllThePeople addTarget:self action:@selector(presentView:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)presentView: (UIButton *)button {
    if (button.tag == 0) {
        PlannerAssistantViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"persons"];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        PlannerStatisticsViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"statistics"];
        [self.navigationController pushViewController:controller animated:YES];
    }

}


@end
