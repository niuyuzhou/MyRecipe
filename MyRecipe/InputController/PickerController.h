
#import "Type.h"
#import "Tag.h"

typedef NS_ENUM(NSUInteger, DataSource) {
	DataSourceType = (1UL << 1),
	DataSourceTag = (1UL << 2),
	DataSourceArea = (1UL << 3),
};

@class PickerController;
@protocol PickerControllerDelegate <NSObject>

@required
- (void)pickerController:(PickerController *)pickerController didSelectField:(NSString *)field;

@end

@interface PickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) DataSource dataSource;
@property (nonatomic, weak) id<PickerControllerDelegate> delegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (void)initDataSource;

@end
