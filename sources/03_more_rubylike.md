

# 03 More Ruby like.


---------------

# はじめに

## 前回の内容

CとRubyとの文法上の(syntax)違い

## 今回の内容

CにはないRuby独自の機能(semantics)

---------------

# その前に.. 前回やり残した内容

---------------

## メソッド(関数)の定義

## Description

Rubyでは関数のことを「メソッド」と呼びます。この呼称はオブジェクト指向に由来します。

## Example

    !ruby
    def calc(x, y = 2, *z)
      sum = 0
      for e in z
        sum = sum + e
      end
      return x * y + sum
    end

    puts calc(2, 3, 1, 2, 3, 4)

## Tips

 * 引数の定義は以下の順に行わなければいけません。
 * デフォルト式のない引数(複数指定可)
 * デフォルト式のない引数(複数指定可)
 * \* を伴う引数(1つだけ指定可)
 * & を伴う引数(1つだけ指定可)

---------------

## 変数のスコープ

## Description

変数のスコープとは、宣言した変数が参照可能であるプログラム上の範囲のことです。
Rubyでは、制御構文(if, for, while, etc..)内で宣言した変数をその外から参照することができます。
また、メソッド定義の中では外で定義された変数を参照することはできません。

## Example

    !ruby
    str = 'bye'

    if true
     str = 'hello'
    end
    
    puts str # => hello

    def hello
      puts str
    end

    hello # => Error!

## Tips

 * 上記の特徴は、制御構文では「新しいスコープが導入されず」、メソッド定義では「新しいスコープが導入される」と表現されます。

---------------

## 演習A

## Exercise A-1

メソッドを定義してみましょう。
与えられた数を２倍して５を足した数を返すメソッドcalcを定義してみてください。

    !ruby
    calc(2) # => 9
    calc(5) # => 15

## Excercise A-2

if文を使って出力する文字列を変えてみましょう。
整数を入力するコードを以下に示します。

    !ruby
    gets.to_i

---------------

# リテラル

---------------

## 式展開*

## Description

ダブルクォートで囲まれた文字列(ex."hello")やヒアドキュメント(後述)の中では、#{式}という形で
式の内容を文字列化したものを埋め込むことができます。

## Example

    !ruby
    name = 'Noda Kohei'
    puts "Hello, my name is " + name + "."
    puts "Hello, my name is #{name}."

    def age
      22
    end

    puts "I'm #{age}"
    puts 'I'm #{age}'

## Tips

 * シングルクォートの場合は使えません。
 * "式"なので、メソッド呼び出しでもなんでもありです。


---------------

## ヒアドキュメント

## Description

ヒアドキュメントは、"&lt;&lt;識別子"を含む次の行から、"識別子"だけの行の直前までを文字列とする、
「行指向」な文字列リテラルです。

## Example

    !ruby
    print "  the string\n  next line\n"
    
    print <<EOS # End of String
      the string
      next line
    EOS

## Tips

 * "&lt;&lt;-識別子"と書くと、"識別子"の前にインデントを行うことができます。
 * 一行に複数のヒアドキュメントを書くことができます。
 * "識別子"をシングルクォート・ダブルクォートで囲うと、対応する性質の文字列リテラルとなります。
   デフォルト(省略時)ではダブルクォートの性質を持ちます。

---------------

## ハッシュテーブル*

## Description

ハッシュテーブル(通称ハッシュ)は、キーと呼ばれる文字列とバリューと呼ばれるデータの組み合わせからなるデータ構造です。
キーに対応する値(バリュー)にすばやくアクセスすることができます。

## Example

    !ruby
    hash = {:happy => '(^-^)', :sad => '(T-T)', :sorry => 'm(_ _)m'}
    
    puts hash[:happy]
    puts hash[:sad]
    puts hash[:sorry]

## Tips

 * ":文字列"というリテラルは、「シンボル」と呼ばれるものです。
   変更不可能(immutable)な文字列リテラル、と考えてください。
 * 通常キーにはシンボルを用いますが、通常の文字列でもOKです。
 * 定義されていないキーの値を取得しようとした場合はnilが返ってきます。(デフォルトの挙動)

---------------

## 演習B

## Excercise B-1

式展開を用いて自己紹介をしましょう。以下のフォーマットを用いて下さい。

    !xml
    こんにちは、私は〜です。私は〜歳です。 〜から来ました。

## Excercise B-2

ヒアドキュメントを用いて自己紹介をしましょう。以下のフォーマットを用いて下さい。

    !xml
    こんにちは、私は〜です。
    私は〜歳です。
    〜から来ました。

