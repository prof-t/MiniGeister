//
//  MovePiece.h
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 コマの動きに関するクラス
 */
@interface MovePiece : NSObject

/**
 現在、空いているマスを得る
 @return 現在空いているマスのarrayを返す
 */
- (NSArray *)getBlankCellArray;

/**
 現在、埋まっているマスを得る
 @return 現在、埋まっているマスのarrayを返す
 */
- (NSArray *)getFilledCellArray;

/**
 コマと隣接するマスの内、空いているマスを得る
 @return コマと隣接するマスの内、空いているマスのarrayを返す
 */
- (NSArray *)getBlankCellArrayWithPiece;

/**
 コマと隣接するマスの内、埋まっているマスを得る
 @return コマと隣接するマスの内、埋まっているマスのarrayを返す
 */
- (NSArray *)getFilledCellArrayWithPiece;

/**
 コマと隣接するマスを得る
 @param currentCellTag 現在選択しているマスのタグ番号
 @return コマと隣接するマスのarrayを返す
 */
- (NSArray *)getNeighborCellWithCurrentCellTag:(NSInteger)currentCellTag;

/**
 マス目の配置状況を更新する
 */
- (void)refreshCellArray;

/// マス目横列のarray
@property (nonatomic,strong) NSMutableArray *rowCellArray;

/// マス目縦列のarray
@property (nonatomic,strong) NSMutableArray *columnCellArray;

@end
