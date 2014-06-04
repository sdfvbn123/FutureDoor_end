//
//  LoginViewController.m
//  FutureDoor_end
//
//  Created by apple on 14-5-20.
//  Copyright (c) 2014年 17growing. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.navigationBar.hidden = YES;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background.png"]];
    [super viewDidLoad];
    [self createControl];
    
    
    
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}
-(void)createControl{
    self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(99.5, 46, 120.5, 119.5)];
    self.headImage.layer.cornerRadius = self.headImage.frame.size.width/2;
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.borderWidth = 4.0f;
    self.headImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.headImage.image = [UIImage imageNamed:@"headImage"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showImage:)];
    [self.headImage addGestureRecognizer:tap];
    self.headImage.userInteractionEnabled = YES;
    [self.view addSubview:self.headImage];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(130, self.headImage.frame.origin.y+self.headImage.frame.size.height+10, 50, 19.5)];
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.text = @"Aleny";
    [self.view addSubview:self.textField];
    
    self.sexImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.textField.frame.origin.x+self.textField.frame.size.width+10, self.headImage.frame.origin.y+self.headImage.frame.size.height+14, 14, 14)];
    self.sexImage.image = [UIImage imageNamed:@"girl"];
    [self.view addSubview:self.sexImage];
    
    UIImageView *myImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(53, self.textField.frame.origin.y+self.textField.frame.size.height+25, 48.5, 65)];
    myImageView1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1)];
    [myImageView1 addGestureRecognizer:tap1];
    myImageView1.image = [UIImage imageNamed:@"login_1"];
    [self.view addSubview:myImageView1];
    
    UIImageView *myImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(222, self.textField.frame.origin.y+self.textField.frame.size.height+25, 48.5, 66)];
    myImageView2.image = [UIImage imageNamed:@"login_2"];
    myImageView2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2)];
    [myImageView2 addGestureRecognizer:tap2];

    [self.view addSubview:myImageView2];
    
    UIImageView *myImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(130, self.textField.frame.origin.y+self.textField.frame.size.height+71, 60.5, 80.5)];
    myImageView3.image = [UIImage imageNamed:@"login_3"];
    [self.view addSubview:myImageView3];
    
    UIImageView *myImageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(53, myImageView1.frame.origin.y+myImageView1.frame.size.height+51.5, 48.5, 65)];
    myImageView4.image = [UIImage imageNamed:@"login_4"];
    [self.view addSubview:myImageView4];
    
    UIImageView *myImageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(222, myImageView2.frame.origin.y+myImageView2.frame.size.height+51.5, 48.5, 65)];
    myImageView5.image = [UIImage imageNamed:@"login_5"];
    [self.view addSubview:myImageView5];
    
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 35, 12.5, 22)];
    myImageView.image = [UIImage imageNamed:@"back1"];
    UITapGestureRecognizer *tapBack = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [myImageView addGestureRecognizer:tapBack];
    myImageView.userInteractionEnabled = YES;
    [self.view addSubview:myImageView];
    
    
}
#pragma mark -----------------轻拍改变头像--------------------
-(void)showImage:(UITapGestureRecognizer *)recognizer{
    
    NSLog(@"changeHeadImage!");
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
    
    
}
#pragma mark UIActionSheetDelegate-------------选择头像---------------
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    //拍照
    if (buttonIndex == 0){
        //点击拍照时，提示用户在“隐私->设置->照相”中检查是否开启拍照功能，仅提示一次
        if (self.isOK) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示！" message:@"如需拍照，请检查拍照功能是否开启，可在“隐私->设置->照相”中确定！" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            
        }
        self.isOK = NO;
        //检查是否有相机（图片选取器的isSourceTypeAvailable类方法）
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告！" message:@"对不起，您的设备不存在相机！" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            return;
        }
        //检查图片选取器是否存在，不存在创建并指定委托
        if (!self.imagePickerController) {
            self.imagePickerController = [[UIImagePickerController alloc] init];
            self.imagePickerController.delegate = self;
        }
        //设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie或者kUTTypeImage）
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
        //设定图片的来源为摄像头（图片选取器的sourceType属性UIImagePickerControllerSourceTypeCamera）
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        //设定图片选取器的摄像头捕获模式（图片选取器的cameraCaptureMode属性UIImagePickerControllerCameraCaptureModePhoto或者UIImagePickerControllerCameraCaptureModeVideo）
        self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        //设置使用前置还是后置摄像头，默认后置摄像头
        self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        //打开图片选取器视图控制器（模态视图方式）
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
        
    }else if (buttonIndex == 1){
        
        //检查是否有图片库（图片选取器的isSourceTypeAvailable类方法）
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告！" message:@"对不起，您的设备不存在图片库！" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }
        //检查图片选取器是否存在，不存在创建并指定委托
        if (!self.imagePickerController) {
            self.imagePickerController = [[UIImagePickerController alloc] init];
            self.imagePickerController.delegate = self;
        }
        //设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie和kUTTypeImage）
        self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
        //设定图片的来源为图片库（图片选取器的sourceType属性UIImagePickerControllerSourceTypePhotoLibrary）
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //打开图片选取器视图控制器（模态视图方式）
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    
}
-(void)back{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
    
    
}
-(void)tap1{
    ModifyViewController *modifyVC = [[ModifyViewController alloc] init];
    [self.navigationController pushViewController:modifyVC animated:YES];
}
-(void)tap2{
    AddressViewController *addressVC = [[AddressViewController alloc] init];
    [self.navigationController pushViewController:addressVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
