//
//  ReadViewController.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "ReadViewController.h"
#import "XXReadHeaderView.h"
#import "XXReadFooterView.h"
#import "XXReadTableViewCell.h"

#import "XXReadConfig.h"
#import "XXReadParser.h"

#define PADDING 20.f
@interface ReadViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) XXReadHeaderView *headerView;
@property (nonatomic, strong) XXReadFooterView *footerView;

@end

@implementation ReadViewController

#pragma mark - Life Cycle

- (instancetype)init {
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addNotficationCenter];
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.headerView.height);
    }];
    
    [self.view addSubview:self.footerView];
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.footerView.height);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.equalTo(self.footerView.mas_top);
    }];
    
}

#pragma mark - NotficationCenter
- (void)addNotficationCenter {
    //修改字体或间距需重新计算绘制
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFont:) name:@"ChangeFontNotification" object:nil];
}
/**
 移除通知
 */
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ChangeFontNotification" object:nil];
}

- (void)changeFont:(NSNotification *)notification {
    //获取当前阅读页内容所在的range
    NSRange range = [self.module rangeOfPage:self.pageIndex];
    
    //重新分页
    [self.module paginate];
    NSInteger page = [self.module pageOfRange:range];

    if (self.pageIndex != page) {
        self.pageIndex = page;
        self.pageBlock ? self.pageBlock(page) : nil;
    }
    
    self.footerView.pageCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.pageIndex + 1,self.module.pageCount];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isUpDown ? self.module.pageCount : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XXReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[XXReadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    XXReadConfig *config = [XXReadConfig shareInstance];
    cell.readView.frameRef = [XXReadParser parserContent:[self.module stringOfPage:self.isUpDown ? indexPath.row : self.pageIndex]
                                                  config:config
                                                   bouds:CGRectMake(0, 0,K_SCREEN_WIDTH - (PADDING * 2), K_SCREEN_HEIGHT - self.headerView.height - self.footerView.height )];
    [cell.readView setNeedsDisplay];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height - self.headerView.height - self.footerView.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.00001)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.000001)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat Y = scrollView.contentOffset.y;
    NSInteger index = (NSInteger)Y/scrollView.frame.size.height;
    self.footerView.pageCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",index + 1,self.module.pageCount];
}


#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.scrollEnabled = self.isUpDown;
    }
    return _tableView;
}
- (XXReadHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[XXReadHeaderView alloc]init];
    }
    return _headerView;
}

- (XXReadFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[XXReadFooterView alloc]init];
    }
    return _footerView;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
//        _bgImageView.image = [UIImage imageWithColor:[XXReadConfig shareInstance].theme size:CGSizeMake(K_SCREEN_WIDTH, K_SCREEN_HEIGHT)];
    }
    return _bgImageView;
}

- (XXPagingModule *)module {
    if (!_module) {
        _module = [[XXPagingModule alloc]init];
        _module.contentText = self.content;
        _module.contentFont = [XXReadConfig shareInstance].fontSize;
        _module.textRenderSize = CGSizeMake(K_SCREEN_WIDTH - (PADDING * 2), K_SCREEN_HEIGHT - self.headerView.height - self.footerView.height);
        [_module paginate];
        
        self.footerView.pageCountLabel.text = [NSString stringWithFormat:@"%ld/%lu",self.pageIndex + 1,(unsigned long)_module.pageCount];
    }
    return _module;
}

@end
