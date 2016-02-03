//
//  SCTableViewHeader.m
//  SCTableView
//
//  Created by Sahil Chaddha on 02/02/16.
//  Copyright © 2016 SahilC. All rights reserved.
//

#import "SCTableViewHeader.h"
#import "SCTableViewHeaderView.h"

@implementation SCTableViewHeader
- (id)initTableView:(UITableView*)tbView withClass:(HeaderType)type withHeight:(CGFloat)height andMinHeight:(CGFloat)minHeight withView:(UIView*)parentView
{
    self = [super init];
    _minHeight = minHeight;
    _totalHeight = height;
    _parentView = parentView;
    _hType = type;
    tbView.tableHeaderView  = [[UIView alloc]       initWithFrame: CGRectMake(0.0, 0.0, _parentView.frame.size.width, _totalHeight - _minHeight)];
    tbView.showsVerticalScrollIndicator = NO;
    [tbView setBackgroundColor:[UIColor clearColor]];

    if(_hType == CreateTripType)
    _headerView = [[SCTableViewHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _totalHeight)];
    
    
    //TO pass header delegate to main class
//    self.delegate = _headerView.delegate;
    
    [_parentView insertSubview:_headerView
                belowSubview: tbView];
    return self;
}
- (void)handleScroll:(UIScrollView*)scView
{
    CGFloat scrollOffset        = scView.contentOffset.y;
    CGRect headerFrame   = _headerView.frame;
    
    if (scrollOffset < 0) {
        headerFrame.size.height = _totalHeight + fabs(scrollOffset);
    } else {
        headerFrame.size.height = _totalHeight - fabs(scrollOffset);
        
        if(headerFrame.size.height <= _minHeight)
            headerFrame.size.height = _minHeight;
    }
    _headerView.frame = headerFrame;

}
- (void)cellWillDisplay:(UITableViewCell*)cell withTbView:(UITableView*)tView atIndex:(NSIndexPath*)index
{
    NSInteger totalRow = [tView numberOfRowsInSection:index.section];
    
    if(index.row == totalRow -1){
        float cellsHeight = totalRow * cell.frame.size.height;
        float tableHeight = (tView.frame.size.height - tView.tableHeaderView.frame.size.height);
        if((cellsHeight - tView.frame.origin.y)  < tableHeight){
            int footerHeight = tableHeight - cellsHeight;
            tView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, footerHeight)];
            [tView.tableFooterView setBackgroundColor:[UIColor whiteColor]];
        }
    }
}
@end
