#import <AppKit/AppKit.h>
#import <Foundation/NSUserDefaults.h>
#import <GNUstepGUI/GSTheme.h>

@interface Sombre: GSTheme
{  
  NSUserDefaults *defaults;
}
- (void) drawPathButton: (NSBezierPath*) path
                     in: (NSCell*)cell
                  state: (GSThemeControlState) state;
@end

