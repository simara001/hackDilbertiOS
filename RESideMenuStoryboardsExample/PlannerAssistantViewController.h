//
//  PlannerAssistantViewController.h
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/19/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPRequest.h"

@interface PlannerAssistantViewController : UIViewController <HTTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UITableView *eventTable;
@property (nonatomic, strong) HTTPRequest *request;

@end
