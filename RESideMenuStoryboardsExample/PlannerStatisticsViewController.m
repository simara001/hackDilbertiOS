//
//  PlannerStatisticsViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PlannerStatisticsViewController.h"

@interface PlannerStatisticsViewController ()

@end

@implementation PlannerStatisticsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _maxAttendees = 100;
    
    self.slices = [NSMutableArray arrayWithCapacity:2];
    [_slices addObject:[NSNumber numberWithInt:0]];
    [_slices addObject:[NSNumber numberWithInt:100]];
    
    [self.pieChartLeft setDataSource:self];
    [self.pieChartLeft setStartPieAngle:M_PI_2];
    [self.pieChartLeft setAnimationSpeed:1.0];
    [self.pieChartLeft setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.pieChartLeft setLabelRadius:0];
    [self.pieChartLeft setShowPercentage:YES];
    [self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartLeft setUserInteractionEnabled:NO];
    [self.pieChartLeft setLabelShadowColor:[UIColor blackColor]];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:133/255.0f green:34/255.0f blue:251/255.0f alpha:1.0f],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
    // Init HTTP
    _request = [HTTPRequest new];
    _request.delegate = self;
    
    [_request doGet:@"checkin/attendees"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//HTTP Request Protocol Methods
-(void) didReceiveResponse:(NSDictionary *)serverResponse
{
    int attendees = [[serverResponse objectForKey:@"attendees"] intValue];
    [self refreshPieChart:attendees];
}

-(void) refreshPieChart:(int) attendees{
    int ocupancy = (attendees * 100) / _maxAttendees;
    int vacancy = 100 - ocupancy;
    _ocupancyLabel.text = [NSString stringWithFormat:@"%d%%", ocupancy];
    [self.slices setObject:[NSNumber numberWithInt:ocupancy] atIndexedSubscript:0];
    [self.slices setObject:[NSNumber numberWithInt:vacancy] atIndexedSubscript:1];
    [self.pieChartLeft reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pieChartLeft reloadData];
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

- (IBAction)refreshBtnPressed:(id)sender {
    [_request doGet:@"checkin/attendees"];
}

@end
