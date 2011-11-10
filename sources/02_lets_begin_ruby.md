

# 02 Let's begin Ruby.


---------------

# はじめに

## この講座で伝えられること

これからCとRubyとを比較しながら進めていきます。以下のサイトを参考に内容をまとめています。

**逆引きRuby**:[http://www.namaraii.com/rubytips/](http://www.namaraii.com/rubytips/)

Cには無いけれどRubyにはある便利な機能というのは、この講座では紹介しきれません。
「Rubyでこんなことがしたい」ということを調べる時は、上記サイトを活用して下さい。

## 進め方

1. CとRubyの**文法的な**違い
2. CのプログラムをRubyの文法に書き換えてみよう
3. **Rubyらしい**機能の紹介
4. CのプログラムをRubyらしく書き換えてみよう

---------------

# Rubyのだいたい

## 簡単に、幅広く

テキスト処理からウェブサービス,ゲーム開発まで、簡単に行えて幅広い用途があります。

## MADE IN JAPAN

日本発でこれだけの知名度を持つ言語は類を見ません。

## Rubyの哲学

ストレスなくプログラミングを楽しむこと(Enjoy Programming)

## ライブラリがいっぱい

RubyGemsというライブラリ管理システムには、約3万ものライブラリが登録されています。

## でも。。

実行速度はCやJavaより遅いです。
参考:[http://d.hatena.ne.jp/kwatch/20100430/1272585083](http://d.hatena.ne.jp/kwatch/20100430/1272585083)


---------------

# 基本編

---------------

## main関数が不要 *

## in C

    !c
    #include "stdio.h"

    int main(int argc, char *argv[]) {
        printf("Hello World!"); // comment
        return 0;
    }

.notes: プログラムの始まりを示すためにmain関数を定義する必要がある。

## in Ruby

    !ruby
    printf("Hello World!") # comment

.notes: プログラムはファイルの1行目から実行される。main関数を定義する必要はない。

---------------

## セミコロンが不要 *

## in C

    !c
    #include "stdio.h"

    int main(int argc, char *argv[]) {
        printf("Hello ");
        printf("World!");

        printf("Hello "); printf("World!");

        return 0;
    }

.notes: セミコロン(;)が文の終わりを示す。

## in Ruby

    !ruby
    printf("Hello ")
    printf("World!")

    printf("Hello "); printf("World!")

.notes: 改行が式の終わりを示す。セミコロンを使うことも出来る。

---------------

## 中括弧の代わりにdo～endを使う *

## in C

    !c
    void func_loop() {
        for(int i = 0; i < 5; ++i) {
            // do something
        }
    }

## in Ruby

    !ruby
    def func_loop
      for i in 0..4 do
        # do something
      end
    end

.notes: doは不要な場合もあります。(例えばdef, if))また、しばしば省略可能です。(例えばfor,while)

---------------

## コメントの書き方

## in C

    !c
    // がコメント
    /*
      これもコメント
      複数行に渡る記述が可能
    */

## in Ruby

    !ruby
    # がコメント
    =begin
      これもコメント
      複数行に渡る記述が可能
      =begin, =endは行頭に記述される必要があります。
    =end

.notes: 基本的には記号が違うだけ。=begin, =endは行頭に記述しなければいけない点に注意。

---------------

## オブジェクトという概念 *

## in C

    !c
    #include "stdio.h"
    #include "math.h"
    #include "stdlib.h"

    void main() {
        char buff[50];

        atoi("123"); // => 123
        ceil(5.3);   // => 6
        floor(5.3);  // => 5
        fgets(buff, 50, stdin);
    }

## in Ruby

    !ruby
    "123".to_i
    5.3.ceil
    5.3.floor
    STDIN.gets

.notes: オブジェクトとは、変数に自分を操作するためのメソッドがくっついたものだと考えて下さい。 object.method() の形で呼び出します。

---------------

# 変数&定数編

---------------

## 変数の宣言が不要 *

## in C

    !c
    void main() {
        int a, b, c;
        a = 10;
        b = 2;
        c = a + b; // => 12
        d;         // Compile Error!!
    }

.notes: 変数を利用する場合は、事前に宣言をする必要がある。宣言をしていない変数を参照しようとするとエラーとなる。

## in Ruby

    !ruby
    a = 10
    b = 2
    c = a + b # => 12
    d         # => nil

.notes: 宣言が不要。代入した時点で変数が定義される。定義されていない変数(d)を参照した場合はnil(CでいうNULLのようなもの)となる。

---------------

## 変数に型が無い *

## in C

    !c
    void main() {
        int var;
        var = 10;       // => 10  OK
        var = 0.33524;  // => 0
        var = "foobar"; // Compile Error!!
    }
    
.notes: int型として宣言した変数varに、文字列を代入することは出来ない。

## in Ruby

    !ruby
    var = 10
    var = 0.33524      # => 0.33524      OK 
    var = "foobar"     # => "foorbar"    OK
    var = [5, 4, 6, 2] # => [5, 4, 6, 2] 配列でもOK

.notes: 変数に型が無いため、どんな値でも代入することが出来る。

---------------

## 定数の定義方法

## in C

    !c
    #include "stdio.h"

    #define SCREEN_WIDTH  800 // 定数の定義
    #define SCREEN_HEIGHT 600 // 

    void main() {
        printf("width: %d, height: %d", SCREEN_WIDTH, SCREEN_HEIGHT);
    }

.notes: defineマクロによって定数を定義する。コンパイル時にマクロ定数への参照が値へ置き換えられる。マクロ名が大文字である必要はない。

## in Ruby

    !ruby
    SCREEN_WIDTH  = 800 # 定数の宣言
    Screen_height = 600 # 定数
    screen_fps    = 40  # 変数

    printf("width: %d, height: %d", SCREEN_WIDTH, Screen_height);

.notes: 変数名の頭を大文字にすると'変更不可の変数'となる。

---------------

# 標準入出力編

---------------

## 出力いろいろ *

## in C

    !c
    #include "stdio.h"

    void main() {
        puts("chipstar");
        printf("%d mai tabemasita.\n", 5);
    }

## in Ruby

    !ruby
    print("kaigyou saremasen. ")      # 改行されない　
    puts("chipstar")                  # 改行される
    printf("%d mai tabemasita.\n", 5) # おなじみ
 
---------------

## 入力いろいろ *

## in C

    !c
    #include "stdio.h"

    void main() {
        char buff[50];

        fgets(buff, 50, stdin);
        printf("%s", buff);
    }

## in Ruby

    !ruby
    buff = STDIN.gets
    print buff

.notes: RubyではSTDOUT/STDIN/STDERRに割り当てられています。

---------------

# 制御構文編

---------------

## if文の括弧が不要

## in C

    !c
    #include "stdio.h"
    void main() {
        if(4 < 2) {
            printf("true");
        }
        else {
            printf("false");
        }
    }


## in Ruby

    !ruby
    if 4 < 2 
      puts("true")
    else
      puts("false")
    end
    # if 条件
    #   ...
    # end

.notes: 中括弧ではなくif～endで表す。条件文にも括弧が要らない。これはwhileでも同じ

---------------

## 0は偽ではない - in C

##  in C

    !c
    #include "stdio.h"

    int main(int argc, char *argv[]) {
        if(0) {} else {
            puts("0 is false.");
        }

        if(13) {} else {
            puts("13 is true.");
        }

        if(NULL) {} else {
            puts("NULL is false.");
        }
    }

.notes: C言語では0が偽であり、その他の値は全て真である。また、NULLは0で表現されるため偽となる。

---------------

## 0は偽でなはい - in Ruby *

## in Ruby

    !ruby
    if 0 
      puts "0 is true"
    end

    if 13
      puts "13 is true"
    end

    if true
      puts "true is true"
    end

    if false
    else
      puts "false is false"
    end

    if nil
    else
      puts "nil is false"
    end

.notes: Rubyでは真偽の値を代表するリテラルが組み込まれている。それがtrue/falseである。また、nilという"意味のない値"を示すリテラルがも存在する。これはC言語でいうNULLに近いものである。Rubyではfalse/nilが偽であり、その他すべての値が真である。

---------------

## else ifではなくelsif *

## in C

    !c
    #include "stdio.h"
    void main() {
        if(4 < 2) {
            printf("4 < 2 is true.");
        }
        else if(4 > 2) {
            printf("4 > 2 is true.");
        }
    }

## in Ruby

    !ruby
    if 4 < 2 
      puts("4 < 2 is true.")
    elsif 4 > 2
      puts("4 < 2 is true.")
    end

.notes: 表記が異なる。

---------------

## switch, caseではなくcase, when *

## in Ruby

    !ruby
    case "satoko"
    when "kouhei"
      puts "is male."
    when "satoko"
      puts "is female."
    when "pobo"
      puts "is dog."
    end
    # => is female.

    # case 式
    # [when 式[,式...] then
    #   文]*
    # [else
    #   文]
    # end

.notes: caseの値に文字列が利用できる。

---------------

## whileとforの書き方

## in Ruby

    !ruby
    idx = 0
    while idx < 3
      puts "Hey "
      idx = idx + 1 # ++iは使えない(インクリメント演算子)
    end
    # => Hey Hey Hey 

    # while 条件式 [do]
    # 文
    # end

    for idx in 1..3
      puts "Hoi "
    end
    # => Hoi Hoi Hoi 

    # for 変数 [, 変数...] in 式 [do]
    #   文
    # end

---------------

# 関数編

---------------

## 関数の定義方法 *

## in C

    !c
    int foo(int x, int y) {
        return x * y;
    }
    // 戻り値の型 関数名(引数型 引数名, ...) {
    //     return 戻り値;
    // }


## in Ruby

    !ruby
    def foo(x, y) 
      x + y
    end
    # def 関数名(引数名, ...)
    #   戻り値
    # end

.notes: 中括弧を用いない。また、returnを省略することが出来る。

---------------

## 関数呼び出しのカッコが省略できる

## in Ruby

    !ruby
    print("Hello World!")
    print "Hello World!"  # 省略可能
    
    print(kansu(5, 4))
    print kansu(5, 4)  # 省略可能

    print(kansu 5, 4)  # こんな省略はダメ

    print kansu 5, 4   # いみふ！


.notes: Rubyでは文脈から引数を特定できる場合に、括弧を省略することができる。


---------------

# 文字列編

---------------

## 文字列の長さを気にしなくてよい *

## in C

    !c
    #include "stdio.h"

    #define BUFF_LENGTH 5

    void main() {
        char buff[BUFF_LENGTH];

        fgets(buff, BUFF_LENGTH, stdin);
        printf("%s\n", buff);
    }
    // input:  12345678\n
    // output: 1234\n


## in Ruby

    !ruby
    buff = STDIN.gets

    printf("%d", buff)
    # input:  12345678\n
    # output: 12345678\n

.notes: Rubyでの文字列は、文字の配列ではない。例えば"c"は、長さ1の文字列である。

---------------

## 再代入が簡単 *

## in C

    !c
    #include "stdio.h"
    #include "string.h"

    void main() {
        char str[] = "syokika";

        str = "hennkou"; // NG Compile Error.
        printf("%s\n", str);

        strcpy(str, "hennkou");
        printf("%s\n", str);
    }

## in Ruby

    !ruby
    str = "syokika"
    printf("%d", str)

    str = "hennkou"
    printf("%d", str)

.notes:string.hなんて要らなかったんや！

---------------

## 文字列の比較が簡単 *

## in C

    !c
    #include "stdio.h"
    #include "string.h"

    void main() {
        char buff[50];

        fgets(buff, 50, stdin);

        if(buff == "foo\n") {
            puts("Matched by == !!"); // not Work
        }

        if(strcmp(buff, "foo\n") == 0) {
            puts("Matched by strcmp() !!"); // Work!
        }
    }

## in Ruby

    !ruby
    buff = STDIN.gets

    if buff == "foo\n"
      puts "Macthed by == !!" # Work!
    end

---------------

## 文字列の結合が簡単

## in C

    !c
    #include "stdio.h"
    #include "string.h"

    #define BUFF_LENGTH 20

    void main() {
        char str[BUFF_LENGTH] = "foo";
        printf("%s\n", str);

        strcat(str, "bar");
        printf("%s\n", str);
    }

## in Ruby

    !ruby
    str = "foo"
    str = str + "bar"

    printf("%s", str)

---------------

## 文字列の一部を取り出すのが簡単

## in C

    !c
    #include "stdio.h"
    #include "string.h"

    #define BUFF_LENGTH 20

    void main() {
        char str[BUFF_LENGTH] = "foofoo";

        strncpy(&(str[3]), "bar", 3);
        printf("%s\n", str);
    }

## in Ruby

    !ruby
    str = "foofoo"

    str[3, 3] = "bar" # 4文字目から 3文字分置き換え
    printf("%s\n", str)

    str[0..2] = "bar" # 1文字目から3文字目まで 置き換え
    printf("%s\n", str)

---------------

## それからそれから

## 文字列を整数に変換する

    !ruby
    str = "666"

    val = str.to_i + 444
    printf "%d", val

## 文字列中の式を評価して値を展開する

    !ruby
    def nibai(x)
      x * 2
    end

    value = 205

    puts "value is #{value}" # => "value is 205"
    puts "value is #{nibai(value)}" # => "value is 410"

.notes: \#\{...\}で囲った式は展開され、文字列に埋め込まれる。関数を呼び出すことも可能。

## 文字列の終わりの改行を取り除く

    !ruby
    str = "pobo kawaii\n"
    str.chomp!

    print str # => "pobo kawaii"


---------------

# 配列編

---------------

## 配列の定義の仕方 *

## in C

    !c
    #include "stdio.h"

    void main() {
        char strs[][20]  = { "Aka Pajama", "Ao Pajama", "Ki Pajama" };

        char array[][3][20] = {  // ネストすると要素数を記述しなければならない
            {"kit", "densan", "365"},   // 文字列型なので文字列しか代入できない
            {"Ruby", "Python", "Perl"},
            {"0.4649"}
        };
    }

## in Ruby

    !ruby
    strs = ["Aka Pajama", "Ao Pajama", "Ki Pajama"]

    array = [                       # 改行OK
      ["kit", "densan", 365],     # 配列のネストOK
      ["Ruby", "Python", "Perl"], #
      0.4649                      # 型が無いのでどんな値でもOK
    ]

.notes: 要素へのアクセスの仕方は同じ。

---------------

## 配列の要素数を取得するのが簡単

## in C

    !c
    #include "stdio.h"

    void main() {
        char array[][20] = { "Aka Pajama", "Ao Pajama", "Ki Pajama" };

        printf("size is %d", sizeof(array) / sizeof(array[0]));
    }


## in Ruby

    !ruby
    array = ["Aka Pajama", "Ao Pajama", "Ki Pajama"]

    print "size is #{array.size}"
    print "size is #{array.length}"

.notes: Array#size, Array#lengthは同じ関数である。

---------------

## 配列の内容を変更できる *

## in Ruby

    !ruby
    array = ["python"]

    # 要素の追加
    array.push("perl")            # 末尾に追加 => ["python", "perl"]
    array.unshift("ruby")         # 先頭に追加 => ["ruby", "python", "perl"]

    # 要素の取り出し
    array.pop                    # 末尾から => "perl"
    array.shift                  # 先頭から => "ruby"
    array                        # => ["python"]

    # 配列同士を繋げる
    array.concat(["js", "html"]) # => ["python", "js", "html"]
    array                        # => ["python", "js", "html"]

    # 配列を逆順にする
    array.reverse!               # => ["html", "js", "python"]

    # 要素を削除
    array.deleteAt(0)            # => "html"
    array.delete("python")       # => "python"
    array                        # => ["js"]

.notes: Cではmallocを用いて動的配列を作らなければならない。

---------------

## 配列の要素に順番にアクセスする

## in C

    !c
    #include "stdio.h"

    void main() {
        char array[][20] = { "Ruby", "Python", "Perl" };

        for(int idx = 0; idx < sizeof(array) / sizeof(array[0]); ++idx) {
            printf("%s\n", array[idx]);
        }
    }

## in Ruby

    !ruby
    array = ["Ruby", "Python", "Perl"]

    for element in array
      puts element
    end

    # for 変数名 in 配列
    #  ...
    # end

.notes: 配列の要素が順番に'変数名'に代入され、ループが行われる。


---------------

# ファイル入出力編

---------------

## ファイルから一行ずつ読み込む

## in C

    !c
    #include "stdio.h"

    void main() {
        FILE *fp;
        char buff[256];

        fp = fopen("example.txt", "r");

        while (fgets(buff, 256, fp) != NULL) {
            printf("%s", buff);
        }

        fclose(fp);
    }

## in Ruby

    !ruby
    file = File.open("example.txt", "r")

    while line = file.gets
      print line
    end


---------------

# やってみよう

---------------

## FizzBuzz Problem

## 要求

    1. 1行の出力は「<行番号> '：' <メッセージ>」であること。
    2. 行番号が 3の倍数であるとき、メッセージは「Fizz」であること
    3. 行番号が 5の倍数であるとき、メッセージは「Buzz」であること
    4. 行番号が 3の倍数かつ5の倍数であるとき、メッセージは「FizzBuzz」であること
    5. 行番号が 上記の条件に当てはまらないとき、メッセージは「----」であること

以上の要求を満たす文字列を、**20行**出力するプログラムを作成してください。


## 出典

[変形FizzBuzz問題 どう書く？org](http://ja.doukaku.org/77/)

---------------

## FizzBuzz Problem - 出力例

## 出力例

    !c
     1:----
     2:----
     3:Fizz
     4:----
     5:Buzz
     6:Fizz
     7:----
     8:----
     9:Fizz
    10:Buzz
    11:----
    12:Fizz
    13:----
    14:----
    15:FizzBuzz
    16:----
    17:----
    18:Fizz
    19:----
    20:Buzz

---------------

## FizzBuzz Problem - in C

## in C

    !c
    #include "stdio.h"

    int main(int argc, char *argv[]) {
        int idx;

        for(idx = 1; idx <= 20; ++idx) {
            printf("%2d:", idx);

            if(idx % 3 == 0) {
                printf("Fizz");
            }

            if(idx % 5 == 0) {
                printf("Buzz");
            }

            if(idx % 5 && idx % 3) {
                printf("----");
            }

            printf("\n");
        }

        return 0;
    }

---------------

## FizzBuzz Problem - ヒント

## ヒント

 * main関数が不要
 * セミコロンが不要
 * 変数の宣言が不要
 * 出力いろいろ
 * if文の括弧が不要
 * switch,caseではなくcase, when (case文使う場合)
 * 0は偽ではない

---------------

## FizzBuzz Problem - in Ruby

## in Ruby

    !ruby
    for idx in 1..20
      printf("%2d:", idx)

      if idx % 3 == 0
        print "Fizz"
      end

      if idx % 5 == 0
        print "Buzz"
      end

      if idx % 5 != 0 && idx % 3 != 0
        print "----"
      end

      print "\n"
    end

---------------

## Bubble-Sort Program

## バブルソートって？

配列の隣りあう要素同士を比較し交換してゆく。その挙動が水中を昇ってゆく泡のようであることから、バブルソートと呼ばれる。

## 詳しいアルゴリズム

[アルゴリズムとデータ構造編　第２章　バブルソート](http://www.geocities.jp/ky_webid/algorithm/002.html)

## 実行中の例

    !ruby
    [3, 19, 8, 9, 7,  2, 14] # before

    [3,  8, 9, 7, 2, 14, 19] # step 1
    [3,  8, 7, 2, 9, 14, 19] # step 2
    [3,  8, 7, 2, 9, 14, 19] # step 3
    [3,  7, 2, 8, 9, 14, 19] # step 4
    [3,  2, 7, 8, 9, 14, 19] # step 5
    [2,  3, 7, 8, 9, 14, 19] # step 6

    [2,  3, 7, 8, 9, 14, 19] # after

---------------

## Bubble-Sort Program - in C

    !c
    #include <stdio.h>

    #define ARRAY_SIZE (8)   /* 配列の要素数 */

    int main(void)
    {
        int array[ARRAY_SIZE] = { 7, 14, 33, 10, 2, 19, 37, 20 };
        int i, j, work;

        for(i=1; i<ARRAY_SIZE; ++i) {
            for(j=0; j <ARRAY_SIZE-i ; ++j) {
                if( array[j] > array[j+1] ) {
                    work = array[j];
                    array[j] = array[j+1];
                    array[j+1] = work;
                }
            }
        }

        /* 結果表示 */
        for(i=0; i<ARRAY_SIZE; ++i)
        {
            printf( "%2d ", array[i] );
        }
        printf( "\n" );
        
        return 0;
    }

---------------

## Bubble-Sort Program - ヒント

## ヒント

* forの書き方
* 配列の定義の仕方
* 配列の要素数を取得する
* 配列の要素に順番にアクセスできる (出力時に使える)

---------------

## Bubble-Sort Program - in Ruby A

## in Ruby

    !ruby
    array = [7, 14, 33, 10, 2, 19, 37, 20]

    for i in (1..array.size-1)
      for j in (0..array.size-1-i)
        if array[j] > array[j+1]
          work = array[j]
          array[j] = array[j+1]
          array[j+1] = work
        end
      end
    end

    for element in array
      printf("%2d ", element);
    end

---------------

## Bubble-Sort Program - in Ruby B

## in Ruby

    !ruby
    array = [7, 14, 33, 10, 2, 19, 37, 20]

    for i in (0..array.size-1)
      for j in (i+1..array.size-1).to_a.reverse
        if array[j] < array[j-1]
          work = array[j]
          array[j] = array[j-1]
          array[j-1] = work
        end
      end
    end

    for element in array
      printf("%2d ", element);
    end


---------------


# おわり.. お疲れ様です！