## Excercise B-3

ハッシュを用いて自己紹介をしましょう。自己紹介の為のデータはひとつの変数にまとめてください。
以下のフォーマットを用いて下さい。

     !xml
     こんにちは、私は〜です。
     私は〜歳です。
     〜から来ました。

---------------

# 代入と引数

---------------

## 多重代入*

## Description

多重代入は、複数の式や配列から同時に代入を行います。

## Example

    !ruby
    foo, bar, baz = 1, 2, 3 # foo => 1, bar => 2, baz => 3

    array = [1, 2, 3]
    foo, bar, baz = array   # foo => 1, bar => 2, baz => 3
    foo, *bar = array       # foo => 1, bar => [2, 3]

    (foo, bar), baz = [1, 2], 3 # foo => 1, bar => 2, baz => 3

    foo, * = 1, 2, 3        # foo => 1

## Tips

 * 右辺の式が一つしか与えられなかった場合、式を評価した値は配列に変換されて、
   各要素が左辺のそれぞれの式に代入されます。
 * 左辺の要素の数よりも配列の要素の数の方が多い場合には、余った要素は無視されます。
 * 配列の要素が足りない場合には対応する要素の無い左辺には nil が代入されます。
 * 左辺の最後の式の直前に * がついていると、対応する左辺のない余った要素が配列として代入されます。
   余った要素が無い時には空の配列が代入されます。

---------------

## 配列の展開

## Description

配列の展開は、配列を多重代入の右辺へと明示的に変換します。

## Example

    !ruby
    def function(a, *b)
      puts a + b[0] * b[1]
    end

    function(*[1, 2, 3])

## Tips

 * メソッドへの引数の渡し方には、多重代入とほとんど同じルールが適用されます。
 * 配列の展開という用語は、私が勝手に使っているだけです。

---------------

## ハッシュの畳み込み

## Description

メソッドの最後尾の引数には、{}を用いずにハッシュリテラルを記述することができます。

## Example

    !ruby
    def function(hash)
      puts hash[:smile]
    end

    function(:smile => '(^-^)')

## Tips

 * ハッシュの畳み込みという用語は、私が勝手に使っているだけです。

---------------

## 演習C

## Excercise C-1

多重代入を用いて、次の計算を成立させてください。
"数字の配列"には任意の数字を要素とする配列を、"変数列"には多重代入を行う変数x,y,zを記述してください。

    !ruby
    a, b, c = 数字の配列
    変数列 = [a, [b, c], "#{x+y+z}"]

    puts x * y + z

## Excercise C-2

配列の展開を用いて、任意の数の引数を受け取りそれらの合計を返すメソッドsumを定義してみましょう。

    !ruby
    sum(3, 2, 8) # => 13
    sum(5, 4, 5, 9, 1) # => 24

## Excercise C-3

ハッシュの畳み込みを用いて、自己紹介をするメソッドself_introduceを定義してみましょう。

    !xml
    私の名前は〜です。
    私は〜歳です。
    〜から来ました。

---------------

# 制御構造

---------------

## unlessとuntil*

## Description

unlessは、条件式が偽であるときに与えられた式を評価します。
untilは、条件式が偽であるときにループを継続します。

## Example

    !ruby
    i = 0
    until i == 5
      puts "#{i}" unless i != 3
      i = i + 1
    end

## Tips

 * unless式にelsifを指定することはできません。

---------------

## 修飾子*

## Description

修飾子は、"式 修飾子 式"のという文法を取る制御構文です。if, unless, while, untilの修飾子が存在します。

## Example

    !ruby
    i = 0
    puts i = i + 1 while i < 5

    i = 0
    puts i unless (i = i + 1) == 3 until i == 5

 * 修飾子にelseを指定することはできません。


---------------

## イテレータ*

## Description

イテレータは、配列やハッシュ等のデータ構造に順次アクセスするためのメソッドです。
forやwhileによる順次アクセスを更に抽象化したものと考えられます。

## Example

    !ruby
    array = ["ruby", "scala", "haskell"]

    array.map! do |element|
      element.capitalize
    end

    array.each {|element|
      puts "#{element} is cool!"
    }

