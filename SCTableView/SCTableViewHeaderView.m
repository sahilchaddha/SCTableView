//
//  SCTableView.m
//  SCTableParallax
//
//  Created by Sahil Chaddha on 02/02/16.
//  Copyright © 2016 SahilC. All rights reserved.
//

#import "SCTableViewHeaderView.h"

@implementation SCTableViewHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UINib *nib = [UINib nibWithNibName:@"SCTableViewHeaderView" bundle:nil];
        self = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
    }
    [self setFrame:frame];
    return self;
}

@end
