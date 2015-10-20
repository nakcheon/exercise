//
//  NCSortObject.m
//  DealOptionSort
//
//  Created by NakCheonJung on 9/13/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import "NCSortObject.h"

@implementation NCSortObject

-(void)deepCopy:(id<NCSortObjectProtocolDelegate>)rightObject
{
    self.objectValue = rightObject.objectValue;
}

@end
