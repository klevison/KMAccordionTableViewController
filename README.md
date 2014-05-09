# KMAccordionTableViewController

Accordion UITableViewController component based on Apples's example.

<p align="center">
  <img align="center" src="http://recordit.co/juLug4JLzx.gif" alt="...">
</p>

## Under the Hood

* Uses ARC (Automatic Reference Counting)
* Supports customization
* Supports UIViews as sections (UIViews, UIViewController's view, UITableViews, UIWebView, MKMapView, etc...)

## How to install it?

[CocoaPods](http://cocoapods.org) is the easiest way to install KMAccordionTableViewController. Run ```pod search KMAccordionTableViewController``` to search for the latest version. Then, copy and paste the ```pod``` line to your ```Podfile```. Your podfile should look like:

```
platform :ios, '6.0'
pod 'KMAccordionTableViewController'
```

Finally, install it by running ```pod install```.

If you don't use CocoaPods, import the all files from "Classes" directory to your project.

## How to use it?

### Extends from KMAccordionTableViewController

```objective-c
#import "KMAccordionTableViewController.h"

@interface MyViewController : KMAccordionTableViewController

@end
```

### Implement KMAccordionTableViewControllerDataSource

```objective-c
- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView;

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index;
```

### Example

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

- (void)setupAppearence {
    [self setHeaderHeight:38];
    [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
    [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
    [self setHeaderFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
    [self setHeaderTitleColor:[UIColor greenColor]];
    [self setHeaderSeparatorColor:[UIColor colorWithRed:0.157 green:0.157 blue:0.157 alpha:1]];
    [self setHeaderColor:[UIColor colorWithRed:0.114 green:0.114 blue:0.114 alpha:1]];
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

## Contact

If you have any questions comments or suggestions, send me a message. If you find a bug, or want to submit a pull request, let me know.

* klevison@gmail.com
* http://twitter.com/klevison

## Copyright and license

Copyright (c) 2014 Klevison Matias (http://twitter.com/klevison). Code released under [the MIT license](LICENSE).
