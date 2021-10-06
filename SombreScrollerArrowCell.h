#import <AppKit/NSButtonCell.h>

typedef enum {
  SombreScrollerArrowLeft,
  SombreScrollerArrowRight,
  SombreScrollerArrowUp,
  SombreScrollerArrowDown
} SombreScrollerArrowType;

@interface SombreScrollerArrowCell : NSButtonCell
{
  SombreScrollerArrowType scroller_arrow_type;
}
-(void) setArrowType: (SombreScrollerArrowType) t;
@end

