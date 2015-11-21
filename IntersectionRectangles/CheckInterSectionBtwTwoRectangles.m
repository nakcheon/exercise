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

@interface CheckInterSectionBtwTwoRectangles ()
{
    NCRectangle* _rect1;
    NCRectangle* _rect2;
}
@end

@interface CheckInterSectionBtwTwoRectangles (privateMethods)
-(void)privateFirstRectangleObjectK:(int)K L:(int)L
                                  M:(int)M N:(int)N;
-(void)privateSecondRectangleObjectP:(int)P Q:(int)Q
                                   R:(int)R S:(int)S;

-(double)privateCalculateAngleWithStartCoordinate:(CGPoint)coord1 coord2:(CGPoint)coord2;
-(CGPoint)privateCalculateOthogonalPointWithLine1:(NCLine*)line1
                                            line2:(NCLine*)line2;
@end

@implementation CheckInterSectionBtwTwoRectangles

-(int)solutionWithK:(int)K L:(int)L
                  M:(int)M N:(int)N
                  P:(int)P Q:(int)Q
                  R:(int)R S:(int)S
{
    // check include second
    if (K <= P && L <= Q && R <= M && S <= N) {
        int areaOfFirstRect = (M - K) * (N - L);
        return areaOfFirstRect;
    }

    // check include first
    if (P <= K && Q <= L && M <= R && N <= S) {
        int areaOfSecondRect = (R - P) * (S - Q);
        return areaOfSecondRect;
    }

    
    // craste objects to make calculation ease
    [self privateFirstRectangleObjectK:K L:L M:M N:N];
    [self privateSecondRectangleObjectP:P Q:Q R:R S:S];
    
    // calculate meeting point
    CGPoint point1 = CGPointZero;
    CGPoint point2 = CGPointZero;
    {
        int numberOfMeet = 0;
        for (NCLine* line1 in _rect1.arrayLines) {
            for (NCLine* line2 in _rect2.arrayLines) {
                CGPoint pointMeet = [self privateCalculateOthogonalPointWithLine1:line1
                                                                            line2:line2];
                if (pointMeet.x != INTMAX_MAX && pointMeet.y != INTMAX_MAX) {
                    if (numberOfMeet == 0) {
                        point1 = pointMeet;
                    }
                    else {
                        point2 = pointMeet;
                    }
                    ++numberOfMeet;
                    break;
                }
            }
        }
        // do not meet
        if (numberOfMeet == 0) {
            return 0;
        }
        // wrong data
        if (numberOfMeet != 2) {
            return -1;
        }
    }
    
    // calculate area
    int total = 0;
    {
        int areaOfFirstRect = (M - K) * (N - L);
        int areaOfSecondRect = (R - P) * (S - Q);
        int areaOfIntersection = abs((int)point1.x - (int)point2.x) * abs((int)point1.y - (int)point2.y);
        total = areaOfFirstRect + areaOfSecondRect - areaOfIntersection;
    }
    
    return total;
}

#pragma mark - private methods

-(void)privateFirstRectangleObjectK:(int)K L:(int)L
                                  M:(int)M N:(int)N
{
    _rect1 = [[NCRectangle alloc] init];
    {
        CGPoint lb1 = CGPointMake(K, L);
        CGPoint rb1 = CGPointMake(M, L);
        CGPoint lu1 = CGPointMake(K, N);
        CGPoint ru1 = CGPointMake(M, N);
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lb1;
            line.coord2 = rb1;
            _rect1.line1 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = rb1;
            line.coord2 = ru1;
            _rect1.line2 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = ru1;
            line.coord2 = lu1;
            _rect1.line3 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lu1;
            line.coord2 = lb1;
            _rect1.line4 = line;
            [line initialize];
        }
    }
    [_rect1 initialize];
}

-(void)privateSecondRectangleObjectP:(int)P Q:(int)Q
                                   R:(int)R S:(int)S
{
    _rect2 = [[NCRectangle alloc] init];
    {
        CGPoint lb2 = CGPointMake(P, Q);
        CGPoint rb2 = CGPointMake(R, Q);
        CGPoint lu2 = CGPointMake(P, S);
        CGPoint ru2 = CGPointMake(R, S);
        
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lb2;
            line.coord2 = rb2;
            _rect2.line1 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = rb2;
            line.coord2 = ru2;
            _rect2.line2 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = ru2;
            line.coord2 = lu2;
            _rect2.line3 = line;
            [line initialize];
        }
        {
            NCLine* line = [[NCLine alloc] init];
            line.coord1 = lu2;
            line.coord2 = lb2;
            _rect2.line4 = line;
            [line initialize];
        }
    }
    [_rect2 initialize];
}

-(double)privateCalculateAngleWithStartCoordinate:(CGPoint)coord1 coord2:(CGPoint)coord2
{
    double angle = atan((coord2.x - coord1.x)/(coord2.y - coord1.y))*180.0/M_PI;
    return angle;
}

-(CGPoint)privateCalculateOthogonalPointWithLine1:(NCLine*)line1
                                            line2:(NCLine*)line2
{
    double angle1 = 90.0 - [self privateCalculateAngleWithStartCoordinate:line1.coord1 coord2:line1.coord2];
    double angle2 = 90.0 - [self privateCalculateAngleWithStartCoordinate:line2.coord1 coord2:line2.coord2];
    if (angle1 == angle2) {
        return CGPointMake(INTMAX_MAX, INTMAX_MAX);
    }
    
    // calculate meeting point (that point can be meet by streaching line)
    double x = -1;
    double y = -1;
    if (angle1 == 0) {
        x = line2.coord2.x;
        y = line1.coord2.y;
    }
    else {
        x = line1.coord2.x;
        y = line2.coord2.y;
    }
    
    // compare the distance between start point and calculated point (if they meet outside of line, then return fail)
    if (angle1 == 0) { // calculate only x of line1
        if (x < line1.coord1.x || line1.coord2.x < x ) {
            return CGPointMake(INTMAX_MAX, INTMAX_MAX);
        }
        if (y < line2.coord1.y || line2.coord2.y < y) {
            return CGPointMake(INTMAX_MAX, INTMAX_MAX);
        }
    }
    else { // calculate only y of line1
        if (x < line2.coord1.x || line2.coord2.x < x ) {
            return CGPointMake(INTMAX_MAX, INTMAX_MAX);
        }
        if (y < line1.coord1.y || line1.coord2.y < y) {
            return CGPointMake(INTMAX_MAX, INTMAX_MAX);
        }
    }
    
    CGPoint retPoint = CGPointMake((int)x, (int)y);
    return retPoint;
}

@end
