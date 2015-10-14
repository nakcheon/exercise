//
//  Stack.m
//  exercies
//
//  Created by NakCheonJung on 10/14/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "Stack.h"

@interface Stack ()
{
    NSMutableArray* _arrayStack;
}

@end

@implementation Stack

-(void)push:(id)object
{
    if (!_arrayStack) {
        _arrayStack = [[NSMutableArray alloc] init];
    }
    [_arrayStack addObject:object];
}

-(id)pop
{
    if ([self isEmpty]) {
        return nil;
    }
    id object = [_arrayStack lastObject];
    [_arrayStack removeLastObject];
    return object;
}

-(BOOL)isEmpty
{
    if (_arrayStack.count == 0) {
        return YES;
    }
    return NO;
}

@end
