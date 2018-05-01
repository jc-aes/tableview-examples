//
//  AESViewControllerTableDelegate.m
//
//  Created by James Chen on 10/22/15.
//
//  DTCustomColoredAccessory can be found at:
//  https://github.com/Cocoanetics/DTFoundation/tree/develop/Core/Source/iOS
//
//  UIColor+CustomColor is a category of UIColor that allows you to provide a custom color. It is not provided.

#import "AESViewControllerTableDelegate.h"
#import "DTCustomColoredAccessory.h"
#import "UIColor+CustomColor.h"

@interface AESViewControllerTableDelegate ()
@property (nonatomic) UIColor *headerFooterColor;
@end

@implementation AESViewControllerTableDelegate

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setTableViewHeaderFooterColor:(UIColor *)theColor {
    self.headerFooterColor = theColor;
}

/// Set header color.
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[UITableViewHeaderFooterView class]] ) {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
        header.textLabel.textColor = self.headerFooterColor ? self.headerFooterColor : [UIColor whiteColor];
    }
}

/// Set footer color.
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if ([view isKindOfClass:[UITableViewHeaderFooterView class]] ) {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
        header.textLabel.textColor = self.headerFooterColor ? self.headerFooterColor : [UIColor whiteColor];
    }
}

/// Show a checkmark if marked as completed, or show whether the item has been visited or not.
- (void)setAccessory:(UITableViewCell *)cell withCompletionStatus:(BOOL)completionStatus visitedView:(BOOL)visitedView {
    cell.accessoryView = nil;
    if (completionStatus) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        if (visitedView) {
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        } else {
            DTCustomColoredAccessory *accessory = [DTCustomColoredAccessory accessoryWithColor:[UIColor customAppColor]];
            accessory.highlightedColor = [cell tintColor];
            cell.accessoryView = accessory;
        }
    }
}

/// Show whether the item has been visited or not.
- (void)setAccessory:(UITableViewCell *)cell visitedView:(BOOL)visitedView {
    cell.accessoryView = nil;
    if (visitedView) {
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    } else {
        DTCustomColoredAccessory *accessory = [DTCustomColoredAccessory accessoryWithColor:[UIColor customAppColor]];
        accessory.highlightedColor = [cell tintColor];
        cell.accessoryView = accessory;
    }
}

/// Reload a single row of the table at the given indexPath.
- (void)reloadIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    if (indexPath) {
        [tableView beginUpdates];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [tableView endUpdates];
    }
}

- (void)okAlertWithTitle:(NSString *)title msg:(NSString *)msg {
    UIAlertController *alertView= [UIAlertController
                                   alertControllerWithTitle:title
                                   message:msg
                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismissAction = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        [alertView dismissViewControllerAnimated:YES completion:nil];
                                    }];
    
    [alertView addAction:dismissAction];
    [self presentViewController:alertView animated:YES completion:nil];
}

@end
