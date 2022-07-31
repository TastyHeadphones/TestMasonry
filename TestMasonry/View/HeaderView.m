//
//  HeaderView.m
//  TestMasonry
//
//  Created by atom on 2022/7/31.
//
//
#import "Masonry.h"
#import "HeaderView.h"

@interface HeaderView ()
/// UI
@property(nonatomic, strong) UILabel *cityView;
@property(nonatomic, strong) UILabel *temperatureView;
@property(nonatomic, strong) UILabel *maxAndMinView;

@end

@implementation HeaderView {
    /// UI配置
    UIColor *textColor;
    UIFont *cityFont;
    UIFont *temperatureFont;
    UIFont *maxAndMinFont;
}
#pragma mark - 初始化

///@override
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initConfig];
    }

    return self;
}

/// 初始化UI配置
- (void)initConfig {
    textColor = [UIColor blackColor];
    cityFont = [UIFont systemFontOfSize:24];
    temperatureFont = [UIFont systemFontOfSize:72];
    maxAndMinFont = [UIFont systemFontOfSize:24];
}

/// 根据值初始化UI
- (instancetype)initWithCity:(NSString *)city
                 temperature:(NSString *)temperature
                         max:(NSString *)max
                         min:(NSString *)min {
    self = [self init];
    if (self) {
        self.cityView.text = city;
        self.temperatureView.text = [[NSString alloc] initWithFormat:@"%@°", temperature];
        self.maxAndMinView.text = [[NSString alloc] initWithFormat:@"最高%@° 最低%@°", max, min];
    }
    return self;
}
#pragma mark - 约束

///@override
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self addSubview:self.cityView];
    [self addSubview:self.temperatureView];
    [self addSubview:self.maxAndMinView];
}


///@override
- (void)updateConstraints {
    [self.cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        [make centerX];
    }];
    [self.temperatureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityView.mas_bottom);
        [make centerX];
    }];
    [self.maxAndMinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.temperatureView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        [make centerX];
    }];
    [super updateConstraints];

}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}


#pragma mark - UI Getter

- (UILabel *)cityView {
    if (!_cityView) {
        _cityView = [[UILabel alloc] init];
        _cityView.text = @"XX市";
        _cityView.textColor = textColor;
        _cityView.font = cityFont;
    }
    return _cityView;
}

- (UILabel *)temperatureView {
    if (!_temperatureView) {
        _temperatureView = [[UILabel alloc] init];
        _temperatureView.text = @"00度";
        _temperatureView.textColor = textColor;
        _temperatureView.font = temperatureFont;

    }
    return _temperatureView;
}

- (UILabel *)maxAndMinView {
    if (!_maxAndMinView) {
        _maxAndMinView = [[UILabel alloc] init];
        _maxAndMinView.text = @"最高10度 最低-10度";
        _maxAndMinView.textColor = textColor;
        _maxAndMinView.font = maxAndMinFont;
    }
    return _maxAndMinView;
}



@end
