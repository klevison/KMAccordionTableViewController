//
//  KMSection.h
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import <Foundation/Foundation.h>

@class KMSectionHeaderView;

@interface KMSection : NSObject

@property(getter = isOpen) BOOL open;
@property UIView *view;
@property UIView *overHeaderView;
@property KMSectionHeaderView *headerView;
@property(nonatomic, copy) NSString *title;
@property NSInteger sectionIndex;

@end
