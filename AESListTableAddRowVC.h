//
//  AESListTableAddRowVC.h
//
//  Created by James Chen on 5/1/17.
//

#import "AESViewControllerTableDelegate.h"

// Special delegate for Add Row List Table ViewControllers.
@protocol AESListTableAddRowDelegate <NSObject>

/**
 Determine whether or not the indexPath can be deleted after it has been identified or targeted by a gesture. For example, it's in a section with deletable objects, or it's NOT an add button row.

 @param indexPath Index path based on location of gesture.
 @return True if can be deleted. False if not a deletable indexPath.
 */
- (BOOL)canDeleteIndexPath:(NSIndexPath *)indexPath;

/**
 Perform the actual deletion of the object.

 @param indexPath The indexPath of the object to be deleted.
 */
- (void)doDeleteItemAtIndexPath:(NSIndexPath *)indexPath;

@end

/**
 The AESListTableAddRowVC is a subclass of AESViewControllerTableDelegate. The difference here is that we add special behavior to allow lists of items with add buttons to also allow deletion using swiping or long press gesture. This class is also a UITableViewDataSource delegate.
 
 This class allows for an add button row within the table, as opposed to a toolbar with an add button. This may be necessary for the view controller due to the configuration of the tableView which does not allow for the use of a toolbar. For example, the table may have multiple sections but the table only allows for a single toolbar.
 
 Make sure to set up the following items to use this class properly:
 
 1. Set a deleteItemDescription.
 2. Set the tableListDelegate to your ViewController's self.
 
 */
@interface AESListTableAddRowVC : AESViewControllerTableDelegate <UITableViewDataSource>

@end
