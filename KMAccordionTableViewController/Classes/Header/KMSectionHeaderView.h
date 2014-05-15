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

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)section;

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)section;

@end

@interface KMSectionHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UIButton *disclosureButton;
@property(nonatomic, weak) IBOutlet id <KMSectionHeaderViewDelegate> delegate;
@property(weak, nonatomic) IBOutlet UIView *headerSeparatorView;
@property(nonatomic) NSInteger section;
@property(weak, nonatomic) IBOutlet UIView *backgroundHeaderView;
@property(weak, nonatomic) IBOutlet UIView *overHeaderView;
@property(nonatomic, strong) KMAppearence *headerSectionAppearence;

- (void)toggleOpenWithUserAction:(BOOL)userAction;

- (void)addOverHeaderSubView:(UIView *)view;

@end

