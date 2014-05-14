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

@class KMAccordionTableViewController;
@class KMSection;

@protocol KMAccordionTableViewControllerDataSource <NSObject>

@required

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView;

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index;

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index;

@end


@interface KMAccordionTableViewController : UITableViewController

/**
 Updates the opened section.
 */
- (void)reloadOpenedSection;

/**
 Sets AccordionTableView's datasource.
 */
@property(nonatomic, assign) id <KMAccordionTableViewControllerDataSource> dataSource;

/**
 Sets section's view.
 */
@property(nonatomic, strong) NSArray *sections;

/**
 Sets section header height.
 */
@property(nonatomic, assign) NSInteger headerHeight;

/**
 Sets section header font.
 */
@property(nonatomic, strong) UIFont *headerFont;

/**
 Sets section header font color.
 */
@property(nonatomic, strong) UIColor *headerTitleColor;

/**
 Sets section header background color.
 */
@property(nonatomic, strong) UIColor *headerColor;

/**
 Sets section header separator color.
 */
@property(nonatomic, strong) UIColor *headerSeparatorColor;

/**
 Sets section header disclosure opened image.
 */
@property(nonatomic) UIImage *headerArrowImageOpened;

/**
 Sets section header disclosure closed image.
 */
@property(nonatomic) UIImage *headerArrowImageClosed;

@end
