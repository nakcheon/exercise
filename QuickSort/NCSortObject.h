//
//  NCSortObject.h
//  DealOptionSort
//
//  Created by NakCheonJung on 9/13/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCSortObjectProtocol.h"

@interface NCSortObject : NSObject <NCSortObjectProtocolDelegate>
@property (nonatomic, assign) int objectValue;
@end
