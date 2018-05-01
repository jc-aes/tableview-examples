//
//  AESListTableVC.m
//
//  Created by James Chen on 4/28/17.
//

#import "AESListTableVC.h"
#import "UIColor+CustomColor.h"

@interface AESListTableVC ()

/**
 Base class table view for a AESListTableVC.
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;


/**
 Delegate for the AESListTable base class to execute the ViewController's behavior.
 */
@property (weak, nonatomic) id<AESListTableDelegate> listTableDelegate;


/**
 Give a name for the alert box title and description for what to delete. For example, if the form is a Book, enter 'Book' as the delete item description.
 */
@property (strong, nonatomic) NSString *deleteItemDescription;

@end

@implementation AESListTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor customAppColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            [self deleteAlert:name dependentIndex:[indexPath row] cell:cell];
        }
    }
}

- (IBAction)onLongPressGesture:(UILongPressGestureRecognizer *)recognizer {
    UIGestureRecognizerState state = recognizer.state;
    
    // Don't handle the other gesture recognizer states. Only on began.
    if (state != UIGestureRecognizerStateBegan) {
        return;
    }
    
    CGPoint location = [recognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    if (indexPath) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
            NSString *name = cell.textLabel.text;
            [self deleteAlert:name dependentIndex:[indexPath row] cell:cell];
        }
    }
}

- (void)deleteAlert:(NSString *)name dependentIndex:(NSUInteger)deleteIndex cell:(UITableViewCell *)cell {
    assert([self.deleteItemDescription length]);
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
                                       [self.listTableDelegate doDeleteItem:deleteIndex];
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
