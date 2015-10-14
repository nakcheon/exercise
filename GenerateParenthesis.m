//
//  GenerateParenthesis.m
//  exercies
//
//  Created by NakCheonJung on 9/21/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "GenerateParenthesis.h"

@interface GenerateParenthesis ()
{
    NSMutableArray* _arrayList;
    NSMutableArray* _arrayAssenbledStringResults;
}
@end

@implementation GenerateParenthesis

-(void)initialize
{
    if (!_arrayList) {
        _arrayList = [[NSMutableArray alloc] init];
    }
    if (!_arrayAssenbledStringResults) {
        _arrayAssenbledStringResults = [[NSMutableArray alloc] init];
    }
}

-(NSArray*)startWithCount:(int)count
{
    [_arrayList removeAllObjects];
    [_arrayAssenbledStringResults removeAllObjects];
    
    [self addParenthesisWithLeftCount:count
                           rightCount:count
                                level:0];
    
    NSLog(@"%@", _arrayList);
    return _arrayList;
}

-(void)addParenthesisWithLeftCount:(int)leftCount
                        rightCount:(int)rightCount
                             level:(int)level
{
    if (leftCount < 0 || rightCount < 0) {
        return; // wrong case
    }
    
    // no parenthesis left
    if (leftCount == 0 && rightCount == 0) {
        NSString* strToAdd = @"";
        for (NSString* character in _arrayAssenbledStringResults) {
            strToAdd = [strToAdd stringByAppendingString:character];
        }
        [_arrayList addObject:strToAdd];
        return;
    }
    
    // add left parenthesis
    if (leftCount > 0) {
        //_arrayAssenbledStringResults[level] = [NSString stringWithFormat:@"(%d", level];
        _arrayAssenbledStringResults[level] = @"(";
        [self addParenthesisWithLeftCount:leftCount - 1
                               rightCount:rightCount
                                    level:level + 1];
    }
    
    // add right parenthesis
    if (rightCount > leftCount) {
        //_arrayAssenbledStringResults[level] = [NSString stringWithFormat:@")%d", level];
        _arrayAssenbledStringResults[level] = @")";
        [self addParenthesisWithLeftCount:leftCount
                               rightCount:rightCount - 1
                                    level:level + 1];
    }
}

@end
