#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, weak) CALayer *sublayer;

@end


@implementation ViewController

- (void)awakeFromNib {
  [super awakeFromNib];

  self.view.layer = [CALayer layer];
  self.view.wantsLayer = YES;
  self.view.layer.backgroundColor = [[NSColor orangeColor] CGColor];

  CALayer *sublayer = [CALayer layer];
  sublayer.frame = CGRectMake(20, 20, 50, 50);
  sublayer.backgroundColor = [[NSColor yellowColor] CGColor];
  sublayer.masksToBounds = YES;
  sublayer.cornerRadius = 3;
  [self.view.layer addSublayer:sublayer];
  self.sublayer = sublayer;

  [NSTimer scheduledTimerWithTimeInterval:0.5 
                                   target:self 
                                 selector:@selector(timerAction:) 
                                 userInfo:nil 
                                  repeats:YES];
}


- (void)timerAction:(id)sender {
  NSLog(@"%s", __PRETTY_FUNCTION__);

  CGFloat (^randomPosition)(void) = ^CGFloat {
    return arc4random_uniform(500);
  };

  self.sublayer.position = CGPointMake(randomPosition(), randomPosition());
}

@end
