//
//  MyViewController.m
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/2/14.
//
//

#import "MyViewController.h"

@interface MyViewController () <KMAccordionTableViewControllerDataSource>

@end

@implementation MyViewController

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView {
    return [self.sections count];
}

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index {
    return self.sections[index];
}

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index {
    KMSection *section = self.sections[index];
    return section.view.frame.size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = self;

    self.sections = [self getSectionArray];
    [self setupAppearence];

}

- (void)setupAppearence {
    [self setHeaderHeight:38];
    [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
    [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
    [self setHeaderFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [self setHeaderTitleColor:[UIColor greenColor]];
    [self setHeaderSeparatorColor:[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1]];
    [self setHeaderColor:[UIColor colorWithRed:0.114 green:0.114 blue:0.114 alpha:1]];
}

- (void)teste {
    KMSection *section = self.sections[2];

    UIView *view = section.view;
    view.frame = CGRectMake(0, 0, 320, 400);
    [self reloadOpenedSection];
}

- (NSArray *)getSectionArray {
    UIView *viewOfSection1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    viewOfSection1.backgroundColor = [UIColor grayColor];
    KMSection *section1 = [[KMSection alloc] init];
    section1.view = viewOfSection1;
    section1.title = @"My First Section";

    UIView *minhaview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    minhaview.backgroundColor = [UIColor redColor];
    section1.overHeaderView = minhaview;

    UIView *viewOfSection2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    viewOfSection2.backgroundColor = [UIColor redColor];
    KMSection *section2 = [[KMSection alloc] init];
    section2.view = viewOfSection2;
    section2.title = @"Sec. Section";

    UIView *viewOfSection3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    viewOfSection3.backgroundColor = [UIColor greenColor];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    [button setTitle:@"click meeeeeee" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(teste) forControlEvents:UIControlEventTouchUpInside];
    [viewOfSection3 addSubview:button];

    KMSection *section3 = [[KMSection alloc] init];
    section3.view = viewOfSection3;
    section3.title = @"thirddddd";

    UIView *viewOfSection5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    viewOfSection5.backgroundColor = [UIColor redColor];
    KMSection *section5 = [[KMSection alloc] init];
    section5.view = viewOfSection5;
    section5.title = @"Sec. Section";

    UIView *viewOfSection6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection6.backgroundColor = [UIColor greenColor];
    KMSection *section6 = [[KMSection alloc] init];
    section6.view = viewOfSection6;
    section6.title = @"thirddddd";

    return @[section1, section2, section3, section5, section6];
}

@end
