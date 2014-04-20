//
//  EventTableViewCell.h
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/20/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIImageView *eventLogo;
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventCapacity;
@property (weak, nonatomic) IBOutlet UIButton *eventStatistics;
@property (weak, nonatomic) IBOutlet UIButton *eventPeople;

@end
