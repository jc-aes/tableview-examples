//
//  AESListTableAddRowVC.m
//
//  Created by James Chen on 5/1/17.
//

#import "AESListTableAddRowVC.h"
#import "UIColor+CustomColor.h"

@interface AESListTableAddRowVC ()

/**
 Base class table view for a AESListTableAddRowVC.
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;


/**
 Delegate for the AESListTableAddRow base class to execute the ViewController's behavior.
 */
@property (weak, nonatomic) id<AESListTableAddRowDelegate> listTableAddRowDelegate;


/**
 Give a name for the alert box title and description for what to delete. For example, if the item is a Book, enter 'Book' as the delete item description.
 */
@property (strong, nonatomic) NSString *deleteItemDescription;

@end

@implementation AESListTableAddRowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor customAppColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    assert(false);
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    assert(false);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    assert(false);
    return nil;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
            NSString *name = cell.textLabel.text;
            [self deleteItemAlert:name indexPath:indexPath cell:cell];
        }
    }
}

// Only the rows that can be deleted can be edited. In other words don't let the user swipe the other rows to show the delete button.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.listTableAddRowDelegate canDeleteIndexPath:indexPath];
}

- (IBAction)onLongPressGesture:(UILongPressGestureRecognizer *)recognizer {
    UIGestureRecognizerState state = recognizer.state;
    
    // Don't handle the other gesture recognizer states. Only on began.
    if (state != UIGestureRecognizerStateBegan) {
        return;
    }
    
    CGPoint location = [recognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    if (indexPath && [self.listTableAddRowDelegate canDeleteIndexPath:indexPath] ) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
            name = cell.textLabel.text;
            [self deleteItemAlert:name indexPath:indexPath cell:cell];
        }
    }
}

// Performs the delete action besides presenting the alert.
- (void)deleteItemAlert:(NSString *)name indexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell {
    NSString *title = [NSString stringWithFormat:@"Delete %@", self.deleteItemDescription];
    NSString *msg = [NSString stringWithFormat:@"Do you really want to delete %@ for %@?", self.deleteItemDescription, name];
    UIAlertController *deleteView= [UIAlertController
                                    alertControllerWithTitle:title
                                    message:msg
                                    preferredStyle:UIAlertControllerStyleActionSheet];
    deleteView.popoverPresentationController.sourceView = cell;
    deleteView.popoverPresentationController.sourceRect = cell.bounds;

    UIAlertAction *deleteAction = [UIAlertAction
                                   actionWithTitle:@"Delete"
                                   style:UIAlertActionStyleDestructive
                                   handler:^(UIAlertAction * action) {
                                       [self.listTableAddRowDelegate doDeleteItemAtIndexPath:indexPath];
                                       [deleteView dismissViewControllerAnimated:YES completion:nil];
                                   }];
    
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action) {
                                 [deleteView dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [deleteView addAction:deleteAction];
    [deleteView addAction:cancel];
    [self presentViewController:deleteView animated:YES completion:nil];
}

@end
