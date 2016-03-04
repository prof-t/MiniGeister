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

// 盤面のセルの座標
static CGPoint const cell1ViewPoint  = {60, 200};
static CGPoint const cell2ViewPoint  = {110,200};
static CGPoint const cell3ViewPoint  = {160,200};
static CGPoint const cell4ViewPoint  = {210,200};
static CGPoint const cell5ViewPoint  = {60, 250};
static CGPoint const cell6ViewPoint  = {110,250};
static CGPoint const cell7ViewPoint  = {160,250};
static CGPoint const cell8ViewPoint  = {210,250};
static CGPoint const cell9ViewPoint  = {60, 300};
static CGPoint const cell10ViewPoint = {110,300};
static CGPoint const cell11ViewPoint = {160,300};
static CGPoint const cell12ViewPoint = {210,300};
static CGPoint const cell13ViewPoint = {60, 350};
static CGPoint const cell14ViewPoint = {110,350};
static CGPoint const cell15ViewPoint = {160,350};
static CGPoint const cell16ViewPoint = {210,350};

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

@property (nonatomic,strong) UIView *currentGamePiece;

@property (nonatomic,assign) BOOL isMoveMode;


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
    UIView *touchedCellView = [self.view viewWithTag:touch.view.tag];
    CGPoint pieceViewBaseCellPoint = CGPointMake(pieceView.frame.origin.x - 10,
                                                 pieceView.frame.origin.y - 10);
    
    NSInteger baseCellTag;
    
    // コマ移動モード時の挙動
    if (self.isMoveMode) {
        switch (touch.view.tag) {
            case 101:
            case 102:
            case 103:
            case 104:
            case 105:
            case 106:
            case 107:
            case 108:
            case 109:
            case 110:
            case 111:
            case 112:
            case 113:
            case 114:
            case 115:
            case 116:
                
                if (touchedCellView.backgroundColor == [UIColor whiteColor]) {
                    [self changeCellBackgroundColorToDefaultColor];
                    [self.gamePiece locatePieceWithCellView:touchedCellView piece:self.currentGamePiece];
                    self.isMoveMode = NO;
                }
                
    
                break;
        }
    } else {
        
        switch (touch.view.tag) {
            case 201:
                baseCellTag = [self getCellViewTagWithPiecePoint:pieceViewBaseCellPoint piece:pieceView];
                neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
                [self changeColorWithNeighborCellWithArray:neighborCellNumArray];
                self.currentGamePiece = pieceView;
                
                //            self.gamePiece.myPiece2.userInteractionEnabled = NO;
                break;
            case 202:
                baseCellTag = [self getCellViewTagWithPiecePoint:pieceViewBaseCellPoint piece:pieceView];
                neighborCellNumArray = [self.movePiece getNeighborCellWithCurrentCellTag:baseCellTag];
                [self changeColorWithNeighborCellWithArray:neighborCellNumArray];
                self.currentGamePiece = pieceView;
                
                //            self.gamePiece.myPiece1.userInteractionEnabled = NO;
                
                break;
            case 301:
                NSLog(@"enemyPiece1に触った");
                
                break;
            case 302:
                NSLog(@"enemyPiece2に触った");
                
                break;
            default:
                // それ以外
                NSLog(@"%ldに触った",touch.view.tag);
                break;
        }
    }
}

- (NSInteger)getCellViewTagWithPiecePoint:(CGPoint)piecePoint piece:(UIView *)piece
{
    if (CGPointEqualToPoint(piecePoint, cell1ViewPoint)) {
        return 101;
        
    } else if (CGPointEqualToPoint(piecePoint, cell2ViewPoint)) {
        return 102;
        
    } else if (CGPointEqualToPoint(piecePoint, cell3ViewPoint)) {
        return 103;
        
    } else if (CGPointEqualToPoint(piecePoint, cell4ViewPoint)) {
        return 104;
        
    } else if (CGPointEqualToPoint(piecePoint, cell5ViewPoint)) {
        return 105;
        
    } else if (CGPointEqualToPoint(piecePoint, cell6ViewPoint)) {
        return 106;
        
    } else if (CGPointEqualToPoint(piecePoint, cell7ViewPoint)) {
        return 107;
        
    } else if (CGPointEqualToPoint(piecePoint, cell8ViewPoint)) {
        return 108;
        
    } else if (CGPointEqualToPoint(piecePoint, cell9ViewPoint)) {
        return 109;
        
    } else if (CGPointEqualToPoint(piecePoint, cell10ViewPoint)) {
        return 110;
        
    } else if (CGPointEqualToPoint(piecePoint, cell11ViewPoint)) {
        return 111;
        
    } else if (CGPointEqualToPoint(piecePoint, cell12ViewPoint)) {
        return 112;
        
    } else if (CGPointEqualToPoint(piecePoint, cell13ViewPoint)) {
        return 113;
        
    } else if (CGPointEqualToPoint(piecePoint, cell14ViewPoint)) {
        return 114;
        
    } else if (CGPointEqualToPoint(piecePoint, cell15ViewPoint)) {
        return 115;
        
    } else if (CGPointEqualToPoint(piecePoint, cell16ViewPoint)) {
        return 116;
        
    } else {
        NSLog(@"ありえない座標");
        return 0;
    }
}

// コマと隣接するマス目を強調表示する
- (void)changeColorWithNeighborCellWithArray:(NSArray *)array
{
    if (self.isMoveMode == NO){
        
        self.isMoveMode = YES;
        for(NSNumber *tagNum in array) {
            UIView *view = [self.view viewWithTag:[tagNum integerValue]];
            view.backgroundColor = [UIColor whiteColor];
        }
    } else  {
        self.isMoveMode = NO;
        
    }
}

- (void)changeCellBackgroundColorToDefaultColor
{
    self.cell1View.backgroundColor = [UIColor lightGrayColor];
    self.cell2View.backgroundColor = [UIColor lightGrayColor];
    self.cell3View.backgroundColor = [UIColor lightGrayColor];
    self.cell4View.backgroundColor = [UIColor lightGrayColor];
    self.cell5View.backgroundColor = [UIColor lightGrayColor];
    self.cell6View.backgroundColor = [UIColor lightGrayColor];
    self.cell7View.backgroundColor = [UIColor lightGrayColor];
    self.cell8View.backgroundColor = [UIColor lightGrayColor];
    self.cell9View.backgroundColor = [UIColor lightGrayColor];
    self.cell10View.backgroundColor = [UIColor lightGrayColor];
    self.cell11View.backgroundColor = [UIColor lightGrayColor];
    self.cell12View.backgroundColor = [UIColor lightGrayColor];
    self.cell13View.backgroundColor = [UIColor lightGrayColor];
    self.cell14View.backgroundColor = [UIColor lightGrayColor];
    self.cell15View.backgroundColor = [UIColor lightGrayColor];
    self.cell16View.backgroundColor = [UIColor lightGrayColor];
}


@end
