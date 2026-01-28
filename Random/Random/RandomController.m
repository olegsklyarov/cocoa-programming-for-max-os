//
//  RandomController.m
//  Random
//
//  Created by Oleg on 22.01.2026.
//

#import "RandomController.h"

@implementation RandomController

- (IBAction)generate:(id)sender
{
    int generated = (int)(random() % 100) + 1;
    NSLog(@"generated = %d", generated);
    [textField setIntValue:generated];
}

- (IBAction)seed:(id)sender
{
    srandom((unsigned)time(NULL));
    [textField setStringValue:@"Generator seeded"];
}

- (void)awakeFromNib
{
    NSDate *now;
    now = [NSDate date];
    [textField setObjectValue:now];
}

@end
