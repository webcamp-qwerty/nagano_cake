# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: 'testtest'
)

Genre.create!(
   [
     {
       name: 'ケーキ'
     },
     {
       name: 'プリン'
     },
     {
       name: 'クッキー'
     },
     {
       name: 'キャンディ'
     }
    ]
)

Item.create!(
   [
     {
       image: File.open('./app/assets/images/cakeimage1.jpeg'),
       name: 'ウェディングケーキ',
       introduct: 'これはウェディングケーキです',
       genre_id: '1',
       excluded_price: '6500',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cakeimage2.jpeg'),
       name: 'チョコレートケーキ',
       introduct: 'これはチョコレートケーキです',
       genre_id: '1',
       excluded_price: '1200',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cakeimage3.jpeg'),
       name: 'カップケーキ',
       introduct: 'これはカップケーキです',
       genre_id: '1',
       excluded_price: '300',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cakeimage4.jpeg'),
       name: 'イチゴケーキ',
       introduct: 'これはイチゴケーキです',
       genre_id: '1',
       excluded_price: '1100',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/purinimage1.jpeg'),
       name: 'プリンアラモード',
       introduct: 'これはプリンアラモードです',
       genre_id: '2',
       excluded_price: '850',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/purinimage2.jpeg'),
       name: 'イタリアンプリン',
       introduct: 'これはイタリアンプリンです',
       genre_id: '2',
       excluded_price: '300',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/purinimage3.jpeg'),
       name: '普通のプリン',
       introduct: 'これは普通のプリンです',
       genre_id: '2',
       excluded_price: '180',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/purinimage4.jpeg'),
       name: 'カスタードプリン',
       introduct: 'これはカスタードプリンです',
       genre_id: '2',
       excluded_price: '270',
       is_active: 'false'
     },
     {
       image: File.open('./app/assets/images/kukkiimage1.jpeg'),
       name: '普通のクッキー',
       introduct: 'これは普通のクッキーです',
       genre_id: '3',
       excluded_price: '20',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/kukkiimage2.jpeg'),
       name: 'チョコレートクッキー',
       introduct: 'これはチョコレートクッキーです',
       genre_id: '3',
       excluded_price: '30',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/kukkiimage3.jpeg'),
       name: 'オレオ',
       introduct: 'これはオレオです',
       genre_id: '3',
       excluded_price: '212',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/kukkiimage4.jpeg'),
       name: '人形クッキー',
       introduct: 'これは人形クッキーです',
       genre_id: '3',
       excluded_price: '25',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cyandyimage1.jpeg'),
       name: 'カラフルキャンディ',
       introduct: 'これはカラフルキャンディです',
       genre_id: '4',
       excluded_price: '5',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cyandyimage2.jpeg'),
       name: '古き良きキャンディ',
       introduct: 'これは古き良きキャンディです',
       genre_id: '4',
       excluded_price: '7',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cyandyimage3.jpeg'),
       name: '棒付きキャンディ',
       introduct: 'これは棒付きキャンディです',
       genre_id: '4',
       excluded_price: '10',
       is_active: 'true'
     },
     {
       image: File.open('./app/assets/images/cyandyimage4.jpeg'),
       name: 'りんご飴',
       introduct: 'これはりんご飴です',
       genre_id: '4',
       excluded_price: '15',
       is_active: 'true'
     }
    ]
)