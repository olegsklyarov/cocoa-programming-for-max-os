//
//  AppDelegate.m
//  SpeakLine
//
//  Created by Oleg on 05.02.2026.
//

#import "AppDelegate.h"

@implementation AppDelegate

//@synthesize window = _window;
//@synthesize textField = _textField;
//@synthesize speakButton = _speakButton;
//@synthesize stopButton = _stopButton;

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"init");
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_speechSynth setDelegate:self];
    }
    return self;
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];

    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);

    [_stopButton setEnabled:YES];
    [_speakButton setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
        didFinishSpeaking:(BOOL)finishedSpeaking {
    NSLog(@"finishSpeaking = %d", finishedSpeaking);
    [_stopButton setEnabled:NO];
    [_speakButton setEnabled:YES];
}
@end
