//
//  ViewController.h
//  tablesample
//
//  Created by ビザンコムマック０７ on 2014/11/05.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//ランキングを表示するためテーブルビュー
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

