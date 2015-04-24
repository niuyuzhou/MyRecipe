//
//  TianJiaController.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-15.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

#import "MyRecipe.h"
#import "Type.h"
#import "Tag.h"
#import "TianJiaCell.h"
#import "PickerController.h"
#import "LocationInputController.h"

@class TianJiaController;
@protocol TianJiaControllerDelegate <NSObject>

@required
- (void)tianJiaController:(TianJiaController *)tianJiaController didEditObject:(id)object;

@end

@interface TianJiaController : UITableViewController <
UITextFieldDelegate,
UIAlertViewDelegate
>

@property (nonatomic, weak) id<TianJiaControllerDelegate> delegate;
@property (nonatomic, assign) BOOL isEditMode;
@property (nonatomic, assign) BOOL isLocal;
@property (nonatomic, assign) BOOL isNeedToBeSave;

//@property (nonatomic, strong) ShangHu *shangHu;
@property (nonatomic, strong) MyRecipe *myRecipe;
@property (nonatomic, strong) AVObject *shangHuOnServer;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableDictionary *generalAddField;
@property (nonatomic, strong) NSMutableDictionary *optionalAddField;
@property (nonatomic, strong) NSMutableDictionary *addField;

@property (strong, nonatomic) IBOutlet PickerController *tagPickerController1;
@property (strong, nonatomic) IBOutlet PickerController *tagPickerController;
@property (strong, nonatomic) IBOutlet PickerController *typePickerController;
@property (strong, nonatomic) IBOutlet PickerController *areaPickerController;
@property (strong, nonatomic) IBOutlet LocationInputController *locationInputController;
@property (strong, nonatomic) IBOutlet UIPickerView *tagPickerView;
@property (strong, nonatomic) IBOutlet UIPickerView *typePickerView;
@property (strong, nonatomic) IBOutlet UIPickerView *areaPickerView;
@property (strong, nonatomic) IBOutlet UIView *locationInputView;

- (IBAction)save:(id)sender;
- (IBAction)checkIsNeedToBeSaveBeforeBack:(id)sender;

@end
