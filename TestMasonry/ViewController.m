//
//  ViewController.m
//  TestMasonry
//
//  Created by atom on 2022/7/27.
//

#import "ViewController.h"
#import <Masonry.h>
#import "HeaderView.h"

@interface ViewController ()
///UI
@property(strong, nonatomic) HeaderView *headerView;
@property(strong, nonatomic) UILabel *titleView;
@end

@implementation ViewController {
    ///UI配置
    CGFloat marginTop;
    CGFloat padding;
}

- (void)initConfig {
    marginTop = 70;
    padding = 15;//边距
}


///@override
- (void)updateViewConstraints {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(marginTop);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
    }];
    [super updateViewConstraints];

}


///@override
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.titleView];
}

#pragma mark - UI Getter

- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[HeaderView alloc] initWithCity:@"昌邑" temperature:@"35" max:@"31" min:@"23"];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

- (UILabel *)titleView {
    if (!_titleView) {
        _titleView = [[UILabel alloc] init];
        _titleView.text = @"天气预报";
        _titleView.textColor = [UIColor blackColor];
        _titleView.font = [UIFont systemFontOfSize:16];
        _titleView.alpha = 0.5;
    }
    return _titleView;
}


@end
