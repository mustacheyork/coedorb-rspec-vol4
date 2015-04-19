#「Ruby / Ruby on Rails ビギナーズ勉強会 第４回」での発表内容です。

■環境
rails 4.2.1
RSpec 3.0.0
ruby 2.2.1

###１）Railsプロジェクトを作成
```lang:.rb
$ rails new coedorb-vol4
```
###２）サーバを起動して、アクセス確認
・サーバ起動
```lang:.rb
$rails s
```
・ブラウザにアクセス
http://localhost/

###３）Rspecを導入する
・Gemfileに追記
```lang:.rb
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
end
```
```lang:.rb
$ bundle install
```
```lang:.rb
$ rails g rspec:install
```
・下記のファイルが生成されることを確認
```lang:.rb
$ rails g rspec:install
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```

・「.rspec」を編集
大量の警告を出す「--warning」オプションをひとまず削除しておきます。
「--color」オプションはRSpec実行時のログを色付けを行ってくれます。
「--require」オプションはRSpec実行前に特定のファイルを読み込んでくれます。

###４）テスト環境のデータベースを構築
```lang:.rb
$ rake db:test:prepare
```
###５）scaffoldを利用して、管理画面を生成
```lang:.rb
$ rails generate scaffold user name:string address:string
```
###６）生成されたモデルを、開発用データベースに反映
```lang:.rb
$ rake db:migrate
```
###７）追加したマイグレーションを、テスト用データベースにも反映
```lang:.rb
$ rake db:migrate RAILS_ENV=test
```
###８）生成された、spec/models/user_spec.rbを確認
```lang:.rb
require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```
###９）早速テストを走らせてみる
```lang:.rb
$ bundle exec rspec spec/models/user_spec.rb
*

Pending:
  User add some examples to (or delete) /Users/kanako/Documents/01_TickleCode/01_doc/02_rails4.2.1/coedorb-vol4/spec/models/user_spec.rb
    # Not yet implemented
    # ./spec/models/user_spec.rb:4

Finished in 0.00056 seconds (files took 7.44 seconds to load)
1 example, 0 failures, 1 pending
```
RSpecでは定義されている振る舞いの一つ一つを「サンプル（example）」と呼びます。
RSpecの出力は、サンプルが成功であれば「.」、失敗であれば「F」、保留であれば「*」を出力します。
各サンプルの詳細なレポート、最後に実行時間と全サンプル数、失敗したサンプル数、保留したサンプル数も出力します。

###１０）spec/models/user_spec.rbを編集する
```lang:.rb
require 'rails_helper'

RSpec.describe User, :type => :model do
    it "isn't valid without name" do
        user = User.new
        user.name = nil
        expect(user).not_to be_valid
    end
end
```
１０）テストが失敗することを確認する(モデルのバリデーションを実行していないので)
```lang:.rb
$ bundle exec rspec spec/models/user_spec.rb
F

Failures:

  1) User isn't valid without name
     Failure/Error: expect(user).not_to be_valid
       expected #<User id: nil, name: nil, address: nil, created_at: nil, updated_at: nil> not to be valid
     # ./spec/models/user_spec.rb:7:in `block (2 levels) in <top (required)>'

Finished in 0.02384 seconds (files took 9.52 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/models/user_spec.rb:4 # User isn't valid without name
```

１１）モデルにバリデーションを追加する。    app/models/user.rb
```lang:.rb
class User < ActiveRecord::Base
  validates :name, presence: true
end
```
１２）テストが成功することを確認する
```lang:.rb
$ bundle exec rspec spec/models/user_spec.rb
.

Finished in 0.1483 seconds (files took 8.71 seconds to load)
1 example, 0 failures
```

=============================================================
# postSnsApp
「Swiftビギナーズ勉強会 第６回@Co-Edo」の発表したサンプルです。  
※実際の投稿は、ユーザー自身がTwitterまたは、Facebookアカウントの設定をしていることが必要です。  

スライドはこちらから。  
http://www.slideshare.net/taichikanako/vol6-swiftsns  

イベントページはこちらです。  
https://swift-beginners.doorkeeper.jp/events/21881

Social.frameworkを利用して、TwitterやFacebookに投稿するアプリです。

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝ 

「CoEdo.rb」が運営する「Ruby / Ruby on Railsビギナーズ勉強会」Ruby、Ruby on Railsなどで開発したい、触りたいための初心者勉強会＆もくもく会です。

開催の連絡は以下の方法で受け取ることができます。 

## DoorKeeperグループ 
イベント申し込みを受け付けている、DoorKeeper でのグループです。  
https://coedo-rails.doorkeeper.jp/

## Facebookグループ: 
イベント告知や技術情報をお互いにシェアしています。   
https://www.facebook.com/groups/rorbeginners/

## Twitterハッシュタグ 
ハッシュタグは、 #rubybg です。   
Twitterにもイベント、勉強会の情報を流しています。 

 [★Ustreamでは、勉強会を生中継しています。](http://www.ustream.tv/channel/ruby-ruby-on-rails-%E3%83%93%E3%82%AE%E3%83%8A%E3%83%BC%E3%82%BA%E5%80%B6%E6%A5%BD%E9%83%A8)

 [★Youtubeでは、ショートセッションを収録しています。](https://www.youtube.com/playlist?list=PL2ojdc4KhtHniIyIUx3AdO621ydzz5zpP)


　　

