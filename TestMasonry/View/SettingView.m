//
//  SettingView.m
//  TestMasonry
//
//  Created by atom on 2022/7/28.
//

#import "SettingView.h"

@implementation SettingView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self innerInit];
    }
    return self;
}
-(void) innerInit{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.iconView];
    [self addSubview:self.titleView];
    [self addSubview:self.moreIconView];

}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.centerY.equalTo(self);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(16);
        make.centerY.equalTo(self);
    }];
    [self.moreIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.centerY.equalTo(self);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
}

#pragma mark - 创建控件

- (UIImageView *)iconView {
    if(!_iconView){
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Logo"];
    }
    return _iconView;
}

- (UILabel *)titleView {
    if(!_titleView){
        _titleView = [[UILabel alloc] init];
        _titleView.text = @"设置";
    }
    return _titleView;
}

- (UIImageView *)moreIconView {
    if(!_moreIconView){
        _moreIconView = [[UIImageView alloc] init];
        _moreIconView.image = [UIImage imageNamed:@"Logo"];
    }
    return _moreIconView;
}


@end
