//
//  MasterViewController.m
//  Every.Do
//
//  Created by Carlo Namoca on 2017-10-17.
//  Copyright © 2017 Carlo Namoca. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "CustomCellTableViewCell.h"

@interface MasterViewController ()
@property (nonatomic) NSMutableArray<Todo*> *objects;
@property (nonatomic) Todo* myTodo;
@property (nonatomic) NSMutableArray *myArr;

@property (nonatomic) CustomCellTableViewCell *customCell;


@end

@implementation MasterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *complete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"COMPLETE" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        self.myTodo = [self.objects objectAtIndex:indexPath.row];
        self.myTodo.completed = YES;
        [self.tableView setEditing:NO];
        [self.tableView reloadData];
    }];
    
    complete.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"DELETE" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }];
    return @[complete, delete];
    
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    UIAlertController* alert;
    alert = [UIAlertController alertControllerWithTitle:@"ADD TODO" message:@"PLEASE ADD DETAILS" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"TITLE";
        textField.font = [UIFont systemFontOfSize:10];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.text = self.customCell.titleLabel.text;
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"DESCRIPTION";
        textField.font = [UIFont systemFontOfSize:10];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.text = self.customCell.descriptionLabel.text;
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"PRIORITY";
        textField.font = [UIFont systemFontOfSize:10];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.text = self.customCell.priorityLabel.text;
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action)
                      {
                          Todo *newTodo = [Todo new];
                          newTodo.title = alert.textFields[0].text;
                          newTodo.todoDescription = alert.textFields[1].text;
                          newTodo.priority = [alert.textFields[2].text floatValue];
                          [self.objects addObject:newTodo];
                          [self.tableView reloadData];
                      }]];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [alert addAction: cancel];
    [self presentViewController:alert animated:true completion:nil];
    
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setMyTodo:object];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (CustomCellTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Todo *todoToPass = [self.objects objectAtIndex:indexPath.row];
    [cell configureWithTodo:todoToPass];

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
