//
//  ViewController.m
//  OSS
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import <AliyunOSSiOS/OSSService.h>
NSString * const AccessKey = @"************";
NSString * const SecretKey = @"**********************";
//NSString * const endPoint = @"http://oss-cn-hangzhou.aliyuncs.com";
NSString * const multipartUploadKey = @"multipartUploadObject";
OSSClient *client;

@interface ViewController ()<UIImagePickerControllerDelegate>
@property(nonatomic,strong)NSData *imageData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)ossTest:(UIButton *)sender {
    [self chooseImage];
}
-(void)chooseImage
{
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.delegate=(id)self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing=YES;
    [self presentViewController:picker animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *avatar=info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    if(UIImagePNGRepresentation(avatar)){
        UIImage *imagenow=[self imageWithImageSimple:avatar scaledSize:CGSizeMake(200, 200)];
        self.imageData=UIImageJPEGRepresentation(imagenow, 0.1);
    }else{
        UIImage *imagenow=[self imageWithImageSimple:avatar scaledSize:CGSizeMake(200, 200)];
        self.imageData=UIImageJPEGRepresentation(imagenow, 0.1);
    }
    NSString *endpoint =@"http://oss-cn-hangzhou.aliyuncs.com";
    id<OSSCredentialProvider> credential=[[OSSStsTokenCredentialProvider alloc]initWithAccessKeyId:@"AccessKeyId" secretKeyId:@"AccessKeySecret" securityToken:@"SecurityToken"];
    client = [[OSSClient alloc]initWithEndpoint:endpoint credentialProvider:credential];
    OSSPutObjectRequest *put=[OSSPutObjectRequest new];
    
    put.bucketName=@"___";
    NSString *objectkeys=[NSString stringWithFormat:@"User/%@.jpg",[self getTimeNow]];
    put.objectKey=objectkeys;
    put.uploadingData=self.imageData;
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"%lld, %lld, %lld", bytesSent, totalBytesSent, totalBytesExpectedToSend);
    };
    OSSTask *putTask=[client putObject:put];
    [putTask continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        task=[client presignPublicURLWithBucketName:@"-----" withObjectKey:objectkeys];
         NSLog(@"objectKey: %@", put.objectKey);
        if(task.error){
             NSLog(@"upload object failed!");
        }else{
             NSLog(@"upload object success!");
        }
        return nil;
    }];
    
   
}
/**
 *  返回当前时间
 *
 *  @return ;
 
 */
- (NSString *)getTimeNow
{
    NSString* date;
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYYMMddhhmmssSSS"];
    date = [formatter stringFromDate:[NSDate date]];
    //取出个随机数
    int last = arc4random() % 10000;
    NSString *timeNow = [[NSString alloc] initWithFormat:@"%@-%i", date,last];
    NSLog(@"%@", timeNow);
    return timeNow;
}
-(void)initoss
{
    
    
}
-(UIImage *)imageWithImageSimple:(UIImage *)image scaledSize:(CGSize)newsize
{
    UIGraphicsBeginImageContext(newsize);
    [image drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    UIImage *newimage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newimage;
}
@end
