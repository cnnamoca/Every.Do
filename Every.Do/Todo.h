//
//  Todo.h
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LOW,
    MEDIUM,
    HIGH,
} (priorityLevel);

@interface Todo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) int priority;
@property (nonatomic) BOOL completed;


@end
