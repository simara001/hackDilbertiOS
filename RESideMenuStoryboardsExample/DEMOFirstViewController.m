//
//  DEMOFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "SigninViewController.h"

@interface DEMOFirstViewController () {
    __strong NSMutableArray *eventArray;
}

@end

@implementation DEMOFirstViewController

-(void)viewDidLoad {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"role"] isEqualToString:@""]) {
        SigninViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"signin"];
        [self.navigationController presentViewController:controller animated:NO completion:nil];
    }
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
    
    // Configure the cell...
    cell.textLabel.text = eventArray[indexPath.row];
    return cell;
}


@end
