Saeki 魔法石 Project
===============

Saeki 魔法石 特設サイト　

## 概要

### SLA
  * IE（9以上）
  * Chrome
  * Safari

## ツール

* gulp
* bower
* CoffeeScipt
* Sass（SCSS）

#### JavaScriptライブラリ

* jQuery
* CreateJS

---

### インストール方法

#### node.jsをインストール (v0.10以上)

http://nodejs.org/
インストール方法は割愛

#### gulpをインストール

```
$ npm install -g gulp
```

#### bowerをインストール

```
$ npm install -g bower
```

#### npmパッケージをインストール

```
#プロジェクトのディレクトリに移動して
$ cd saekiMagicStone
$ npm install
```

#### bowerパッケージをインストール

```
$ bower install
```

以下のようなディレクトリ構成になるはず

```
├── app
│   ├── bower_components
│   ├── index.html
│   └── javascripts/stylesheets 等
├── node_modules
│   └── パッケージ各種
├── .bowerrc
├── .git
├── .gitignore
├── README.md
├── bower.json
├── gulpfile.coffee
└── package.json
```

---

### gulpを実行

```
$ gulp watch
```

http://localhost:4567/ がブラウザで開く

Chromeなら[livereload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)
が入っているとオートリロードされる。

### その他

JavaScriptを修正するときは /src/javascripts/*.coffeeを修正する
CSSを修正するときは /src/stylesheets/*.scssを修正する
それ以外はそのファイルを調節編集
