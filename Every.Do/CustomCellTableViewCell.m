//
//  CustomCellTableViewCell.m
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "CustomCellTableViewCell.h"

@implementation CustomCellTableViewCell

- (void)configureWithTodo:(Todo *)todo
{
    if (todo.completed == NO){
    self.titleLabel.text = todo.title;
    } else {
        NSDictionary *attribute = @{NSStrikethroughStyleAttributeName : [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        NSAttributedString *attr = [[NSAttributedString alloc]initWithString:todo.title attributes:attribute];
        self.titleLabel.attributedText = attr;
    }
    self.descriptionLabel.text = todo.todoDescription;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d", todo.priority];
    
}

@end
