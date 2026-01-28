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
    int firstNumber;
    int secondNumber;
}

- (void)prepareRandomNumbers;
- (void)setEntryDate:(NSDate *)date;
- (NSDate *)entryDate;
- (int)firstNumber;
- (int)secondNumber;
@end

NS_ASSUME_NONNULL_END