## Tips

 * Rubyには多くの組み込みのイテレータが存在します。リファレンスを確認してみてください。
 * [http://doc.okkez.net/static/187/class/Array.html](http://doc.okkez.net/static/187/class/Array.html)

---------------

## 演習D

## Excercise D-1

unlessとuntilを用いて１から１００までの"3の倍数でない数の和"を求めてみましょう。

    !ruby
    answer = 3367

## Excercise D-2 *

Excercise D-1で書いたコードを修飾子を用いて書きなおしてみましょう。
untilを修飾子にするのは少し難しいかもしれません。

    !ruby
    answer = 3367

## Excercise D-3

Excercise D-1で書いたコードをイテレータを用いて書きなおしてみましょう。
if, unlessのどちらを用いてもよいです。

    !ruby
    answer = 3367


---------------

# ブロック

---------------

## ブロック付きメソッド

## Description

Rubyでは、メソッドの後ろにdo ... end または { ... } で囲われたコードの断片(ブロックと呼ばれる)を
後ろにつけて呼び出すと、そのメソッドの内部からブロックを呼び出す(実行する)ことができます。

## Example

    !ruby
    def foo
      yield 2, 3
    end

    def bar(&block)
      block.call(2, 3)
    end

    foo do |x, y|
      puts x * y
    end

    bar {|x, y| puts x + y }

## Tips

 * ブロックは値を返すことができます。その場合returnではなくnextキーワードを用います。
 * ブロックでは、新しいスコープが導入されます。また、外側の変数を参照することができます。

---------------

## 手続きオブジェクト

## Description

Rubyでは、前述のブロックをデータとして扱うことができます。これを手続きオブジェクトといいます。
lambda{|引数|} , proc{}, Proc.new do ... end, などの記法があり、ブロック.call(引数)で呼び出すことができます。

## Example

    !ruby
    var = lambda {|x, y|
      puts x * y
    }
    var.call(2, 3)

    var = proc {|x, y|
      puts x + y
    }
    var.call(2, 3)

    lambda{ puts 'hello' }.call

## Tips

 * 引数の定義は省略することができます。
 * [lambda と proc と Proc.new とイテレータの違い](http://doc.okkez.net/static/192/doc/spec=2flambda_proc.html#lambda_proc)

---------------

## 演習E

## Excercise E-1 *

ブロックの戻り値をputsで出力するブロック付きメソッドoutputを定義してみましょう。
また、ブロックでは自身の外側で宣言された変数にもアクセスすることができます。
これを用いて、外側の変数をブロック付きメソッドに渡して出力してみましょう。

    !ruby
    output do
      "hello!"
    end
    # => hello!

## Excercise E-2 *

手続きオブジェクトはデータです。変数に入れることや、メソッドの引数や戻り値にすることができます。
"hello!と出力する手続きオブジェクト"を返すメソッドhello_procを定義してみましょう。

    !ruby
    hello_proc.call
    # => hello!

---------------

# 応用問題

---------------

## A. イテレータを作ってみよう

yieldを用いるとオリジナルのイテレータを実装することができます。
配列を受け取り、インデックスが偶数の要素に対して繰り返しを行うようなイテレータeach_evenを作ってみましょう。

## Code

    !ruby
    each_even([2, 8, 1, 4]) do |e|
      puts e
    end
    # => 8
    #    4

## Hint

キーボードの 2 を押すと表示されます。

.notes: 頑張る君を応援します！

---------------

## B. switch文なんて要らない！

ハッシュテーブルと手続きオブジェクトを用いると、switch文のような分岐を行うことができます。
次のプログラムをcase, whenを用いずに書きなおして下さい。

## Code

    !ruby
    str = gets.chomp

    case str
    when "hello"
      puts "(0-0)/ Hi!"
    when "bye"
      puts '(T-T)/ Bye..'
    when "owata"
      puts '\(^o^)/'
    end

## Hint

キーボードの 2 を押すと表示されます。

.notes: ハッシュに手続きオブジェクトを格納します。

.notes: ハッシュのキーは文字列を設定できるので・・・


---------------

## C. 数当てゲーム

次の仕様の「数当てゲーム」を作成して下さい。

## 仕様

 * 乱数を用いて0〜100の数を生成します。
 * ユーザーに数字を入力してもらい、生成した数より大きければ"High"小さければ"Low"と出力します。
 * 等しければ"Hit"と表示してプログラムを終了します。

## 必要なコード

    !ruby
    rand      # 0〜1の乱数を生成する
    gets.to_i # ユーザーの入力を整数として受け取る

## 実行サンプル

    !xml
    > 50
    High
    > 25
    Low
    > 32
    Hit!

---------------


# 今週はここまでです。


---------------

# 次回は...!

## オブジェクト

## 例外

## 正規表現

## シンボル

## ファイル分割

## sprintf式

## 配列の便利な扱い方

## すべての式は値を返す

## メソッドチェイン

(順不同)

---------------


# お疲れ様でした！


