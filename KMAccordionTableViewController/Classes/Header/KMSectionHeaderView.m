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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(toggleOpen:)];
    [self addGestureRecognizer:tapGesture];
    
}

- (IBAction)toggleOpen:(id)sender {
    [self toggleOpenWithUserAction:YES];
}

- (void)toggleOpenWithUserAction:(BOOL)userAction {

    self.disclosureButton.selected = !self.disclosureButton.selected;
    self.section.open = !self.section.open;
    if (userAction) {
        if (self.section.open) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section.sectionIndex];
            }
        }else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section.sectionIndex];
            }
        }
    }

}

- (void)addOverHeaderSubView:(UIView *)view{
    [self.overHeaderView addSubview:view];
}

- (void)setHeaderSeparatorColor:(UIColor *)headerSeparatorColor {
    self.headerSeparatorView.backgroundColor = headerSeparatorColor;
}

- (void)setHeaderColor:(UIColor *)headerColor {
    self.backgroundHeaderView.backgroundColor = headerColor;
}

- (void)setHeaderFont:(UIFont *)headerFont {
    self.titleLabel.font = headerFont;
}

- (void)setHeaderTitleColor:(UIColor *)headerTitleColor {
    self.titleLabel.textColor = headerTitleColor;
}

- (void)setHeaderArrowImageOpened:(UIImage *)headerArrowImageOpened{
    [self.disclosureButton setImage:headerArrowImageOpened forState:UIControlStateNormal];
}

- (void)setHeaderArrowImageClosed:(UIImage *)headerArrowImageClosed{
    [self.disclosureButton setImage:headerArrowImageClosed forState:UIControlStateSelected];
}

@end
