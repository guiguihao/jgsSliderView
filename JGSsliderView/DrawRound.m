//
//  DrawRound.m
//  JGSsliderView
//
//  Created by jiangguishun1 on 2017/7/25.
//  Copyright © 2017年 jiangguishun1. All rights reserved.
//

#import "DrawRound.h"

@interface DrawRound()
@property(nonatomic,strong)CAShapeLayer *roundlayer,*check;
@end

@implementation DrawRound

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //self.layer.masksToBounds = YES;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self roundlayer];
    [self drawcheck];
}



-(CAShapeLayer *)roundlayer
{
    if (_roundlayer) {
        [_roundlayer removeFromSuperlayer];
    }
    _roundlayer=[CAShapeLayer layer];
    _roundlayer.strokeColor=[[UIColor colorWithRed:1 green:0.000 blue:0.000 alpha:1.000] CGColor];
    _roundlayer.fillColor=[[UIColor clearColor] CGColor];
    _roundlayer.lineWidth=2;
    _roundlayer.lineCap=kCALineCapButt;
    [self.layer addSublayer:_roundlayer];
    
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0f, self.frame.size.height/2.0f) radius:self.frame.size.width/2.0f startAngle:0 endAngle:M_PI*2 clockwise:YES];
    _roundlayer.path=path.CGPath;
    _roundlayer.strokeEnd=1.0f;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration=1.0f;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fromValue=[NSNumber numberWithFloat:0.1];
    animation.toValue=[NSNumber numberWithFloat:1];
    animation.autoreverses=NO;
    animation.fillMode=kCAFillModeForwards;
    //animation.repeatCount=1;
    [_roundlayer addAnimation:animation forKey:@"strokeEndAnimation"];
    _roundlayer.strokeEnd=1.0f;
   
    return _roundlayer;
}

-(void)drawcheck
{
    if (self.check) {
        [self.check removeFromSuperlayer];
    }
    CAShapeLayer *check = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(5, 17)];
    [path addLineToPoint:CGPointMake(self.frame.size.width/2.0f,self.frame.size.height/2.0f+7)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-7, 7)];
    check.lineWidth = 2;
    check.strokeColor = [UIColor redColor].CGColor;
    check.fillColor = [UIColor clearColor].CGColor;
    check.lineCap = kCALineCapRound;
    check.lineJoin = kCALineJoinRound;
    check.path = path.CGPath;
    [self.layer addSublayer:check];
    
    check.strokeEnd=1.0f;
    self.check = check;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration=1.0f;
    //animation.beginTime = CACurrentMediaTime()+2;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fromValue=[NSNumber numberWithFloat:0.1];
    animation.toValue=[NSNumber numberWithFloat:1];
    animation.autoreverses=NO;
    animation.fillMode=kCAFillModeForwards;
    //animation.repeatCount=1;
    [check addAnimation:animation forKey:@""];
    check.strokeEnd=1.0f;
 
}

@end
