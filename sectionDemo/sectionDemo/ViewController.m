//
//  ViewController.m
//  sectionDemo
//
//  Created by 裴文芹 on 2017/10/12.
//  Copyright © 2017年 cnwanweb. All rights reserved.
//

#import "ViewController.h"
//#import "ViewUtils.h"
#import "HeaderView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSMutableArray *showArray;//0表示收起，1表示展开
//@property (strong, nonatomic) NSMutableDictionary *dataDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"表格区头展示";
    [self registAllCells];
    [self setDefaultData];
}

#pragma mark----------------------
#pragma mark setupUI
- (void)registAllCells
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)setDefaultData
{
    NSArray *array1 = @[@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4"];
    NSArray *array2 = @[@"10",@"20",@"30",@"40",@"10",@"20",@"30",@"40"];
    NSArray *array3 = @[@"100",@"200",@"300",@"400",@"100",@"200",@"300",@"400"];
    NSArray *array4 = @[@"1000",@"2000",@"3000",@"4000",@"1000",@"2000",@"3000",@"4000"];
    [self.dataArray addObjectsFromArray:@[array1,array2,array3,array4]];
    self.showArray = [NSMutableArray arrayWithArray:@[@"0",@"0",@"0",@"0"]];
}


#pragma mark----------------------
#pragma mark UItableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataArray[section];
    NSString *str = self.showArray[section];
    return [str isEqualToString:@"0"] ? 0 : array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *view = [[NSBundle mainBundle] loadNibNamed:
                        @"HeaderView" owner:nil options:nil ].lastObject;
    [view updateViewWithTitle:[NSString stringWithFormat:@"第%ld个区",(long)section] showSection:[self.showArray[section] isEqualToString:@"1"]];
    [view setSelectSectionBlock:^{
        NSString *str = self.showArray[section];
        if ([str isEqualToString:@"0"]) {
            str = @"1";
        } else {
            str = @"0";
        }
        [self.showArray replaceObjectAtIndex:section withObject:str];
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    }];
    view.frame = CGRectMake(0, 0, ScreenWidth, 50);
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}


#pragma mark----------------------
#pragma mark CustomAction


#pragma mark----------------------
#pragma mark netWork


#pragma mark----------------------
#pragma mark setter && getter
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray  = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
