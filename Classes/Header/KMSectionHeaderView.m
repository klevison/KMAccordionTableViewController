//
//  KMSectionHeaderView.m
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import "KMSectionHeaderView.h"

@implementation KMSectionHeaderView

- (void)awakeFromNib {
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                          action:@selector(toggleOpen:)];
    [self addGestureRecognizer:_tapGesture];
    
}

- (IBAction)toggleOpen:(id)sender
{
    self.disclosureButton.selected = !self.disclosureButton.selected;
    [self.delegate sectionHeaderView:self selectedSectionAtIndex:self.section];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.overHeaderView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)addOverHeaderSubView:(UIView *)view {
    [self.overHeaderView addSubview:view];
}

- (void)setHeaderSectionAppearence:(KMAppearence *)headerSectionAppearence {
    
    _headerSectionAppearence = headerSectionAppearence;
    
    self.headerSeparatorView.backgroundColor = headerSectionAppearence.headerSeparatorColor;
    self.backgroundHeaderView.backgroundColor = headerSectionAppearence.headerColor;
    self.titleLabel.font = headerSectionAppearence.headerFont;
    self.titleLabel.textColor = headerSectionAppearence.headerTitleColor;
    [self.disclosureButton setImage:headerSectionAppearence.headerArrowImageOpened forState:UIControlStateNormal];
    [self.disclosureButton setImage:headerSectionAppearence.headerArrowImageClosed forState:UIControlStateSelected];
}

@end
