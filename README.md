KMAccordionTableViewController
==============================

Accordion UITableViewController component based on Apples's example.


## How to use it?

### Extends from KMAccordionTableViewController

```objective-c
#import "KMAccordionTableViewController.h"

@interface MyViewController : KMAccordionTableViewController

@end
```

### Implement from KMAccordionTableViewControllerDataSource

```objective-c
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

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = self;

    self.sections = [self getSectionArray];
    [self setupAppearence];

}

- (NSArray *)getSectionArray {
    UIView *viewOfSection1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    viewOfSection1.backgroundColor = [UIColor grayColor];
    KMSection *section1 = [[KMSection alloc] init];
    section1.view = viewOfSection1;
    section1.title = @"My First Section";

    UIView *viewOfSection2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    viewOfSection2.backgroundColor = [UIColor redColor];
    KMSection *section2 = [[KMSection alloc] init];
    section2.view = viewOfSection2;
    section2.title = @"Sec. Section";

    UIView *viewOfSection3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 700)];
    viewOfSection3.backgroundColor = [UIColor greenColor];
    KMSection *section3 = [[KMSection alloc] init];
    section3.view = viewOfSection3;
    section3.title = @"thirddddd";

    return @[section1, section2, section3];
}
```
## And you have this resuld


