//
//  PlannerAssistantViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PlannerAssistantViewController.h"

@interface PlannerAssistantViewController () {
    __strong NSMutableArray *eventArray;
}

@end

@implementation PlannerAssistantViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    eventArray = [@[@"hello", @"world", @"I'm", @"Miguel"] mutableCopy];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
