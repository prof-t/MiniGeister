//
//  MovePiece.h
//  MiniGeister
//
//  Created by 平山亮 on 2016/03/03.
//  Copyright © 2016年 平山亮. All rights reserved.
//

/**
 コマの動きに関するクラス
 */

#import <Foundation/Foundation.h>

@interface MovePiece : NSObject

// 現在、空いているマスを得る
- (NSArray *)getBlankCellArray;

// 現在、埋まっているマスを得る
- (NSArray *)getFilledCellArray;

// コマと隣接するマスの内、空いているマスを得る
- (NSArray *)getBlankCellArrayWithPiece;

// コマと隣接するマスの内、埋まっているマスを得る
- (NSArray *)getFilledCellArrayWithPiece;

// マス目の配置状況を更新する
- (void)refreshCellArray;

// マス目横列のarray
@property (nonatomic,strong) NSMutableArray *rowCellArray;

// マス目縦列のarray
@property (nonatomic,strong) NSMutableArray *columnCellArray;

@end
