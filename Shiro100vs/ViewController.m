//
//  ViewController.m
//  tablesample
//
//  Created by ビザンコムマック０７ on 2014/11/05.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import "Webreturn.h"
#import "SampleTableViewCell.h"

@interface ViewController (){
    //tableviewのデータを表示するために使われる配列
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    //tableviewのデリゲート、データソースを自分自身にする
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    //城の情報の配列を格納(配列の順番は、番号が大きくなるたびにランクが下がるようになっている)
    array = [Webreturn serverdata:@"http://smartshinobu.miraiserver.com/shiro/shirorank.php"];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//テーブルのセルの数を返すためのメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return array.count;
}

//テーブルのセクションの数を返すためのメソッド
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//テーブルのセルの内容を返すメソッド
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellinentifier = @"samplecell";
    //samplecellという印がついた再利用可能なセルを格納
    SampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellinentifier];
    //セルが再利用できないかどうか
    if (!cell) {
        NSLog(@"新規作成");
        cell = [[SampleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellinentifier];
    }
    //arrayの[indexpath.row]番目の要素((indexpath.row+1)位の城に関する情報)を格納
    NSDictionary *dic = array[indexPath.row];
    //ranklabelを「(indexPath.row+1)位」表示するに設定
    cell.ranklabel.text = [NSString stringWithFormat:@"第%ld位",indexPath.row+1];
    //shirolabelを城の名前を表示するように設定
    cell.shirolabel.text = [dic objectForKey:@"shironame"];
    //タグの投稿数の文字列を格納
    NSString *tagcount = [dic objectForKey:@"tagcount"];
    //ブロックに関する文字列を格納
    NSString *block = [dic objectForKey:@"block"];
    //taglabelをブロックとタグの投稿数を表示するように設定
    cell.taglabel.text = [NSString stringWithFormat:@"ブロック:%@ タグの投稿数:%@",block,tagcount];
    return cell;
}

@end
