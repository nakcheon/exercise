//
//  NCRectangle.h
//  exercies
//
//  Created by NakCheonJung on 11/22/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCLine.h"

@interface NCRectangle : NSObject
@property (nonatomic, retain) NCLine* line1;
@property (nonatomic, retain) NCLine* line2;
@property (nonatomic, retain) NCLine* line3;
@property (nonatomic, retain) NCLine* line4;
@property (nonatomic, retain) NSMutableArray* arrayLines;

-(void)initialize;
@end
