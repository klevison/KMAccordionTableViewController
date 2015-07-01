//
//  KMAccordionTableViewController.h
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import <UIKit/UIKit.h>
#import "KMSection.h"
#import "KMSectionHeaderView.h"
#import "KMAppearence.h"

@class KMAccordionTableViewController;
@class KMSection;
@class KMAppearence;

@protocol KMAccordionTableViewControllerDelegate <NSObject>

@optional

- (void)accordionTableViewControllerSectionDidOpen:(KMSection *)section;
- (void)accordionTableViewControllerSectionDidClose:(KMSection *)section;

@end

@protocol KMAccordionTableViewControllerDataSource <NSObject>

@required

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView;

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index;

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index;

@optional

- (UITableViewRowAnimation)accordionTableViewOpenAnimation:(KMAccordionTableViewController *)accordionTableView;

- (UITableViewRowAnimation)accordionTableViewCloseAnimation:(KMAccordionTableViewController *)accordionTableView;

@end


@interface KMAccordionTableViewController : UITableViewController

/**
 Updates the opened section.
 */
- (void)reloadOpenedSection;

/**
 Sets AccordionTableView's delegate.
 */
@property(nonatomic, assign) id <KMAccordionTableViewControllerDelegate> delegate;

/**
 Sets AccordionTableView's datasource.
 */
@property(nonatomic, assign) id <KMAccordionTableViewControllerDataSource> dataSource;

/**
 Sets section's view.
 */
@property(nonatomic, strong) KMAppearence *sectionAppearence;
@property (nonatomic) NSInteger openedSectionIndex;

/**
 Sets section at index.
 */
- (id)sectionAtIndex:(NSInteger)index;

/**
 Sets section header height.
 */
- (void)setHeaderHeight:(CGFloat)height;

/**
 Get section header height.
 */
- (CGFloat)headerHeight;

/**
 Sets section header font.
 */
- (void)setHeaderFont:(UIFont *)headerFont;

/**
 Sets section header font color.
 */
- (void)setHeaderTitleColor:(UIColor *)headerTitleColor;

/**
 Sets section header background color.
 */
- (void)setHeaderColor:(UIColor *)headerColor;

/**
 Sets section header separator color.
 */
- (void)setHeaderSeparatorColor:(UIColor *)headerSeparatorColor;

/**
 Sets section header disclosure opened image.
 */
- (void)setHeaderArrowImageOpened:(UIImage *)headerArrowImageOpened;

/**
 Sets section header disclosure closed image.
 */
- (void)setHeaderArrowImageClosed:(UIImage *)headerArrowImageClosed;

/**
 Sets if one section will always be open.
 */
- (void)setOneSectionAlwaysOpen:(BOOL)isOpen;

@end
