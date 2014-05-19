#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, weak) CALayer *sublayer;

@end


@implementation ViewController

- (void)awakeFromNib {
  [super awakeFromNib];

  self.view.layer = [CALayer layer];
  self.view.wantsLayer = YES;
  self.view.layer.backgroundColor = [[NSColor whiteColor] CGColor];

  CALayer *sublayer = [CALayer layer];
  sublayer.frame = CGRectMake(20, 20, 50, 50);
  sublayer.backgroundColor = [[NSColor orangeColor] CGColor];
  sublayer.masksToBounds = YES;
  sublayer.cornerRadius = 5;
  [self.view.layer addSublayer:sublayer];
  self.sublayer = sublayer;

  [NSTimer scheduledTimerWithTimeInterval:0.5 
                                   target:self 
                                 selector:@selector(timerAction:) 
                                 userInfo:nil 
                                  repeats:YES];
}


- (void)timerAction:(id)sender {
  CGFloat (^randomPosition)(BOOL) = ^CGFloat(BOOL isWidth) {
    CGFloat margin = 50.0;
    CGFloat base = isWidth ? NSWidth(self.view.layer.frame) :
                             NSHeight(self.view.layer.frame);
    NSInteger random = 
      arc4random_uniform(base - 2*margin) + margin;
    
    return (CGFloat) random;
  };

  self.sublayer.position = CGPointMake(randomPosition(YES), 
                                       randomPosition(NO));

  NSLog(@"%s, %@", __PRETTY_FUNCTION__,
                   NSStringFromPoint(self.sublayer.frame.origin));
}

@end
