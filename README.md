# tableview-examples

### AESViewControllerTableDelegate

This is an example for providing uniform color attributes across UITableViews in an app. It also provides some common methods. Although it's usually better to create a separate library or module for common methods that are not strictly related to the single purpose of this class, I found that it was convenient to include some because they were few in number and somewhat related to the purpose of the class, which is to provide the view controller functionality. If the items start to become more numerous it may warrant separating it out into its own module.

### AESListTableVC

This is an example for providing long press and swipe to delete table view items. It builds on the more basic functionality provided by the parent class AESViewControllerTableDelegate.

### AESListTableAddRowVC

This is an example that has a specialized kind of table view which needs the delete functionality but has a slightly different content of rows that may be of a type that should not be deleted. For example, if you have add buttons on the bottom of each section, you probably do not wish for those rows to be removed. This class provides a way to determine whether or not a row should be allowed to be deleted or not. In my case, it happened to be for Add Rows, so that's the rationale for the naming.

## Notes

These examples provide a hierarchy of subclasses that help keep an app's appearance uniform as well as provide common functionality to view controllers. It's advisable to keep subclasses to a maximum of 3 to 5 layers due to the complexity it can cause for readability and maintainability of the code (reference Code Complete by Steve McConnell).
