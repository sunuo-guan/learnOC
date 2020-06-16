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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[GZHItemStore sharedStore]allItems]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    NSArray *items = [[GZHItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
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
