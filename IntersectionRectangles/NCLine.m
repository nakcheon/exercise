//
//  NCLine.m
//  exercies
//
//  Created by NakCheonJung on 11/22/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "NCLine.h"

@implementation NCLine
-(void)initialize
{
    CGPoint temp = CGPointZero;
    BOOL bNeedToSwap = NO;
    if (_coord1.x > _coord2.x && _coord1.y == _coord2.y) {
        bNeedToSwap = YES;
    }
    if (_coord1.y > _coord2.y && _coord1.x == _coord2.x) {
        bNeedToSwap = YES;
    }
    if (bNeedToSwap) {
        temp = _coord2;
        _coord2 = _coord1;
        _coord1 = temp;
    }
}
@end
