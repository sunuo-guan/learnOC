//
//  GZHItemsViewController.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHItemsViewController.h"
#import "BNRItem.h"
#import "GZHItemStore.h"
#import "ImageStore.h"
#import "ImageViewController.h"

@interface GZHItemsViewController() <UIPopoverControllerDelegate>

@property (nonatomic, strong)UIPopoverPresentationController *imagePopover;

@end

@implementation GZHItemsViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        //创建UIBarButtonItem对象，将其动作方法设置为addNewItem
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        //为UINaivationItem对象的rightbutton赋值，指向新创建的UIBarButtonItem对象
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 创建UINib对象，该对象代表包含了BNRItemCell的NIB文件
    UINib *nib = [UINib nibWithNibName:@"ItemCell" bundle:nil];
    // 通过UINib对象注册相应的NIB文件
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ItemCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[GZHItemStore sharedStore]allItems]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    NSArray *items = [[GZHItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    cell.nameLabel.text = item.itemName;
    cell.serialNumberLabel.text = item.serialNumber;
    cell.valueLabel.text = [NSString stringWithFormat:@"$%d",item.valueInDollars];
    cell.thumbnailView.image = item.thumbnail;
    cell.actionBlock = ^{
        NSLog(@"Going to show image for %@",item);
//        if ([[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//            NSString *itemKey = item.itemKey;
//            UIImage *img = [[ImageStore shareStored]imageForKey:itemKey];
//            if (!img) {
//                return;
//            }
//            CGRect rect = [self.viewconvertRect:cell.thumbnaillView.bounds fromView:cell.thumbnailView];
//            ImageViewController *ivc = [[ImageViewController alloc]init];
//            ivc.image = img;
//            self.imagePopover = [[UIPopoverController alloc]initWithContentViewController:ivc];
//            self.imagePopover.delegate = self;
//            self.imagePopover.PopoverContentSize = CGSizeMake(600, 600);
//            [self.imagePopover presentPopoverFromRect:rect
//                                               inView:self.view
//                             permittedArrowDirections:UIPopoverArrowDirectionAny
//                                             animated:YES];
//        }
    };
    return cell;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.imagePopover = nil;
}

- (IBAction)addNewItem:(id)sender
{
    BNRItem *newItem = [[GZHItemStore sharedStore]createItem];
    NSInteger lastRow = [[[GZHItemStore sharedStore]allItems]indexOfObject:newItem];
    //indexpath确认位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    //插入新行，行数必须与数据源的对象数一致
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[GZHItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        //删除数据和视图的行
        [[GZHItemStore sharedStore]removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[GZHItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

//选择某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController =[[DetailViewController alloc]init];
    //获取选取的行的item对象
    NSArray *items = [[GZHItemStore sharedStore]allItems];
    BNRItem *selectItem = items[indexPath.row];
    //将选中的item赋给detailviewcontroller
    detailViewController.item = selectItem;
    //压入栈
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

@end
