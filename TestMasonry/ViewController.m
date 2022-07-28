//
//  ViewController.m
//  TestMasonry
//
//  Created by atom on 2022/7/27.
//

#import "ViewController.h"
#import <Masonry.h>
#import "SettingController.h"
@interface ViewController ()
@property(strong, nonatomic) UIView *container;
@property(strong, nonatomic) UIButton *phoneLoginButton;
@property(strong, nonatomic) UIButton *primaryButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 控件
    //添加一个根容器
    self.container = [UIView new];
    self.container.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.container];

    //添加logo
    UIImageView *logoView = [[UIImageView alloc] init];
    logoView.image = [UIImage imageNamed:@"Logo"];
    [self.container addSubview:logoView];

#pragma mark - 手机号登录按钮
    self.phoneLoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置标题
    [self.phoneLoginButton setTitle:@"手机号登录" forState:UIControlStateNormal];
    //设置点击事件
    [self.phoneLoginButton addTarget:self action:@selector(phoneLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    self.phoneLoginButton.backgroundColor = UIColor.redColor;
    self.phoneLoginButton.layer.cornerRadius = 5;
    [self.phoneLoginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    //按下文本颜色
    [self.phoneLoginButton setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
    [self.container addSubview:self.phoneLoginButton];
#pragma mark - 登录按钮
    self.primaryButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置标题
    [self.primaryButton setTitle:@"用户名和密码登录" forState:UIControlStateNormal];
    [self.primaryButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    //设置点击事件
    [self.primaryButton addTarget:self action:@selector(primaryClick:) forControlEvents:UIControlEventTouchUpInside];
    self.primaryButton.backgroundColor = UIColor.clearColor;
    self.primaryButton.layer.cornerRadius = 21;
    self.primaryButton.layer.borderWidth = 1;
    self.primaryButton.layer.borderColor = [UIColor redColor].CGColor;
    [self.container addSubview:self.primaryButton];
#pragma mark - 第三方登录容器
    UIView *otherLoginContainer = [[UIView alloc] init];
//    otherLoginContainer.backgroundColor = [UIColor orangeColor];
    [self.container addSubview:otherLoginContainer];
    //第三方登录按钮
    NSMutableArray *otherLoginButtonViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *buttonView = [[UIButton alloc] init];
        [buttonView setImage:[UIImage imageNamed:@"Logo"] forState:UIControlStateNormal];
        buttonView.backgroundColor = [UIColor redColor];
        [otherLoginContainer addSubview:buttonView];
        [otherLoginButtonViews addObject:buttonView];
    }



#pragma mark - 协议
    UILabel *agrementLabel = [[UILabel alloc] init];
    //设置标题
    agrementLabel.text = @"登录即表示你同意《用户协议》和《隐私政策》";
    agrementLabel.font = [UIFont systemFontOfSize:12];
    agrementLabel.textColor = [UIColor grayColor];

    [self.container addSubview:agrementLabel];
#pragma mark - 约束 - logo
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽高
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        //距离顶部
        make.top.mas_equalTo(100);
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];

#pragma mark - 约束 - 登录按钮
    [self.primaryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(42);
        make.bottom.equalTo(self.phoneLoginButton.mas_top).offset(-30);
    }];
#pragma mark - 约束 - 手机号登录按钮
    [self.phoneLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(42);
        make.bottom.equalTo(otherLoginContainer.mas_top).offset(-30);
    }];

#pragma mark - 约束 - 第三方登录容器
    [otherLoginContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.container.mas_width);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(agrementLabel.mas_top).offset(-30);
    }];
    //水平排列
    [otherLoginButtonViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:50 leadSpacing:0 tailSpacing:0];
    [otherLoginButtonViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(otherLoginContainer);
        make.height.mas_equalTo(50);
    }];
#pragma mark - 约束 - 协议
    [agrementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽高
        //距离顶部
        make.bottom.mas_equalTo(0);
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
    }];
#pragma mark - 约束
    //根容器
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(16);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-16);
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(16);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-16);

    }];
}

- (void)primaryClick:(UIButton *)sender {
    NSLog(@"%@",sender);
    SettingController *target = [[SettingController alloc] init];
    [self.navigationController pushViewController:target animated:YES];
    NSLog(@"%@",self.navigationController.viewControllers);
}
- (void)phoneLoginClick:(UIButton *)sender  {
    NSLog(@"%@",sender);
}



@end
