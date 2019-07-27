#import <AppKit/AppKit.h>
#import "Sombre+Button.h"
@implementation Sombre(Button)

void DrawRoundedRect(NSRect rect, CGFloat x, CGFloat y)

{

    NSBezierPath* thePath = [NSBezierPath bezierPath];

 

    [thePath appendBezierPathWithRoundedRect:rect xRadius:x yRadius:y];

    [thePath stroke];
    [thePath fill];

}


- (void) drawButton: (NSRect) frame 
			     in: (NSCell*) cell 
			   view: (NSView*) view 
			  style: (int) style 
			  state: (GSThemeControlState) state {
	if (state == GSThemeNormalState)
		[[[NSColor controlBackgroundColor] shadowWithLevel: 0.1] set];
	else if (state == GSThemeHighlightedState || state == GSThemeHighlightedFirstResponderState) {
		[[[NSColor selectedControlColor] shadowWithLevel: 0.1] set];
		NSLog(@"Highlighted");
		}	
	else if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState) {
		[[[NSColor selectedControlColor] shadowWithLevel: 0.1] set];
		NSLog(@"Selected");
		}
	else 
		[[NSColor controlBackgroundColor] set];
		
	DrawRoundedRect(frame,3,3);
}

@end
