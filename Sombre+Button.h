#import "Sombre.h"
@interface Sombre(Button)
- (void) drawButton: (NSRect) frame 
		 in: (NSCell*) cell 
	       view: (NSView*) view 
	      style: (int) style 
              state: (GSThemeControlState) state;

- (NSColor*) buttonColorInCell:(NSCell*) cell
                      forState: (GSThemeControlState) state;
@end
