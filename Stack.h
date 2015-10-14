//
//  Stack.h
//  exercies
//
//  Created by NakCheonJung on 10/14/15.
//  Copyright © 2015 ncjung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
-(void)push:(id)object;
-(id)pop;
-(BOOL)isEmpty;
@end
