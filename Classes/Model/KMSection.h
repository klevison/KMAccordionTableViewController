//
//  KMSection.h
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import <UIKit/UIKit.h>

@class KMSectionHeaderView;

@interface KMSection : NSObject

@property(getter = isOpen) BOOL open;
@property UIView *view;
@property UIView *overHeaderView;
@property KMSectionHeaderView *headerView;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) UIImage *image;
@property(nonatomic, copy) UIColor *colorForBackground;
@property NSInteger sectionIndex;

@end
