//
//  NCRectangle.m
//  exercies
//
//  Created by NakCheonJung on 11/22/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "NCRectangle.h"

@implementation NCRectangle

-(void)initialize
{
    _arrayLines = [[NSMutableArray alloc] init];
    [_arrayLines addObject:_line1];
    [_arrayLines addObject:_line2];
    [_arrayLines addObject:_line3];
    [_arrayLines addObject:_line4];
}
@end
