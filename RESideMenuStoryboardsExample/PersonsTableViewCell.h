//
//  PersonsTableViewCell.h
//  RESideMenuStoryboardsExample
//
//  Created by migue ramirez on 4/20/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIView *personImage;
@property (weak, nonatomic) IBOutlet UILabel *personFirstName;
@property (weak, nonatomic) IBOutlet UILabel *personLastName;
@property (weak, nonatomic) IBOutlet UILabel *personEmail;


@end
