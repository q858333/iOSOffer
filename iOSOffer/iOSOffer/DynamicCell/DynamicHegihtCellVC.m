//
//  DynamicHegihtCellViewController.m
//  iOSOffer
//
//  Created by dengbinOld on 2020/4/9.
//  Copyright © 2020 dengsir. All rights reserved.
//

#import "DynamicHegihtCellVC.h"
#import "DynamicCell.h"
@interface DynamicHegihtCellVC ()
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UITableView *table;

@end

@implementation DynamicHegihtCellVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titles = @[@"算法",@"移动中变化的cell",@"算法",@"移动中变化的cell",@"算法",@"移动中变化的cell",@"算法",@"移动中变化的cell",@"算法",@"移动中变化的cell"];
    // Do any additional setup after loading the view.
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [table registerClass:[DynamicCell class] forCellReuseIdentifier:@"DynamicCell"];
    table.rowHeight = MinCellHeight;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
//    table.contentInset = UIEdgeInsetsMake(MaxCellHeight - MinCellHeight, 0, self.view.frame.size.height - MaxCellHeight, 0);

    self.table = table;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DynamicCell"];
    [cell cellImageName:[NSString stringWithFormat:@"%zd.jpg",indexPath.row] text:self.titles[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"willDisplayCell->%.2f", cell.frame.origin.y-tableView.contentOffset.y);
    //cell第一次出现时调用计算偏移量
    DynamicCell *getCell = (DynamicCell *)cell;
    
//    [getCell cellOffsetOnTabelView:tableView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //在滑动过程中获取当前显示的所有cell, 调用偏移量的计算方法
        [[self.table visibleCells] enumerateObjectsUsingBlock:^(DynamicCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
            if(idx == 1){
                NSLog(@"scrollViewDidScroll->%.2f  %.2f  %.2f", cell.frame.origin.y,scrollView.contentOffset.y,cell.frame.origin.y-scrollView.contentOffset.y);
            }

        //cell偏移设置
        [cell cellOffsetOnTabelView:scrollView];
        
    }];
}

@end
