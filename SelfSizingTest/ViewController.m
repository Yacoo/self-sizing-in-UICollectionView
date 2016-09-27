//
//  ViewController.m
//  SelfSizingTest
//
//  Created by 亚珂王 on 16/7/25.
//  Copyright © 2016年 亚珂王. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import <Masonry.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, weak) UITableView * tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.rowHeight =UITableViewAutomaticDimension;
    tableview.estimatedRowHeight = 100;
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    tableview.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:tableview];
    self.tableview = tableview;
    
    [self setUpData];
}

- (void)setUpData
{
    self.dataSource = [NSMutableArray arrayWithObjects:@"A puma at large",@"Pumas are large, ",@"cat like animals which are found in America. When reports came into London",@" Zoo that a wild puma had been spotted forty five miles south of London, they were not taken seriously.",@"However, as the evidence began to accumulate, experts from the Zoo felt obliged to investigate, ",@"for the descriptions given by people who claimed to have seen the puma were extraordinarily similar.",@"It immediately run ",@"away when she saw it, and experts ",@"confirmed that a puma will not attack a human being unless it is cornered. The search proved difficult, for the puma was often observed at one place in the morning and at another place twenty miles away in the evening.",@"Wherever it went, it left behind it a trail of dead deer and small animals like rabbits Paw prints were seen ",@"in a number of places and puma fur was found clinging ",@"to bushes.",@"A puma at largeA puma at largeA puma at largeA puma at largeA puma at large",@"Pumas are large, ",@"cat like animals which are found in America. When reports came into Londoncat like animals which are found in America. When reports came into Londoncat like animals which are found in America. When reports came into London",@" Zoo that a wild puma had been spotted forty five miles south of London, they were not taken seriously.",@"However, as the evidence began to accumulate, experts from the Zoo felt obliged to investigate, ",@"for the descriptions given by people who claimed to have seen the puma were extraordinarily similar.",@"It immediately run ",@"away when she saw it, and experts ",@"confirmed that a puma will not attack a human being unless it is cornered. The search proved difficult, for the puma was often observed at one place in the morning and at another place twenty miles away in the evening.confirmed that a puma will not attack a human being unless it is cornered. The search proved difficult, for the puma was often observed at one place in the morning and at another place twenty miles away in the evening.",@"Wherever it went, it left behind it a trail of dead deer and small animals like rabbits Paw prints were seen ",@"in a number of places and puma fur was found clinging ",@"to bushes.",@"A puma at large",@"Pumas are large, ",@"cat like animals which are found in America. When reports came into London",@" Zoo that a wild puma had been spotted forty five miles south of London, they were not taken seriously.",@"However, as the evidence began to accumulate, experts from the Zoo felt obliged to investigate, ",@"for the descriptions given by people who claimed to have seen the puma were extraordinarily similar.",@"It immediately run ",@"away when she saw it, and experts ",@"confirmed that a puma will not attack a human being unless it is cornered. The search proved difficult, for the puma was often observed at one place in the morning and at another place twenty miles away in the evening.",@"Wherever it went, it left behind it a trail of dead deer and small animals like rabbits Paw prints were seen ",@"in a number of places and puma fur was found clinging ",@"to bushes.", nil];
}

- (void)reloadData
{
    [self.tableview reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString * content = self.dataSource[indexPath.row];
    cell.contentLabel.text = content;
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
