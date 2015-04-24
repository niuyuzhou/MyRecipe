//
//  SheZhiCell.h
//  BestCanteen
//
//  Created by niuyuzhou on 14-2-19.
//  Copyright (c) 2014年 foodie. All rights reserved.
//

@interface SheZhiCell : UITableViewCell

@property (strong, nonatomic) NSString *fieldKey;
@property (strong, nonatomic) IBOutlet UILabel *fieldLabel;
@property (strong, nonatomic) IBOutlet UIImageView *fieldIcon;
@property (strong, nonatomic) IBOutlet UIButton *logOutButton;
@property (strong, nonatomic) IBOutlet UIButton *logInButton;

- (IBAction)logOut:(id)sender;
- (void)resetToDefaultStatus;
- (void)configureOnKey:(NSString *)fieldKey withField:(NSString *)field andIcon:(UIImage *)icon;

@end