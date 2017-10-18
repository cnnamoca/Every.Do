//
//  CustomCellTableViewCell.h
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface CustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

- (void)configureWithTodo:(Todo *)todo;

@end
