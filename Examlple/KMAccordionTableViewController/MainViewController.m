//
//  MyViewController.m
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/2/14.
//
//

#import "MainViewController.h"
#import "SectionViewController.h"

@interface MainViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate, SectionViewControllerDelegate>

@property NSArray *sections;

@end

@implementation MainViewController

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView
{
    return [self.sections count];
}

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index
{
    return self.sections[index];
}

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index
{
    KMSection *section = self.sections[index];
    
    return section.view.frame.size.height;
}

- (UITableViewRowAnimation)accordionTableViewOpenAnimation:(KMAccordionTableViewController *)accordionTableView
{
    return UITableViewRowAnimationFade;
}

- (UITableViewRowAnimation)accordionTableViewCloseAnimation:(KMAccordionTableViewController *)accordionTableView
{
    return UITableViewRowAnimationFade;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sections = [NSArray array];
    [self setupAppearence];
    self.dataSource = self;
    self.delegate = self;
    self.sections = [self getSectionArray];
}

- (void)setupAppearence
{
    [self setHeaderHeight:50];
    [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
    [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
    [self setHeaderFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [self setHeaderTitleColor:[UIColor blackColor]];
    [self setHeaderSeparatorColor:[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1]];
    [self setHeaderColor:[UIColor lightGrayColor]]; //general background color for all of the sections
    [self setOneSectionAlwaysOpen:NO]; // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
}

- (void)updateSectionOne
{
    KMSection *section = self.sections[0];
    UIView *view = section.view;
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 400);
    [self reloadOpenedSection];
}

- (void)updateSectionsOneAndTwo
{
    KMSection *section1 = self.sections[0];
    UIView *view1 = section1.view;
    view1.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    
    KMSection *section2 = self.sections[1];
    UIView *view2 = section2.view;
    view2.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    
    [self reloadOpenedSection];
}

- (NSArray *)getSectionArray
{
    KMSection *section1 = [self sectionOne];
    KMSection *section2 = [self sectionTwo];
    KMSection *section3 = [self sectionThree];
    KMSection *section4 = [self sectionFour];

    return @[section1, section2, section3, section4];
}

#pragma mark - Setup Sections

- (KMSection *)sectionOne
{
    UIView *viewOfSection1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    viewOfSection1.backgroundColor = [UIColor grayColor];
    KMSection *section1 = [KMSection new];
    section1.view = viewOfSection1;
    section1.title = @"Facebook";
    //section1.backgroundColor = [UIColor redColor]; // individual background color for a specific section, overrides the general color if set
    
    UIImageView *overlayViewSection1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, [self headerHeight] - 1)];
    overlayViewSection1.backgroundColor = [UIColor whiteColor];
    overlayViewSection1.image = [UIImage imageNamed:@"facebook"];
    overlayViewSection1.contentMode = UIViewContentModeCenter;
    overlayViewSection1.backgroundColor = [UIColor clearColor];
    section1.overlayView = overlayViewSection1;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [button setTitle:@"Reload only this section" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updateSectionOne) forControlEvents:UIControlEventTouchUpInside];
    [viewOfSection1 addSubview:button];
    
    return section1;
}

- (KMSection *)sectionTwo
{
    UIView *viewOfSection2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    viewOfSection2.backgroundColor = [UIColor redColor];
    KMSection *section2 = [[KMSection alloc] init];
    section2.view = viewOfSection2;
    section2.title = @"Twitter";
    //section1.backgroundColor = [UIColor redColor]; // individual background color for a specific section, overrides the general color if set
    
    UIImageView *overlayViewSection2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, [self headerHeight] - 1)];
    overlayViewSection2.backgroundColor = [UIColor blueColor];
    overlayViewSection2.image = [UIImage imageNamed:@"twitter"];
    overlayViewSection2.contentMode = UIViewContentModeCenter;
    overlayViewSection2.backgroundColor = [UIColor clearColor];
    section2.overlayView = overlayViewSection2;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [button setTitle:@"Reload sections one and two" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updateSectionsOneAndTwo) forControlEvents:UIControlEventTouchUpInside];
    [viewOfSection2 addSubview:button];
    
    return section2;
}

- (KMSection *)sectionThree
{
    UIView *viewOfSection3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    viewOfSection3.backgroundColor = [UIColor greenColor];
    
    KMSection *section3 = [[KMSection alloc] init];
    section3.view = viewOfSection3;
    section3.title = @"Reload All Section";
    //section1.backgroundColor = [UIColor redColor]; // individual background color for a specific section, overrides the general color if set
    
    return section3;
}

- (KMSection *)sectionFour
{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SectionViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerIdentifier"];
    viewController.delegate = self;
    [self addChildViewController:viewController];
    
    KMSection *section4 = [[KMSection alloc] init];
    section4.view = viewController.view;
    section4.title = @"Last Section";
    //section1.backgroundColor = [UIColor redColor]; // individual background color for a specific section, overrides the general color if set
    
    return section4;
}

#pragma mark - KMAccordionTableViewControllerDelegate

- (void)accordionTableViewControllerSectionDidClose:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)accordionTableViewControllerSectionDidOpen:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

#pragma mark - SectionViewControllerDelegate

- (void)sectionViewControllerDidLayoutSubViews:(CGSize)size
{
    KMSection *section = self.sections[3];
    section.view.frame = CGRectMake(0, 0, size.width, size.height);
    
    if (self.openedSectionIndex == 3) {
        [self reloadOpenedSection];
    }
}

@end
