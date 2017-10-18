//
//  DetailViewController.h
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CustomCellTableViewCell.h"
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleDescriptionLabel;

@property (nonatomic, strong) Todo *myTodo;
@end

