//
//  Todo.m
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.completed = NO;
    }
    return self;
}

@end
