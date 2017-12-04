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
@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *animationview;
@property(nonatomic,assign)NSInteger index;
@property (weak, nonatomic) IBOutlet UILabel *text;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.index=0;
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
    [self.animationview.layer addAnimation:anima forKey:@"opacirtyAnimation"];
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
    CAKeyframeAnimation *anima=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0=[NSValue valueWithCGPoint:CGPointMake(0, SCREEN_H/2-50)];
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W/3, SCREEN_H/2-50)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W/3, SCREEN_H/2+50)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W*2/3, SCREEN_H/2+50)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W*2/3, SCREEN_H/2-50)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W-30, SCREEN_H/2-50)];
    anima.values=[NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5 , nil];
    anima.duration=2;
    anima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anima.delegate=(id)self;
    [self.animationview.layer addAnimation:anima forKey:@"keyFrameAnimation"];
    
}
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
     NSLog(@"animationDidStop");
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
    anima.delegate=(id)self;
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
- (IBAction)shunxu:(UIButton *)sender {
    CFTimeInterval currenttime=CACurrentMediaTime();
    CABasicAnimation *anima1=[CABasicAnimation animationWithKeyPath:@"position"];
    anima1.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, SCREEN_H/2)];
    anima1.toValue=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W/2, SCREEN_H/2)];
    anima1.beginTime=currenttime;
    anima1.duration=2;
    anima1.fillMode=kCAFillModeForwards;
    anima1.removedOnCompletion=NO;
    [self.animationview.layer addAnimation:anima1 forKey:@"aa"];
    
    CABasicAnimation *anima2=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue=[NSNumber numberWithFloat:0.5f];
    anima2.toValue=[NSNumber numberWithFloat:2.5f];
    anima2.beginTime=currenttime+2;
    anima2.duration=2;
    anima2.fillMode=kCAFillModeForwards;
    anima2.removedOnCompletion=NO;
    [self.animationview.layer addAnimation:anima2 forKey:@"bb"];
    
    CABasicAnimation *anima3=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue=[NSNumber numberWithFloat:M_PI*3];
    anima3.beginTime=currenttime+4;
    anima3.duration=3;
    anima3.fillMode=kCAFillModeForwards;
    anima3.removedOnCompletion=NO;
    [self.animationview.layer addAnimation:anima3 forKey:@"cc"];
}
- (IBAction)tongbu:(UIButton *)sender {
    CAKeyframeAnimation *anima1=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0=[NSValue valueWithCGPoint:CGPointMake(0, SCREEN_H/2-50)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W/3, SCREEN_H/2-50)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W/3, SCREEN_H/2+50)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(SCREEN_W*2/3, SCREEN_H/2+50)];
    anima1.values=[NSArray arrayWithObjects:value0,value2,value3,value4, nil];
    
    CABasicAnimation *anima2=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue=[NSNumber numberWithFloat:0.5];
    anima2.toValue=[NSNumber numberWithFloat:2];
    
    CABasicAnimation *anima3=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue=[NSNumber numberWithFloat:M_PI *4];
    
    CAAnimationGroup *groupanimation=[CAAnimationGroup animation];
    groupanimation.animations=[NSArray arrayWithObjects:anima1,anima2,anima3, nil];
    groupanimation.duration=4;
    [self.animationview.layer addAnimation:groupanimation forKey:@"groupAnimation"];
}
- (IBAction)fade:(UIButton *)sender {
    [self changeview];
    CATransition *anima=[CATransition animation];
    anima.type=kCATransitionFade;
    anima.duration=1.5;
    [self.view.layer addAnimation:anima forKey:@"fadeAbunatuib"];
}
-(void)changeview
{
    NSArray *colors=[NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor], nil];
    NSArray *titles=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    self.animationview.backgroundColor=[colors objectAtIndex:self.index];
    self.text.text=[titles objectAtIndex:self.index];
    self.index++;
    
    

}
- (IBAction)movein:(UIButton *)sender {
}
- (IBAction)push:(UIButton *)sender {
}
- (IBAction)reveal:(UIButton *)sender {
}
- (IBAction)cube:(UIButton *)sender {
}


@end
