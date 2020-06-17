//
//  DetailViewController.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "DetailViewController.h"
#import "ImageStore.h"
#import "BNRItem.h"

@interface DetailViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dataLebel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation DetailViewController

#pragma mark - View life cycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    BNRItem *item = self.item;
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d",item.valueInDollars];
    //将NSDate对象转化为简单的日期字符串
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dataLebel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    //imageview展示
    NSString *itemKey = self.item.itemKey;
    UIImage *imageToShow = [[ImageStore shareStored]imageForKey:itemKey];
    self.imageView.image = imageToShow;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //取消当前的第一响应对象
    [self.view endEditing:YES];
    //结束时，将修改写入数据
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

#pragma mark - Action

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //如果支持拍照则拍照，否则选择相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    //对象imagePicker的委托设置为自身
    imagePicker.delegate = self;

    //模态显示imagePicker
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    //通过info字典获取选取的照片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //将图像和key传入imageStore对象
    [[ImageStore shareStored]setImage:image forKey:self.item.itemKey];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - setter and getter

//重写set方法，在设置item属性时设置nav标题
- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

@end
