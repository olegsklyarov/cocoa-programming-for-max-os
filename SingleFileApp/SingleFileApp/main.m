//
//  main.m
//  SingleFileApp
//
//  Created by Oleg on 11.02.2026.
//

#import <Cocoa/Cocoa.h>

static NSMenu *BuildMainMenu(void) {
    // Create the main menu bar
    NSMenu *mainMenu = [[NSMenu alloc] initWithTitle:@""];

    // Application menu (the one with the app name)
    NSMenuItem *appMenuItem = [[NSMenuItem alloc] initWithTitle:@""
                                                         action:NULL
                                                  keyEquivalent:@""];
    [mainMenu addItem:appMenuItem];

    NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@""];

    // Quit item: Cmd+Q triggers [NSApp terminate:]
    NSMenuItem *quitItem =
        [[NSMenuItem alloc] initWithTitle:@"Quit"
                                   action:@selector(terminate:)
                            keyEquivalent:@"q"];

    NSMenuItem *fullScreen =
        [[NSMenuItem alloc] initWithTitle:@"Full size"
                                   action:@selector(toggleFullScreen:)
                            keyEquivalent:@"f"];

    // Command modifier is implied for key equivalents on macOS menus; no need
    // to set explicitly.
    [appMenu addItem:quitItem];
    [appMenu addItem:fullScreen];

    [appMenuItem setSubmenu:appMenu];

    return mainMenu;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];

        // Install a minimal main menu so Cmd+Q works.
        [app setMainMenu:BuildMainMenu()];

        NSRect frame = NSMakeRect(0, 0, 480, 270);
        NSUInteger styleMask = NSWindowStyleMaskTitled |
                               NSWindowStyleMaskClosable |
                               NSWindowStyleMaskResizable;

        NSWindow *window =
            [[NSWindow alloc] initWithContentRect:frame
                                        styleMask:styleMask
                                          backing:NSBackingStoreBuffered
                                            defer:NO];

        [window setTitle:@"App"];

        [window setTitlebarAppearsTransparent:YES];
        [window center];
        [window makeKeyAndOrderFront:nil];

        [app run];
    }
    return 0;
}
