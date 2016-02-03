//
//  ViewController.m
//  SCTableView
//
//  Created by Sahil Chaddha on 02/02/16.
//  Copyright © 2016 SahilC. All rights reserved.
//

#import "ViewController.h"
#import "SCTableViewHeader.h"

@interface ViewController ()
{
    SCTableViewHeader *tableHeader;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    tableHeader = [[SCTableViewHeader alloc]initTableView:_tbView withClass:CreateTripType withHeight:128 andMinHeight:64 withView:self.view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Sahil Chaddha";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = @"Hello";
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableHeader cellWillDisplay:cell withTbView:tableView atIndex:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [tableHeader handleScroll:scrollView];
}
@end
