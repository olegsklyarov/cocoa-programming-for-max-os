//
//  LotteryEntry.h
//  lottery
//
//  Created by Oleg on 28.01.2026.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LotteryEntry : NSObject {
    NSDate *entryDate;
    NSInteger firstNumber;
    NSInteger secondNumber;
}

+ (NSInteger)randomIntegerBetweenMin:(NSInteger)min andMax:(NSInteger)max;
- (id)initWithEntryDate:(NSDate *)theDate;
- (void)setEntryDate:(NSDate *)date;
- (NSDate *)entryDate;
- (NSInteger)firstNumber;
- (NSInteger)secondNumber;
@end

NS_ASSUME_NONNULL_END
