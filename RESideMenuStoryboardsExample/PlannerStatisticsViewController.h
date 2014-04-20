//
//  PlannerStatisticsViewController.h
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPRequest.h"
#import "XYPieChart.h"

@interface PlannerStatisticsViewController : UIViewController <HTTPRequestDelegate, XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) HTTPRequest *request;
@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray *sliceColors;
@property int maxAttendees;
@property (strong, nonatomic) IBOutlet UILabel *ocupancyLabel;
@property (strong, nonatomic) IBOutlet UIButton *refreshBtn;

- (IBAction)refreshBtnPressed:(id)sender;

@end