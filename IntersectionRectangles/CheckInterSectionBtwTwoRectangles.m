//
//  CheckInterSectionBtwTwoRectangles.m
//  exercies
//
//  Created by NakCheonJung on 11/21/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import "CheckInterSectionBtwTwoRectangles.h"
#import <CoreGraphics/CoreGraphics.h>
#import "NCRectangle.h"

@implementation CheckInterSectionBtwTwoRectangles

-(int)solutionWithK:(int)K L:(int)L
                  M:(int)M N:(int)N
                  P:(int)P Q:(int)Q
                  R:(int)R S:(int)S
{
    // rectangle1
    NCRectangle* rect1 = [[NCRectangle alloc] init];
    {
        CGPoint lb1 = CGPointMake(K, L);
        CGPoint rb1 = CGPointMake(M, L);
        CGPoint lu1 = CGPointMake(K, N);
        CGPoint ru1 = CGPointMake(M, N);
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lb1;
            line.coord2 = rb1;
            rect1.line1 = line;
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = rb1;
            line.coord2 = ru1;
            rect1.line2 = line;
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = ru1;
            line.coord2 = lu1;
            rect1.line3 = line;
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lu1;
            line.coord2 = lb1;
            rect1.line4 = line;
        }
    }
    
    // rectangle2
    {
        CGPoint lb2 = CGPointMake(P, Q);
        CGPoint rb2 = CGPointMake(R, Q);
        CGPoint lu2 = CGPointMake(P, S);
        CGPoint ru2 = CGPointMake(R, S);
    }
    
    
    return 0;
}

//-(int)solutionWrongWithK:(int)K L:(int)L
//                       M:(int)M N:(int)N
//                       P:(int)P Q:(int)Q
//                       R:(int)R S:(int)S
//{
//    // check include second
//    if (K <= P && L <= Q && R <= M && S <= N) {
//        int areaOfFirstRect = (M - K) * (N - L);
//        return areaOfFirstRect;
//    }
//    
//    // check include first
//    if (P <= K && Q <= L && M <= R && N <= S) {
//        int areaOfSecondRect = (R - P) * (S - Q);
//        return areaOfSecondRect;
//    }
//    
//    // check intersection
//    int areaOfIntersection = 0;
//    if (M > P && L < S && M < R && L > Q) { // right bottom
//        NSLog(@"\t>>> rb:1");
//        areaOfIntersection = (M-P) * (S-L);
//    }
//    else if (K < R && L < S && K > P && L > Q) { // left bottom
//        NSLog(@"\t>>> lb:2");
//        areaOfIntersection = (R-K) * (S-L);
//    }
//    else if (M > P && N > Q && R > M && S > N) { // right upper
//        NSLog(@"\t>>> ru:3");
//        areaOfIntersection = (M-P) * (N-Q);
//    }
//    else if (K < R && N > Q && P < K && S > N) { // left upper
//        NSLog(@"\t>>> lu:4");
//        areaOfIntersection = (R-K) * (N-Q);
//    }
//    else {
//        NSLog(@"\t>>> error");
//    }
//    
//    
//    // calculate
//    int areaOfFirstRect = (M - K) * (N - L);
//    int areaOfSecondRect = (R - P) * (S - Q);
//    int total = areaOfFirstRect + areaOfSecondRect - areaOfIntersection;
//    
//    return total;
//}

@end
