//
//  SectionViewController.h
//  KMAccordionTableViewController
//
//  Created by Klevison Matias on 6/25/15.
//  Copyright (c) 2015 KM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionViewControllerDelegate <NSObject>

- (void)sectionViewControllerDidLayoutSubViews:(CGSize)size;

@end

@interface SectionViewController : UIViewController

@property(nonatomic, assign) id <SectionViewControllerDelegate>delegate;

@end
