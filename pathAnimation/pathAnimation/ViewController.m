//
//  ViewController.m
//  pathAnimation
//
//  Created by admin on 2017/12/4.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "DCPathButton.h"
@interface ViewController ()<DCPathButtonDelegate>
@property(nonatomic,strong)DCPathButton *xmgPathAnimationBtn;
@property(nonatomic,strong)UIView *pathview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *pathview=[[UIView alloc]init];
    self.pathview=pathview;
    pathview.backgroundColor=[UIColor grayColor];
    pathview.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:pathview];
    [self xmgpathanimation];
}
-(void)xmgpathanimation
{
//    _xmgPathAnimationBtn.hidden=NO;
    [self cinfigureDcPathBtn];
}
-(void)cinfigureDcPathBtn
{
    DCPathButton *dcPathbtn=[[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"] hilightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    self.xmgPathAnimationBtn=dcPathbtn;
    dcPathbtn.delegate=self;
    DCPathItemButton *item1=[[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    DCPathItemButton *item2=[[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
        DCPathItemButton *item3=[[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
        DCPathItemButton *item4=[[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    [dcPathbtn addPathItems:@[item1,item2,item3,item4]];
    [self.view addSubview:dcPathbtn];
    
}
#pragma DCPathButtonDelegate
-(void)itemButtonTappedAtIndex:(NSUInteger)index
{
    NSLog(@"you are at index:%ld",index);
}

@end
