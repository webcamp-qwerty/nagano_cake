# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# ながのケーキ
　長野県にある小さな洋菓子店「ながのケーキ」のECサイトです！
# サイト概要
　元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう
  になった。
  InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管
  理機能を含んだ通販サイトを開設しようと思い至った。
# 特徴
  * 受注生産なのでロスが出ない！
  * 送料一律800円！
  * クレジット、銀行振り込み対応！
  * 御自宅以外にも配送できる便利機能付き！
# 追加ポイント
  * 配送先選択画面で新規配送先を選択した場合、その配送先が配送先住所に自動追加される
  * 同一のidを持つ商品をカート内に入れるとき、個数のみの更新を行う
  * 検索、ジャンル検索機能をついかした
 # 開発環境
  * ruby on rails 5.2.5
  * html
  * css
  * ruby
# 使用方法
　$ git clone git@github.com:webcamp-qwerty/nagano_cake.git (SSH)  
  $ cd nagano_cake  
  $ bundle install  
  $ rails db:migrate  
  $ rails db:seed
  $ rails s
