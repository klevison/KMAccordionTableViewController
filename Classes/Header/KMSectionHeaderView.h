//
//  KMSectionHeaderView.h
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import <UIKit/UIKit.h>
#import "KMAppearence.h"

@class KMSectionHeaderView;

@protocol KMSectionHeaderViewDelegate <NSObject>

@optional

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView selectedSectionAtIndex:(NSInteger)section;

@end

@interface KMSectionHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property(nonatomic, weak) IBOutlet UIButton *disclosureButton;
@property(nonatomic, weak) IBOutlet id <KMSectionHeaderViewDelegate> delegate;
@property(weak, nonatomic) IBOutlet UIView *headerSeparatorView;
@property(nonatomic) NSInteger section;
@property(weak, nonatomic) IBOutlet UIView *backgroundHeaderView;
@property(weak, nonatomic) IBOutlet UIView *overHeaderView;
@property(nonatomic, strong) KMAppearence *headerSectionAppearence;
@property UITapGestureRecognizer *tapGesture;

- (void)addOverHeaderSubView:(UIView *)view;
- (IBAction)toggleOpen:(id)sender;

@end

