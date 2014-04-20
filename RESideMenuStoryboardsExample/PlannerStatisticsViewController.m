//
//  PlannerStatisticsViewController.m
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "PlannerStatisticsViewController.h"
#import "UIColor+coolColors.h"

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
    _maxAttendees = 2000;
    _attendees = 0;
    
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
                       [UIColor coolPurple],
                       [UIColor coolGreen],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
    // Init HTTP
    _request = [HTTPRequest new];
    _request.delegate = self;
    
    
    
    
    // Create a dispatch source that'll act as a timer on the concurrent queue
    // You'll need to store this somewhere so you can suspend and remove it later on
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(triggerRequest) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void) triggerRequest{
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
    if(_attendees < _maxAttendees){
        _attendees = [[serverResponse objectForKey:@"attendees"] intValue];
        [self refreshPieChart];
    }
}

-(void) refreshPieChart{
    int ocupancy = (_attendees * 100) / _maxAttendees;
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

@end
