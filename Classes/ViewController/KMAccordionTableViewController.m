//
//  KMAccordionTableViewController.m
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import "KMAccordionTableViewController.h"
//#import "KMTableViewCell.h"

@interface KMAccordionTableViewController () <KMSectionHeaderViewDelegate>

@property UITableViewRowAnimation closeAnimation;
@property UITableViewRowAnimation openAnimation;
@property(nonatomic, strong) NSArray *sections;

@end

@implementation KMAccordionTableViewController

static NSString *SectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";
static NSString *SectionCellID = @"CellIdentifier";
static bool oneSectionAlwaysOpen = NO;

-(instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.sectionAppearence = [KMAppearence new];
    self.openAnimation = UITableViewRowAnimationFade;
    self.closeAnimation = UITableViewRowAnimationFade;
    self.openedSectionIndex = NSNotFound;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
}

#pragma mark - Appearence Methods

- (void)setHeaderHeight:(CGFloat)height
{
    [self.sectionAppearence setHeaderHeight:height];
}

- (CGFloat)headerHeight
{
    return [self.sectionAppearence headerHeight];
}

- (void)setHeaderFont:(UIFont *)headerFont
{
    [self.sectionAppearence setHeaderFont:headerFont];
}

- (void)setHeaderTitleColor:(UIColor *)headerTitleColor
{
    [self.sectionAppearence setHeaderTitleColor:headerTitleColor];
}

- (void)setHeaderColor:(UIColor *)headerColor
{
    [self.sectionAppearence setHeaderColor:headerColor];
}

- (void)setHeaderSeparatorColor:(UIColor *)headerSeparatorColor
{
    [self.sectionAppearence setHeaderSeparatorColor:headerSeparatorColor];
}

- (void)setHeaderArrowImageOpened:(UIImage *)headerArrowImageOpened
{
    [self.sectionAppearence setHeaderArrowImageOpened:headerArrowImageOpened];
}

- (void)setHeaderArrowImageClosed:(UIImage *)headerArrowImageClosed
{
    [self.sectionAppearence setHeaderArrowImageClosed:headerArrowImageClosed];
}

- (void)setOneSectionAlwaysOpen:(BOOL)isOpen
{
    oneSectionAlwaysOpen = isOpen;
}

#pragma mark - Class Methods

- (id)sectionAtIndex:(NSInteger)index
{
    if (self.sections.count >= index + 1) {
        return self.sections[index];
    }
    
    return nil;
}

- (void)setupTableView
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"KMAccordionTableViewController" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    UINib *sectionHeaderNib = [UINib nibWithNibName:NSStringFromClass([KMSectionHeaderView class]) bundle:bundle];
    [self.tableView registerNib:sectionHeaderNib forHeaderFooterViewReuseIdentifier:SectionHeaderViewIdentifier];
    [self.tableView setBounces:NO];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)configureSectionsCell:(KMSection *)section
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"%@%zd", SectionCellID, section.sectionIndex];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (KMSection *)getOpenedSection {
    for (KMSection *section in self.sections)
    {
        if (section.open) {
            return section;
            break;
        }
    }
    
    return nil;
}

