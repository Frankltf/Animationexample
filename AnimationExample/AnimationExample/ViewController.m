//
//  ViewController.m
//  AnimationExample
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}



- (IBAction)weiyi:(UIButton *)sender {
    //代码块方式调用
    self.animationview.frame=CGRectMake(0, SCREEN_H/2, 50, 50);
    [UIView animateWithDuration:2 animations:^{
        self.animationview.frame=CGRectMake(SCREEN_W, SCREEN_H/2, 50, 50);
    } completion:^(BOOL finished) {
        
    }];
    
    //core animation调用
//    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"position"];
//    anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, SCREEN_H/2)];
//    anima.toValue=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W, SCREEN_H/2)];
//    anima.duration=1;
//    [self.animationview.layer addAnimation:anima forKey:@"positionAnimation"];
    
}
- (IBAction)touming:(UIButton *)sender {
    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue=[NSNumber numberWithFloat:1];
    anima.toValue=[NSNumber numberWithFloat:0.2];
    anima.duration=1;
    [self.animationview.layer addAnimation:anima forKey:@"opacityAnimation"];
}
- (IBAction)xuanzhuan:(UIButton *)sender {
    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.toValue=[NSNumber numberWithFloat:M_PI];
    anima.duration=1;
    [self.animationview.layer addAnimation:anima forKey:@"rotateAnimation"];
}
- (IBAction)beijingse:(UIButton *)sender {
    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue=(id)[UIColor grayColor].CGColor;
    anima.duration=1;
    [self.animationview.layer addAnimation:anima forKey:@"backgroundAnimation"];
}
- (IBAction)suofang:(UIButton *)sender {
    CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima.toValue=[NSNumber numberWithFloat:2];
    anima.duration=2;
    [self.animationview.layer addAnimation:anima forKey:@"scaleAnimation"];
}
- (IBAction)guanjianzhen:(UIButton *)sender {
    
}
- (IBAction)lujing:(UIButton *)sender {
    UIView *view=[[UIView alloc]init];
    view.frame=CGRectMake(100,SCREEN_H/2-300, 200, 200);
    view.backgroundColor=[UIColor greenColor];
    [self.view addSubview:view];
    CAKeyframeAnimation *anima=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100,SCREEN_H/2-300, 200, 200)];
    anima.path=path.CGPath;
    anima.duration=2;
    [self.animationview.layer addAnimation:anima forKey:@"pathAnimation"];
}
- (IBAction)doudong:(UIButton *)sender {
    CAKeyframeAnimation *anima=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1=[NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2=[NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3=[NSNumber numberWithFloat:-M_PI/180*4];
    anima.values=@[value1,value2,value3];
    anima.repeatCount=MAXFLOAT;
    [self.animationview.layer addAnimation:anima forKey:@"shakeAnimation"];
}


@end
