//
//  AESViewControllerTableDelegate.h
//
//  Created by James Chen on 10/22/15.
//
//  Don't confuse this with the UITableViewController. It just implements delegate methods from a UIViewController that has a table view.
//  Use this instead of a UIViewController which is going to be a tableview delegate.
//  This class provides a uniform way to change properties of view controllers with table views. It also provides a common set of helper
//  methods on the view controllers.

#import <UIKit/UIKit.h>

@interface AESViewControllerTableDelegate : UIViewController <UITableViewDelegate>
- (void)setTableViewHeaderFooterColor:(UIColor *)theColor;
- (void)setAccessory:(UITableViewCell *)cell withCompletionStatus:(BOOL)completionStatus visitedView:(BOOL)visitedView;
- (void)setAccessory:(UITableViewCell *)cell visitedView:(BOOL)visitedView;
- (void)reloadIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;
- (void)okAlertWithTitle:(NSString *)title msg:(NSString *)msg;
@end
