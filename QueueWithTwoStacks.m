//
//  QueueWithTwoStacks.m
//  exercies
//
//  Created by NakCheonJung on 10/14/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "QueueWithTwoStacks.h"
#import "Stack.h"

@interface QueueWithTwoStacks ()
{
    Stack* _stackInBox;
    Stack* _stackOutBox;
}

@end

@implementation QueueWithTwoStacks

-(void)queue:(id)object
{
    if (!_stackInBox) {
        _stackInBox = [[Stack alloc] init];
    }
    if (!_stackOutBox) {
        _stackOutBox = [[Stack alloc] init];
    }
    [_stackInBox push:object];
}

-(id)dequeue
{
    if ([_stackOutBox isEmpty]) {
        while (![_stackInBox isEmpty]) {
            id object = [_stackInBox pop];
            [_stackOutBox push:object];
        }
    }
    
    id objectToReturn = [_stackOutBox pop];
    return objectToReturn;
}

-(BOOL)isEmpty
{
    if ([_stackInBox isEmpty] && [_stackOutBox isEmpty]) {
        return YES;
    }
    return NO;
}

@end
