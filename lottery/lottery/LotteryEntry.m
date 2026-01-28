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
        entryDate = [theDate retain];
        firstNumber = [LotteryEntry randomIntegerBetweenMin:0 andMax:100];
        secondNumber = [LotteryEntry randomIntegerBetweenMin:0 andMax:100];
    }
    return self;
}

- (id)init {
    return [self initWithEntryDate:[NSDate date]];
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
    [entryDate release];
    [super dealloc];
}

+ (NSInteger)randomIntegerBetweenMin:(NSInteger)min andMax:(NSInteger)max {
    NSInteger range = max - min + 1;
    return min + random() % range;
}

- (void)setEntryDate:(NSDate *)date {
    [date retain];
    [entryDate release];
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
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSString *result;
    result = [NSString stringWithFormat:@"%@ = %ld and %ld",
                                        [df stringFromDate:entryDate],
                                        firstNumber, secondNumber];
    [df release];
    return result;
}

@end
