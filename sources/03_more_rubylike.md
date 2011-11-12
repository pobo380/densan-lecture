

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
また、関数定義の中では外で定義された変数を参照することはできません。

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

 * 上記の特徴は、制御構文では「新しいスコープが導入されず」、関数定義では「新しいスコープが導入される」と表現されます。

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
 * "式"なので、関数呼び出しでもなんでもありです。


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
    def function(a, *b)
      puts a + b[0] * b[1]
    end

    function(*[1, 2, 3])

## Tips

 * 関数への引数の渡し方には、多重代入とほとんど同じルールが適用されます。
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

## Description

イテレータは、配列やハッシュ等のデータ構造に順次アクセスするためのメソッドです。
forやwhileによる順次アクセスを更に抽象化したものと考えられます。

## Example

    !ruby
    array = ["ruby", "scala", "haskell"]

    array.map! do |element|
      element.capitalize
    end

    array.each do |element|
      puts "#{element} is cool!"
    end

## Tips

 * Rubyには多くの組み込みのイテレータが存在します。リファレンスを確認してみてください。
 * [http://doc.okkez.net/static/187/class/Array.html](http://doc.okkez.net/static/187/class/Array.html)


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

    bar { |x, y|
      puts x + y
    }

## Tips

 * ブロックでは、新しいスコープが導入されます。また、外側の変数を参照することができます。

---------------

## 手続きオブジェクト

## Description

Rubyでは、前述のブロックをデータとして扱うことができます。これを手続きオブジェクトといいます。

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

## Tips

 * [lambda と proc と Proc.new とイテレータの違い](http://doc.okkez.net/static/192/doc/spec=2flambda_proc.html#lambda_proc)

---------------

# オブジェクト

---------------

# 例外

---------------

# 正規表現

---------------

