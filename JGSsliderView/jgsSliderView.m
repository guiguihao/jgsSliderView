//
//  jgsSliderView.m
//  JGSsliderView
//
//  Created by jiangguishun1 on 2017/7/24.
//  Copyright © 2017年 jiangguishun1. All rights reserved.
//

#import "jgsSliderView.h"
#import "DrawRound.h"
static CGFloat foregroundWidth = 0;
@interface jgsSliderView()

@property(nonatomic,strong)CAShapeLayer *foregroundLayer,*linelayer;
@property(nonatomic,strong)DrawRound *round;
@property(nonatomic,strong)CAGradientLayer * gradientlayer1,*gradientlayer2;
@end

@implementation jgsSliderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 16.0f;
        self.layer.masksToBounds = YES;
        [self.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.layer setBorderWidth:0.5f];
        
        _gradientlayer1 = [CAGradientLayer layer];
        _gradientlayer1.frame = self.bounds;
        [self.layer addSublayer:_gradientlayer1];
        
        _gradientlayer1.startPoint = CGPointMake(0, 0.5);
        _gradientlayer1.endPoint = CGPointMake(1, 0.5);
        
        NSArray *ary = [NSArray arrayWithObjects:(id)[[UIColor groupTableViewBackgroundColor] CGColor],(id)[[UIColor groupTableViewBackgroundColor] CGColor], nil];
        _gradientlayer1.colors = ary;
        [self.layer addSublayer:_gradientlayer1];
        
        [self initRound];
    
    }
    return self;
}

-(void)initRound
{
   _round = [[DrawRound alloc]initWithFrame:CGRectMake(self.frame.size.width-33,2, 30, 30)];
   [self addSubview:_round];
}

- (void)drawRect:(CGRect)rect {
    
    [self myForegroundLayer];
}

-(void )myForegroundLayer
{
//    if (!_foregroundLayer) {
//        _foregroundLayer = [CAShapeLayer layer];
//        _foregroundLayer.backgroundColor = [UIColor greenColor].CGColor ;
//        [self.layer addSublayer:_foregroundLayer];
//    }
    _gradientlayer1.frame =CGRectMake(0, 0, foregroundWidth, CGRectGetHeight(self.frame));
}




-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    foregroundWidth = point.x;
    NSLog(@"pointX:%f,pointY:%f",point.x,point.y);
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"end==pointX:%f,pointY:%f",point.x,point.y);
    [_round setNeedsDisplay];
}

@end
