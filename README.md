# [生きたスタイルガイドのためのKSS](https://app.codegrid.net/entry/kss-1)

[CodeGrid](http://www.codegrid.net/)の「[生きたスタイルガイドのためのKSS](https://app.codegrid.net/entry/kss-1)」の記事内で使用しているサンプルです。

各サンプルの解説については上記記事をご確認ください。

## 動作環境

Rubyの実行環境及びRubyGemsの[Bundler](http://bundler.io/)が導入済みの環境を対象としています。

## サンプルの内容

KSSを利用して作るスタイルガイドのサンプルです。  
回を追ってスタイルガイドを充実させていきます。

### タグ

各回で紹介しているサンプルのバージョンにはタグが付けてあるので、それを使って移動します。

```sh
# 例
$ git checkout v1.0.0
```

- `v1.0.0` 自分の環境上で最低限の準備をしたKSSを動かします
- `v2.0.0` ボタンモジュールに別パターンのスタイルを追記します

## サンプルの使い方

以下のように実行します。

```sh
$ git clone https://github.com/pxgrid/codegrid-kss.git
$ cd codegrid-kss.git
$ bundle install --path vendor/bundle
$ bundle exec ruby app.rb

# Webブラウザで http://localhost:4567 を開く
```
