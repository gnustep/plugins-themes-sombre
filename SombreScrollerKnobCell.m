#include <AppKit/AppKit.h>
#include "SombreScrollerKnobCell.h"

@implementation SombreScrollerKnobCell


@synthesize horizontal;

- (void) drawWithFrame: (NSRect)cellFrame inView: (NSView*)controlView
{
  if (NSIsEmptyRect(cellFrame))
    return;

  NSColor * baseColor = [NSColor selectedKnobColor];
  cellFrame = NSInsetRect(cellFrame, 3, 3);
  CGFloat radius = 5;
  NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: cellFrame
                                                                       xRadius: radius
                                                                       yRadius: radius];
  [baseColor setFill];
  [roundedRectanglePath fill];
}
@end
