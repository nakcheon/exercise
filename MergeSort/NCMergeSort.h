//
//  NCMergeSort.h
//  exercies
//
//  Created by NakCheonJung on 10/15/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCSortObjectProtocol.h"

@interface NCMergeSort : NSObject
@property (nonatomic, retain) NSMutableArray* arrarListOfElementsToSort;

-(void)insetValue:(id<NCSortObjectProtocolDelegate>)element;
-(void)startSort;
@end
