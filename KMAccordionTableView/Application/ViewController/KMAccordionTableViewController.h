//
//  KMAccordionTableViewController.h
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import <UIKit/UIKit.h>

@class KMAccordionTableViewController;
@class KMSection;

@protocol KMAccordionTableViewControllerDataSource <NSObject>

@required

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView;

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index;

@end


@interface KMAccordionTableViewController : UITableViewController

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
 Sets section header disclosure button image.
 */
@property(nonatomic, strong) UIImage *headerDisclosureButtonImage;

@end
