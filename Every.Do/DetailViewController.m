//
//  DetailViewController.m
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setMyTodo:(Todo *)myTodo
{
    if (_myTodo != myTodo)
    {
        _myTodo = myTodo;
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.myTodo) {
        self.detailDescriptionLabel.text = self.myTodo.todoDescription;
        self.titleDescriptionLabel.text = self.myTodo.title;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
