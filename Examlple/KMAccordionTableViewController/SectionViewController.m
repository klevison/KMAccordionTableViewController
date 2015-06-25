//
//  SectionViewController.m
//  KMAccordionTableViewController
//
//  Created by Klevison Matias on 6/25/15.
//  Copyright (c) 2015 KM. All rights reserved.
//

#import "SectionViewController.h"

@interface SectionViewController ()

@end

@implementation SectionViewController

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.delegate sectionViewControllerDidLayoutSubViews:self.view.bounds.size];
}


@end
