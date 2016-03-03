//
//  GameBoardViewController.m
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import "GameBoardViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AlertView.h"
#import "GamePiece.h"

@interface GameBoardViewController ()

// 盤上のマス目を表すView群
@property (weak, nonatomic) IBOutlet UIView *cell1View;
@property (weak, nonatomic) IBOutlet UIView *cell2View;
@property (weak, nonatomic) IBOutlet UIView *cell3View;
@property (weak, nonatomic) IBOutlet UIView *cell4View;
@property (weak, nonatomic) IBOutlet UIView *cell5View;
@property (weak, nonatomic) IBOutlet UIView *cell6View;
@property (weak, nonatomic) IBOutlet UIView *cell7View;
@property (weak, nonatomic) IBOutlet UIView *cell8View;
@property (weak, nonatomic) IBOutlet UIView *cell9View;
@property (weak, nonatomic) IBOutlet UIView *cell10View;
@property (weak, nonatomic) IBOutlet UIView *cell11View;
@property (weak, nonatomic) IBOutlet UIView *cell12View;
@property (weak, nonatomic) IBOutlet UIView *cell13View;
@property (weak, nonatomic) IBOutlet UIView *cell14View;
@property (weak, nonatomic) IBOutlet UIView *cell15View;
@property (weak, nonatomic) IBOutlet UIView *cell16View;

// ゲームのコマ管理クラスのインスタンス
@property (nonatomic,strong) GamePiece *gamePiece;


@end

@implementation GameBoardViewController

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //マス目に境界線を付ける
    [self drawBorderLineWithView:self.cell1View];
    [self drawBorderLineWithView:self.cell2View];
    [self drawBorderLineWithView:self.cell3View];
    [self drawBorderLineWithView:self.cell4View];
    [self drawBorderLineWithView:self.cell5View];
    [self drawBorderLineWithView:self.cell6View];
    [self drawBorderLineWithView:self.cell7View];
    [self drawBorderLineWithView:self.cell8View];
    [self drawBorderLineWithView:self.cell9View];
    [self drawBorderLineWithView:self.cell10View];
    [self drawBorderLineWithView:self.cell11View];
    [self drawBorderLineWithView:self.cell12View];
    [self drawBorderLineWithView:self.cell13View];
    [self drawBorderLineWithView:self.cell14View];
    [self drawBorderLineWithView:self.cell15View];
    [self drawBorderLineWithView:self.cell16View];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

// マス目の境界線を生成
- (void)drawBorderLineWithView:(UIView *)view
{
    view.backgroundColor = [UIColor lightGrayColor];
    //枠線
    view.layer.borderWidth = 1.5f;
    //枠線の色
    view.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    //角丸
    view.layer.cornerRadius = 10.0f;
}

#pragma mark - IBAction
- (IBAction)tappedMenuButton:(id)sender
{
    AlertView *alert = [[AlertView alloc]initWithTitle:@"ゲームを終了しますか？" message:@"「はい」を選ぶとタイトル画面に戻ります" owner:self];
    
    __weak typeof(self) weakSelf = self;
    __weak AlertView * weakAlert = alert;
    
    [alert addLabel:@"はい" handler:^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *initialViewController = [storyboard instantiateInitialViewController];
        [weakSelf presentViewController:initialViewController animated:YES completion:nil];
    }];
    
    [alert addLabel:@"いいえ" handler:^{
        [weakAlert dismiss];
    }];
    
    [alert show];
}


@end
