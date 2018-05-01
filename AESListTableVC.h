//
//  AESListTableVC.h
//
//  Created by James Chen on 4/28/17.
//

#import "AESViewControllerTableDelegate.h"

@protocol AESListTableDelegate <NSObject>

/**
 Perform the actual removal of the data object from the model. For example, delete a form from the list of forms.

 @param deleteIndex This will be populated with the index of the object to delete based on the row of the cell selected for deletion.
 */
- (void)doDeleteItem:(NSUInteger)deleteIndex;
@end


/**
  The AESListTableVC is a subclass of AESViewControllerTableDelegate. The difference here is that we add special behavior to allow a single list of items with an optional single add button toolbar to also allow deletion using swiping or long press gesture. This class is also a UITableViewDataSource delegate.
 
 Make sure to set up the following items to use this class properly:
 
 1. Set a deleteItemDescription.
 2. Set the tableListDelegate to your ViewController's self.

 */
@interface AESListTableVC : AESViewControllerTableDelegate <UITableViewDataSource>

@end
