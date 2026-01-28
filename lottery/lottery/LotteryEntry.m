//
//  LotteryEntry.m
//  lottery
//
//  Created by Oleg on 28.01.2026.
//

#import "LotteryEntry.h"

@implementation LotteryEntry

- (id)initWithEntryDate:(NSDate *)theDate {
    self = [super init];
    if (self) {
        entryDate = theDate;
        firstNumber = [LotteryEntry randomIntegerBetweenMin:0 andMax:100];
        secondNumber = [LotteryEntry randomIntegerBetweenMin:0 andMax:100];
    }
    return self;
}

+ (NSInteger)randomIntegerBetweenMin:(NSInteger)min andMax:(NSInteger)max {
    NSInteger range = max - min + 1;
    return min + random() % range;
}

- (void)setEntryDate:(NSDate *)date {
    entryDate = date;
}

- (NSDate *)entryDate {
    return entryDate;
}

- (NSInteger)firstNumber {
    return firstNumber;
}

- (NSInteger)secondNumber {
    return secondNumber;
}

- (NSString *)description {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterNoStyle];
    [df setDateStyle:NSDateFormatterMediumStyle];
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"%@ = %ld and %ld",
                                              [df stringFromDate:entryDate],
                                              firstNumber, secondNumber];
    return result;
}

@end
