//
//  Exercise.m
//  exercies
//
//  Created by JungNakCheon on 9/1/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

-(void)interSectExercise
{
    NSArray* a = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    NSArray* b = [NSArray arrayWithObjects:@"4", @"5", @"6", @"7", nil];
    
    NSMutableSet* setA = [NSMutableSet setWithArray:a];
    NSSet* setB = [NSSet setWithArray:b];
    [setA intersectSet:setB];
    NSLog(@"result intersect: %@", setA.allObjects);
    [setA unionSet:setB];
    NSLog(@"result union: %@", setA.allObjects);
    
}

-(void)unionExercise
{
    NSArray* a = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    NSArray* b = [NSArray arrayWithObjects:@"4", @"5", @"6", @"7", nil];
    
    NSMutableSet* setA = [NSMutableSet setWithArray:a];
    NSSet* setB = [NSSet setWithArray:b];
    [setA unionSet:setB];
    NSLog(@"result: %@", setA.allObjects);
}

-(void)reverseString
{
    NSString* strString = @"abcdefghijklmn";
    NSMutableString* strReversedString = [NSMutableString stringWithString:@""];
    for (int index = (int)strString.length-1; index >= 0; --index) {
        NSRange sutStrRange = NSMakeRange(index, 1);
        [strReversedString appendString:[strString substringWithRange:sutStrRange]];
    }
    NSLog(@"%@", strReversedString);
}

@end
