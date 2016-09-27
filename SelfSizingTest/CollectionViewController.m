//
//  CollectionViewController.m
//  SelfSizingTest
//
//  Created by 亚珂王 on 16/7/25.
//  Copyright © 2016年 亚珂王. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import <Masonry.h>

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, strong) NSMutableArray * titleArray;
@property (nonatomic, assign) NSInteger count;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    layout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.view.frame), 40);
    
    // iOS10中使用这个常量进行设置，是一个不断调整的size
//    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    layout.minimumLineSpacing = 20;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor cyanColor];
    
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CustomCollectionViewCell class])];
    
    [self.view addSubview:collectionView];
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.bottom.equalTo(self.view);
    }];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self setUpData];
}

- (void)setUpData
{
    self.titleArray = [NSMutableArray arrayWithObjects:@"A puma at large你好",@"Pumas are亲爱的 large, ",@"亲爱的中文我来了。我是会换行的中文，你呢",@" Zoo that a wild puma had been spotted forty five miles south of London, they were not taken seriously我是来捣乱的.",@"这是一个很长的标题，特别长以至于会换行，哈哈哈哈，你好啊",@"你好标题，这是一个短标题",@"哈哈，这是一个长标题，呼呼，好长的标题，以至于会换行，还有英文字幕你",@"有啦一个说出来都是你此刻的我都快都是旅客的疯狂都是，十点半目的是包括白色短裤说短论长的思念",@"nihaoshijie",@" Zoo that a wild puma had been spotted forty five miles south of London, they were not taken seriously.",@"http://music.baidu.com/?fr=tieba",@"away when she saw it, and experts ",@"confirmed that a puma will not attack a human being unless it is cornered. The search proved difficult, for the puma was often observed at one place in the morning and at another place twenty miles away in the evening.",@"Wherever it went, it left behind it a trail of dead deer and small animals like rabbits Paw prints were seen ",@"in a number of places and puma fur was found clinging ",@"to bushes.",@"A puma at largeA puma at largeA puma at largeA puma at largeA puma at large",@"Pumas are large, ",@"cat like animals which are found in America. When reports came into Londoncat like animals which are found in America. When reports came into Londoncat like animals which are found in America. When reports came into London",nil];

    
    self.dataSource = [NSMutableArray arrayWithObjects:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                       @"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                       @"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                       @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                       @"Neque porro quisquam est,",
                       @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet",
                       @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, ",
                       @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, ",
                       @"Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?",
                       @"Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",nil];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomCollectionViewCell class]) forIndexPath:indexPath];
    NSString * title = self.titleArray[indexPath.row];
    cell.titleLabel.text = title;
    cell.contentLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
