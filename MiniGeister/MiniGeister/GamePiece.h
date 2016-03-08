//
//  GamePiece.h
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 コマ生成、移動などの管理を行うクラス
 */
@interface GamePiece : UIView

/// 自コマ
@property (nonatomic,strong) UIView *myPiece1;
@property (nonatomic,strong) UIView *myPiece2;
@property (nonatomic,strong) UIView *myPiece3;
@property (nonatomic,strong) UIView *myPiece4;

/// 敵コマ
@property (nonatomic,strong) UIView *enemyPiece1;
@property (nonatomic,strong) UIView *enemyPiece2;
@property (nonatomic,strong) UIView *enemyPiece3;
@property (nonatomic,strong) UIView *enemyPiece4;

/**
 自コマの初期設定を行う
 @param viewController      コマを配置する土台となるViewController
 @param startCellView       自コマ1の初期配置位置となるview
 @param startCellSecondView 自コマ2の初期配置位置となるview
 */
- (void)settingMyPieceWithViewController:(UIViewController *)viewController startCellFirstView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView;

/**
 敵コマの初期設定を行う
 @param viewController      コマを配置する土台となるViewController
 @param startCellView       敵コマ1の初期配置位置となるview
 @param startCellSecondView 敵コマ2の初期配置位置となるview
 */
- (void)settingEnemyPieceWithViewController:(UIViewController *)viewController startCellView:(UIView *)startCellView startCellSecondView:(UIView *)startCellSecondView;

/**
 コマの移動
 @param cellView 移動先のView
 @param piece    現在選択されているpiece
 */
- (void)locatePieceWithCellView:(UIView *)cellView piece:(UIView *)piece;

@end
