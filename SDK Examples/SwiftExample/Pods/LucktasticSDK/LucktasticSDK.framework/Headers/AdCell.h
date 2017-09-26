//
//  AdCell.h
//  LucktasticSDK
//
//  Created by Gog Avagyan on 6/22/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import <QuartzCore/QuartzCore.h>

@protocol CellClickDelegate
-(void) onClick;
@end

@interface AdCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainImageHeightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
- (IBAction)onMainImageButtonClick:(UIButton *)sender;

@property (weak) id <CellClickDelegate> delegate;

@end
