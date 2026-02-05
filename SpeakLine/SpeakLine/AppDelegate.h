//
//  AppDelegate.h
//  SpeakLine
//
//  Created by Oleg on 05.02.2026.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSSpeechSynthesizer *_speechSynth;
}

@property(assign) IBOutlet NSWindow *window;
@property(weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;

@end
