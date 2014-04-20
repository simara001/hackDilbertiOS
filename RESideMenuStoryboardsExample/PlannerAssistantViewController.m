//
//  PlannerAssistantViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PlannerAssistantViewController.h"
#import "PersonsTableViewCell.h"
#import "UIColor+coolColors.h"
#import <QuartzCore/QuartzCore.h>

@interface PlannerAssistantViewController () {
    __strong NSMutableArray *eventArray;
}

@end

@implementation PlannerAssistantViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    eventArray = [[NSMutableArray alloc] init];
    
    // Init HTTP
    _request = [HTTPRequest new];
    _request.delegate = self;
    
    [_request doGet:@"checkin"];
    
    /* * * * * * * * * * * * * * * * *
     * Format
     * * * * * * * * * * * * * * * * */
    self.view.backgroundColor = [UIColor colorWithRed:246./255. green:246./255. blue:246./255. alpha:1.0];
    self.eventTable.backgroundColor = [UIColor clearColor];
}

#pragma mark - UITableViewDatasource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [eventArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cell";
    PersonsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    /* * * * * * * * * * * * * * * * *
     * Cell Format
     * * * * * * * * * * * * * * * * */
    [cell.personImage.layer setCornerRadius:cell.personImage.frame.size.width/2];
    [cell.personImage.layer setBorderColor:[UIColor coolGray].CGColor];
    [cell.personImage.layer setBorderWidth:2.0];
    
    /* * * * * * * * * * * * * * * * *
     * Image
     * * * * * * * * * * * * * * * * */
    NSString *imageName;
    if (indexPath.row < 10) {
        imageName = [NSString stringWithFormat:@"Contact%d", (int)indexPath.row + 1];
    } else {
        imageName = @"DefautlPerson";
    }
    cell.personImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    
    /* * * * * * * * * * * * * * * * *
     * Cell Info
     * * * * * * * * * * * * * * * * */
    cell.background.backgroundColor = [UIColor whiteColor];
    cell.personFirstName.text = eventArray[indexPath.row][@"first"];
    cell.personLastName.text = eventArray[indexPath.row][@"last"];
    cell.personEmail.text = eventArray[indexPath.row][@"email"];
    return cell;
}

//HTTP Request Protocol Methods
-(void) didReceiveResponse:(NSArray *)serverResponse
{
    [eventArray addObjectsFromArray:serverResponse];
    [self.eventTable reloadData];
    //NSLog(@"%@", serverResponse);
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
