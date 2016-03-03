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
#import "MovePiece.h"

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

@property (nonatomic,strong) MovePiece *movePiece;


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

    // 各クラスのインスタンスを生成
    self.gamePiece = [[GamePiece alloc]init];
    self.movePiece = [[MovePiece alloc]init];
    
   [self.gamePiece settingMyPieceWithView:self.view startCellFirstView:self.cell14View startCellSecondView:self.cell15View ];
    [self.gamePiece settingEnemyPieceWithView:self.view startCellView:self.cell2View startCellSecondView:self.cell3View];
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

// タッチイベントを取る
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *neighborCellNumArray;
    
    UITouch *touch = [touches anyObject];
    
    UIView *pieceView = [self.view viewWithTag:touch.view.tag];
    UIView *baseCellView = [pieceView superview];
    
    NSInteger baseCellTag = [[pieceView superview] superview].tag;
    
    switch (touch.view.tag) {
        case 101:
            NSLog(@"1に触った");
            break;
        case 102:
            NSLog(@"2に触った");
            break;
        case 103:
            NSLog(@"3に触った");
            break;
        case 104:
            NSLog(@"4に触った");
            break;
        case 105:
            NSLog(@"5に触った");
            break;
        case 106:
            NSLog(@"6に触った");
            break;
        case 107:
            NSLog(@"7に触った");
            break;
        case 108:
            NSLog(@"8に触った");
            break;
        case 109:
            NSLog(@"9に触った");
            break;
        case 110:
            NSLog(@"10に触った");
            break;
        case 111:
            NSLog(@"11に触った");
            break;
        case 112:
            NSLog(@"12に触った");
            break;
        case 113:
            NSLog(@"13に触った");
            break;
        case 114:
            NSLog(@"14に触った");
            break;
        case 115:
            NSLog(@"15に触った");
            break;
        case 201:
            NSLog(@"myPiece1に触った");
            neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
            break;
        case 202:
            NSLog(@"myPiece2に触った");
            neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
            break;
        case 301:
            NSLog(@"enemyPiece1に触った");
            neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
            break;
        case 302:
            NSLog(@"enemyPiece2に触った");
            neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
            break;
        default:
            // それ以外
            NSLog(@"%ldに触った",touch.view.tag);
            break;
    }
}


@end
