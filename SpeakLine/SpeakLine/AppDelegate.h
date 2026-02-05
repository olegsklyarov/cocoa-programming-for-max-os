//
//  AppDelegate.h
//  SpeakLine
//
//  Created by Oleg on 05.02.2026.
//

#import <AVFoundation/AVFoundation.h>
#import <Cocoa/Cocoa.h>

@interface AppDelegate
    : NSObject <NSApplicationDelegate, AVSpeechSynthesizerDelegate,
                NSTableViewDelegate> {
    NSArray *_voices;
    AVSpeechSynthesizer *_speechSynth;
}

@property(assign) IBOutlet NSWindow *window;
@property(weak) IBOutlet NSTextField *textField;
@property(weak) IBOutlet NSTableView *tableView;

- (IBAction)stopIt:(id)sender;
- (IBAction)sayIt:(id)sender;

@property(weak) IBOutlet NSButton *stopButton;
@property(weak) IBOutlet NSButton *speakButton;

@end
