//
//  main.m
//  lottery
//
//  Created by Oleg on 28.01.2026.
//

#import "LotteryEntry.h"
#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDate *now = [[NSDate alloc] init];
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *weekComponents = [[NSDateComponents alloc] init];
        srandom((unsigned)time(NULL));

        NSMutableArray *array;
        array = [[NSMutableArray alloc] init];

        int i;
        for (i = 0; i < 10; i++) {
            [weekComponents setWeekOfYear:i];

            NSDate *iWeelFromNow;
            iWeelFromNow = [cal dateByAddingComponents:weekComponents
                                                toDate:now
                                               options:0];

            LotteryEntry *newEntry = [[LotteryEntry alloc] init];
            [newEntry setEntryDate:iWeelFromNow];

            [array addObject:newEntry];
        }

        for (LotteryEntry *entryToPrint in array) {
            NSLog(@"%@", entryToPrint);
        }
    }
    return EXIT_SUCCESS;
}
