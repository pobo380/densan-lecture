

# 03 More Ruby like.


---------------

# はじめに

## 前回の内容

CとRubyとの文法上の(syntax)違い

## 今回の内容

CにはないRuby独自の機能(semantics)

---------------

# リテラル

---------------

## 式展開*

## Description

ダブルクォートで囲まれた文字列(ex."hello")やヒアドキュメント(後述)の中では、#{式}という形で
式の内容を文字列化したものを埋め込むことができる。

## Example

    !ruby
    name = 'pobo380'
    puts "Hello, my name is " + name + "."
    puts "Hello, my name is #{name}."

## Tips

 * シングルクォートの場合は使えない。
 * "式"なので、関数呼び出しでもなんでもあり。

---------------

## ヒアドキュメント*

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

 * "&lt;&lt;-識別子"と書くと、"識別子"の前にインデントを行うことができる。
 * 一行に複数のヒアドキュメントを書くことができる。
 * "識別子"をシングルクォート・ダブルクォートで囲うと、対応する性質の文字列リテラルとなる。
   デフォルト(省略時)ではダブルクォートの性質を持つ。

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
 * 定義されていないキーの値を取得しようとした場合はnilが返ってきます。(デフォルトの挙動)

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
    def function(a, b, c)
      puts a + b * c
    end

    function(*[1, 2, 3])

## Tips

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


---------------

## イテレータ*

http://i.loveruby.net/ja/ruby/iterator.html

## forとの違い


---------------

## ブロック付きメソッド

## under construction


---------------

## 手続きオブジェクト*

## under construction


---------------

# オブジェクト

---------------

# 例外

---------------

# 正規表現

---------------

