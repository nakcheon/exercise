//
//  findingSiblings.m
//  exercies
//
//  Created by JungNakCheon on 9/1/15.
//  Copyright (c) 2015 ncjung. All rights reserved.
//

#import "findingSiblings.h"

typedef NS_ENUM(NSInteger, FindType) {
    FindTypeMax = 0,
    FindTypeMin = 1,
};

@interface findingSiblings (privateMethods)
-(int)privateStartFindSiblings:(int)inputNumer;
-(NSString*)privateFindLargest:(NSArray*)arrayCharacterList;
-(NSString*)privateFindSmallest:(NSArray*)arrayCharacterList;
@end

@implementation findingSiblings

#pragma mark - operations

-(void)findSiblings
{
    int resultMax = [self privateStartFindSiblings:101200
                                       findingType:FindTypeMax];
    NSLog(@"results max = %d", resultMax);
    
    int resultMin = [self privateStartFindSiblings:100120
                                       findingType:FindTypeMin];
    NSLog(@"results min = %d", resultMin);
}

#pragma mark - private methods

-(int)privateStartFindSiblings:(int)inputNumer findingType:(FindType)findingType
{
    // 스트링을 변환
    NSString* strNumber = [NSString stringWithFormat:@"%d", inputNumer];
    
    // 한자리 토큰으로 변환
    NSMutableArray* arrayToken = [[NSMutableArray alloc] init];
    for (int index = 0; index < strNumber.length; ++index) {
        NSRange range = NSMakeRange(index, 1);
        [arrayToken addObject:[strNumber substringWithRange:range]];
    }
    // 각종 형제 숫자들 생성
    NSMutableArray* arrayResult = [[NSMutableArray alloc] init];
    while (arrayToken.count) {
        NSString* largest = nil;
        if (findingType == FindTypeMax) {
            largest = [self privateFindLargest:arrayToken];
        }
        else {
            largest = [self privateFindSmallest:arrayToken];
        }
        [arrayResult addObject:largest];
        
        // delete
        {
            NSString* tokenToDelete = nil;
            int index = 0;
            for (NSString* token in arrayToken) {
                if ([token isEqualToString:largest]) {
                    tokenToDelete = token;
                    break;
                }
                ++index;
            }
            if (tokenToDelete) {
                [arrayToken removeObjectAtIndex:index];
            }
        }
    }
    
    // 숫자로 만들기
    NSString* strResult = @"";
    for (NSString* strToken in arrayResult) {
        strResult = [strResult stringByAppendingString:strToken];
    }
    
    return strResult.intValue;
}


-(NSString*)privateFindLargest:(NSArray*)arrayCharacterList
{
    NSString* number = arrayCharacterList.firstObject;
    for (NSString* strNumber in arrayCharacterList) {
        if (strNumber.intValue > number.intValue) {
            number = strNumber;
        }
    }
    
    return number;
}

-(NSString*)privateFindSmallest:(NSArray*)arrayCharacterList
{
    NSString* number = arrayCharacterList.firstObject;
    for (NSString* strNumber in arrayCharacterList) {
        if (strNumber.intValue < number.intValue) {
            number = strNumber;
        }
    }
    
    return number;
}


@end
