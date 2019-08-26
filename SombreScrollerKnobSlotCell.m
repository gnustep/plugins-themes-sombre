
#include <AppKit/AppKit.h>
#include "SombreScrollerKnobSlotCell.h"

@implementation SombreScrollerKnobSlotCell


@synthesize horizontal;

- (void) drawWithFrame: (NSRect)cellFrame inView: (NSView*)controlView
{
  if (NSIsEmptyRect(cellFrame))
    {
      return;
    }
  NSColor * baseColor = [NSColor scrollBarColor];
  NSColor *shadowColor = [baseColor shadowWithLevel: 0.15];
  NSGradient* gr = [[NSGradient alloc] initWithColorsAndLocations:
      shadowColor, 1.0,
      baseColor, 0.9,
      baseColor, 0.5,
      baseColor, 0.3,
      shadowColor, 0.1,
      nil];
  int a = 0;
  if(horizontal)
    a = 90;
  [gr drawInRect: cellFrame angle: a];
  [shadowColor set];
  NSFrameRect(cellFrame);
}
@end
