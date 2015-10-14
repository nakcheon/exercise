//
//  MakePermutation.m
//  exercies
//
//  Created by NakCheonJung on 10/14/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "MakePermutation.h"

@interface MakePermutation ()
{
    NSMutableArray* _arrayUsingFlags;
    NSMutableArray* _arrayPermutations;
    NSString* _strBuffer;
    NSArray* _arrayInputCharacters;
}
-(void)privateRunPermutation:(int)level;
-(BOOL)privateCheckValidation:(NSString*)bufferToAdd;

@end

@implementation MakePermutation

-(NSArray*)makePermutation:(NSArray*)inputCharacters
{
    // init
    _arrayInputCharacters = [NSArray arrayWithArray:inputCharacters];
    _arrayUsingFlags = [[NSMutableArray alloc] init];
    for (int i = 0; i < inputCharacters.count; ++i) {
        [_arrayUsingFlags addObject:[NSNumber numberWithBool:NO]];
    }
    _arrayPermutations = [[NSMutableArray alloc] init];
    _strBuffer = @"";
    
    // start
    [self privateRunPermutation:0];
    
    return _arrayPermutations;
}

-(void)privateRunPermutation:(int)level;
{
    if (level >= _arrayInputCharacters.count) {
        if ([self privateCheckValidation:_strBuffer]) {
            [_arrayPermutations addObject:_strBuffer];
        }
        return;
    }
    for (int i = 0; i < _arrayInputCharacters.count; ++i) {
        if ([_arrayUsingFlags[i] boolValue] == YES) {
            continue;
        }
        // add character
        _strBuffer = [_strBuffer stringByAppendingString:_arrayInputCharacters[i]];
        
        // set using
        _arrayUsingFlags[i] = [NSNumber numberWithBool:YES];
        
        // add level
        [self privateRunPermutation:(int)_strBuffer.length];
        
        // set not using
        _arrayUsingFlags[i] = [NSNumber numberWithBool:NO];
        
        // subtract character
        _strBuffer = [_strBuffer substringWithRange:NSMakeRange(0, _strBuffer.length-1)];
    }
}

-(BOOL)privateCheckValidation:(NSString*)bufferToAdd
{
    // check duplicated item
    if ([_arrayPermutations containsObject:bufferToAdd]) {
        return NO;
    }
    return YES;
}

@end
