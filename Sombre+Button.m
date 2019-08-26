#import <AppKit/AppKit.h>
#import "Sombre+Button.h"

@implementation Sombre(Button)

void DrawRoundedRect(NSRect rect, CGFloat x, CGFloat y, NSColor *fillColor)

{
    NSBezierPath* thePath = [NSBezierPath bezierPath];
    [thePath appendBezierPathWithRoundedRect:rect xRadius:x yRadius:y]; 
    [thePath setLineWidth: 3.0];  
    [thePath stroke];
    NSGradient * aGradient = [[NSGradient alloc] initWithColorsAndLocations:
		    [fillColor highlightWithLevel: 0.3], (CGFloat) 0,
		    [fillColor shadowWithLevel: 0.01], (CGFloat) 0.08,				 
		    [fillColor shadowWithLevel: 0.1], (CGFloat) 0.92,
		    [fillColor shadowWithLevel: 0.45], (CGFloat) 1.0,
					    nil];
    [aGradient drawInBezierPath: thePath
			  angle: 90.0];
    [aGradient release];

}


- (void) drawButton: (NSRect) frame 
		 in: (NSCell*) cell 
	       view: (NSView*) view 
	      style: (int) style 
	      state: (GSThemeControlState) state {
  NSColor *fillColor = [self buttonColorInCell: cell
				      forState: state];			
  DrawRoundedRect(frame,3,3, fillColor);
}


- (NSColor*) buttonColorInCell:(NSCell*) cell
                      forState: (GSThemeControlState) state
{

  NSColor *fillColor = [NSColor controlBackgroundColor];
  //NSString	*name = [super nameForElement: cell];
  if (state == GSThemeNormalState)
    {
      [[[NSColor controlColor] shadowWithLevel: 0.45] setStroke];
    }
  else if (state == GSThemeHighlightedState)
    {
      fillColor = [NSColor controlHighlightColor];
      [[[NSColor controlHighlightColor] shadowWithLevel: 0.45] setStroke];
    }
  else if (state == GSThemeHighlightedFirstResponderState)
    {
      fillColor = [NSColor selectedControlColor];  
      [[[NSColor alternateSelectedControlColor] shadowWithLevel: 0.01] setStroke];   
    }
  else if (state == GSThemeSelectedState || state == GSThemeSelectedFirstResponderState)
    {    
      fillColor = [NSColor selectedControlColor];  
      [[[NSColor selectedControlColor] shadowWithLevel: 0.45] setStroke];
    }
  else
    {
      fillColor = [NSColor controlColor];
      [[[NSColor controlColor] shadowWithLevel: 0.4] setStroke];
    }
return fillColor;
}

- (void) drawPathButton: (NSBezierPath*) path
                     in: (NSCell*)cell
			            state: (GSThemeControlState) state
{
  NSColor  *backgroundColor = [self buttonColorInCell: cell forState: state];
  NSColor  *strokeColorButton = [backgroundColor shadowWithLevel: 0.45];
  /*NSGradient  *buttonBackgroundGradient = [self _bezelGradientWithColor: backgroundColor];
    [buttonBackgroundGradient drawInBezierPath: path angle: -90];*/
  [strokeColorButton setStroke];
  [path setLineWidth: 1];
  [path stroke];
}

@end
