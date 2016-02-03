//
//  SCTableViewHeader.h
//  SCTableView
//
//  Created by Sahil Chaddha on 02/02/16.
//  Copyright © 2016 SahilC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    ViewTripType,
    CreateTripType
}HeaderType;


@interface SCTableViewHeader : NSObject
- (id)initTableView:(UITableView*)tbView withClass:(HeaderType)type withHeight:(CGFloat)height andMinHeight:(CGFloat)minHeight withView:(UIView*)parentView;
- (void)handleScroll:(UIScrollView*)scView;
- (void)cellWillDisplay:(UITableViewCell*)cell withTbView:(UITableView*)tView atIndex:(NSIndexPath*)index;

@property (nonatomic) CGFloat totalHeight;
@property (nonatomic) CGFloat minHeight;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *parentView;
@property (nonatomic) HeaderType hType;
@property (strong, nonatomic) id delegate;
@end