- (void)reloadOpenedSection
{
    KMSection *openedSection = [self getOpenedSection];
    if (openedSection) {
        NSArray *cellToReloadArray = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:openedSection.sectionIndex]];
        [self.tableView reloadRowsAtIndexPaths:cellToReloadArray withRowAnimation:self.openAnimation];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataSource numberOfSectionsInAccordionTableViewController:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    KMSection *currentSection = (self.sections)[section];
    
    return currentSection.open ? 1 : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heightForRowAtIndexPath = [self.dataSource accordionTableView:self heightForSectionAtIndex:indexPath.section];
    
    return heightForRowAtIndexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *CellIdentifier = [NSString stringWithFormat:@"CellIdentifier%zd", indexPath.section];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    KMSection *section = self.sections[indexPath.section];
    [cell.contentView addSubview:section.view];
    [cell.contentView setAutoresizesSubviews:NO];
    [cell.contentView setFrame:section.view.frame];

    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.sectionAppearence.headerHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{

    KMSectionHeaderView *sectionHeaderView = (KMSectionHeaderView *) [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionHeaderViewIdentifier];

    KMSection *currentSection = [self.dataSource accordionTableView:self sectionForRowAtIndex:sectionIndex];
    currentSection.sectionIndex = sectionIndex;
    currentSection.headerView = sectionHeaderView;

    sectionHeaderView.titleLabel.text = currentSection.title;
    [sectionHeaderView setSection:sectionIndex];
    [sectionHeaderView setDelegate:self];
    
    sectionHeaderView.disclosureButton.selected = currentSection.isOpen;
    
    UIColor *tempcolor = self.sectionAppearence.headerColor;
    if (currentSection.backgroundColor) {
        [self.sectionAppearence setHeaderColor:currentSection.backgroundColor];
    }
    
    [sectionHeaderView setHeaderSectionAppearence:self.sectionAppearence];
    [self.sectionAppearence setHeaderColor:tempcolor];
    
    if (currentSection.overlayView) {
        [sectionHeaderView addOverHeaderSubView:currentSection.overlayView];
    }

    [self configureSectionsCell:currentSection];
    if (oneSectionAlwaysOpen && (sectionIndex == 0) && self.openedSectionIndex == NSNotFound) {
        [self sectionHeaderView:sectionHeaderView sectionOpened:0];
    }
    
    return sectionHeaderView;
}

#pragma mark - SectionHeaderViewDelegate

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView selectedSectionAtIndex:(NSInteger)sectionOpened
{
    
    KMSection *section = (self.sections)[sectionOpened];
    
    if ([self.dataSource respondsToSelector:@selector(accordionTableViewOpenAnimation:)]) {
        self.openAnimation = [self.dataSource accordionTableViewOpenAnimation:self];
    }
    
    if ([self.dataSource respondsToSelector:@selector(accordionTableViewCloseAnimation:)]) {
        self.closeAnimation = [self.dataSource accordionTableViewCloseAnimation:self];
    }
    
    if (!section.open) {
        [self sectionHeaderView:sectionHeaderView sectionOpened:sectionOpened];
    } else if (!oneSectionAlwaysOpen) {
        [self sectionHeaderView:sectionHeaderView sectionClosed:sectionOpened];
    }
    
}

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)sectionOpened
{
    
    KMSection *section = (self.sections)[sectionOpened];
    
    section.open = YES;
    
    NSMutableArray *indexPathsToInsert = [NSMutableArray array];
    [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:0 inSection:sectionOpened]];
    
    NSMutableArray *indexPathsToDelete = [NSMutableArray array];
    
    NSInteger previousOpenSectionIndex = self.openedSectionIndex;
    
    if (previousOpenSectionIndex != NSNotFound) {
        KMSection *previousOpenSection = (self.sections)[previousOpenSectionIndex];
        KMSectionHeaderView *praviousSectionHeaderView = (KMSectionHeaderView *)[self.tableView headerViewForSection:previousOpenSectionIndex];
        praviousSectionHeaderView.disclosureButton.selected = NO;
        previousOpenSection.open = NO;
        [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:0 inSection:previousOpenSectionIndex]];
        if ([self.delegate respondsToSelector:@selector(accordionTableViewControllerSectionDidClose:)]) {
            [self.delegate accordionTableViewControllerSectionDidClose:previousOpenSection];
        }
    }
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:self.openAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:self.closeAnimation];
    [self.tableView endUpdates];
    
    CGRect sectionRect = [self.tableView rectForSection:sectionOpened];
    [self.tableView scrollRectToVisible:sectionRect animated:YES];
    
    self.openedSectionIndex = sectionOpened;
    
    if ([self.delegate respondsToSelector:@selector(accordionTableViewControllerSectionDidOpen:)]) {
        [self.delegate accordionTableViewControllerSectionDidOpen:section];
    }
}

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)sectionClosed
{
    
    KMSection *currentSection = self.sections[sectionClosed];
    
    currentSection.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:0 inSection:sectionClosed]];
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:self.closeAnimation];
        sectionHeaderView.disclosureButton.selected = NO;
    }
    
    self.openedSectionIndex = NSNotFound;
    
    if ([self.delegate respondsToSelector:@selector(accordionTableViewControllerSectionDidClose:)]) {
        [self.delegate accordionTableViewControllerSectionDidClose:currentSection];
    }

}

@end
