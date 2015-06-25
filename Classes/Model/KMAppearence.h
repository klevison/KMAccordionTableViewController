//
// Created by Klevison Matias on 5/15/14.
//

#import <UIKit/UIKit.h>

@interface KMAppearence : NSObject

@property(nonatomic, assign) CGFloat headerHeight;
@property(nonatomic, strong) UIFont *headerFont;
@property(nonatomic, strong) UIColor *headerTitleColor;
@property(nonatomic, strong) UIColor *headerColor;
@property(nonatomic, strong) UIColor *headerSeparatorColor;
@property(nonatomic) UIImage *headerArrowImageOpened;
@property(nonatomic) UIImage *headerArrowImageClosed;

@end