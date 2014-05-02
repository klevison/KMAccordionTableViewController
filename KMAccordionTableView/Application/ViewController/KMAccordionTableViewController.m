//
//  KMAccordionTableViewController.m
//  KMAccordionTableView
//
//  Created by Klevison Matias on 5/1/14.
//
//

#import "KMAccordionTableViewController.h"
#import "KMSectionHeaderView.h"
#import "KMSection.h"

@interface KMAccordionTableViewController () <KMSectionHeaderViewDelegate>

@property(nonatomic) NSInteger openSectionIndex;

@end

@implementation KMAccordionTableViewController

static NSString *SectionHeaderViewIdentifier = @"SectionHeaderViewIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.openSectionIndex = NSNotFound;

    [self setupTableView];
}

#pragma mark - Class Methods

- (void)setupTableView {
    UINib *sectionHeaderNib = [UINib nibWithNibName:NSStringFromClass([KMSectionHeaderView class]) bundle:nil];
    [self.tableView registerNib:sectionHeaderNib forHeaderFooterViewReuseIdentifier:SectionHeaderViewIdentifier];
    [self.tableView setBounces:NO];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSectionsInAccordionTableViewController:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    KMSection *currentSection = (self.sections)[section];
    return currentSection.open ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat:@"CellIdentifier%d", indexPath.section];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        KMSection *section = self.sections[indexPath.section];
        [cell.contentView addSubview:section.view];
        [cell.contentView setFrame:section.view.frame];
    }

    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.headerHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    KMSectionHeaderView *sectionHeaderView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:SectionHeaderViewIdentifier];

    KMSection *currentSection = [self.dataSource accordionTableView:self sectionForRowAtIndex:section];

    currentSection.headerView = sectionHeaderView;

    sectionHeaderView.titleLabel.text = currentSection.title;
    [sectionHeaderView setSection:section];
    [sectionHeaderView setDelegate:self];
    [sectionHeaderView setHeaderDisclosureButtonImage:self.headerDisclosureButtonImage];
    [sectionHeaderView setHeaderFont:self.headerFont];
    [sectionHeaderView setHeaderTitleColor:self.headerTitleColor];
    [sectionHeaderView setHeaderColor:self.headerColor];
    [sectionHeaderView setHeaderSeparatorColor:self.headerSeparatorColor];

    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KMSection *section = (self.sections)[indexPath.section];
    return section.view.frame.size.height;
}

#pragma mark - SectionHeaderViewDelegate

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    KMSection *section = (self.sections)[sectionOpened];

    section.open = YES;

    NSInteger countOfRowsToInsert = 1;
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }

    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];

    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {

        KMSection *previousOpenSection = (self.sections)[previousOpenSectionIndex];
        previousOpenSection.open = NO;
        [previousOpenSection.headerView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = 1;
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
    }

    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];

    self.openSectionIndex = sectionOpened;
}

- (void)sectionHeaderView:(KMSectionHeaderView *)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    KMSection *currentSection = (self.sections)[sectionClosed];

    currentSection.open = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];

    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationFade];
    }
    self.openSectionIndex = NSNotFound;
}

@end
