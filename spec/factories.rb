FactoryGirl.define do
  factory :good do
    name {Faker::Commerce.product_name}
    articul{ Faker::Number.number(10) }
    sequence(:keyword){|n| "keywords #{n}" }
    sequence(:description){|n| "Description #{n}" }
    sequence(:img){|n| "phone-index.jpg" }
    category
    sequence(:anons){|n| "Anons #{n}" }
    content {Faker::Lorem.paragraph}
    visible true
    hits true
    fresh true
    sale false
    price {Faker::Commerce.price}
    img_slide "hggftry"
  end

  factory :category do
    sequence(:title){|n| "Category #{n}"}
    keyword{Faker::Commerce.department}
    description{ Faker::Commerce.department(7) }
    sequence(:img){|n| " img#{n}.img" }
    content{ Faker::Lorem.paragraph }
    parent_id 0
  end

  factory :informer do
    sequence (:name) {|n| "Informer #{n}"}
    sequence (:informer_position) {|n| n }
  end

  factory :link do
    sequence (:title){|n| "Link Title #{n}"}
    sequence(:keyword){Faker::Commerce.department}
    sequence(:description){Faker::Commerce.department(7)}
    sequence(:content){ Faker::Lorem.paragraph }
    sequence (:link_position) {|n| n }
    informer
  end

  factory :customer do
    login {Faker::Internet.user_name}
    name {Faker::Name.name}
    password {Faker::Internet.password}
    email {Faker::Internet.email}
    address {Faker::Address.street_address}
    tel {Faker::PhoneNumber.cell_phone}
  end

  factory :dostavka do
    name {Faker::Lorem.word}
  end

  factory :payment do
    name {Faker::Lorem.word}
  end
  
  factory :page do
    title {Faker::Lorem.word}
    keyword {Faker::Lorem.word}
    description {Faker::Lorem.paragraph}
    content {Faker::Lorem.paragraph}
  end

  factory :news do
    title {Faker::Lorem.word}
    keywords {Faker::Lorem.word}
    description {Faker::Lorem.paragraph}
    anons {Faker::Lorem.paragraph}
    content {Faker::Lorem.paragraph}
  end

end

#Category.create(title: 'Ericson', keyword: 'fdf', description: 'jfjf', img: 'hdjfh', content: 'content ', parent_id: 0)
#Category.create(title: 'SonyEricson', keyword: 'fdf', description: 'jfjf', img: 'hdjfh', content: 'content ', parent_id: 1)
#Category.create(title: 'Nokia', keyword: 'fdf', description: 'jfjf', img: 'hdjfh', content: 'content ', parent_id: 0)
#Good.create(name: 'Ericson S 32Gb (черный)', keyword: 'Sony Xperia S 32Gb (черный)', description: 'Sony Xperia S 32Gb (черный)', articul: 'fdfsf', img: 'phone-index.jpg', category_id: 1, anons: 'fgfgf', content: 'jguibug', price: 345, img_slide: '2_1.jpg|2_2.jpg|2_3.jpg|2_7.jpg')
#Good.create(name: 'Sony S 32Gb ', keyword: 'Sony Xperia S 32Gb (черный)', description: 'Sony Xperia S 32Gb (черный)', articul: 'f345sf', img: 'phone-index.jpg', category_id: 2, anons: 'fgfgf', content: 'jguibug', price: 345, img_slide: '2_1.jpg|2_2.jpg|2_3.jpg|2_7.jpg')
#Good.create(name: 'Nokia Xperia S 32Gb (черный)', keyword: 'Sony Xperia S 32Gb (черный)', description: 'Sony Xperia S 32Gb (черный)', articul: 'f234f', img: 'phone-index.jpg', category_id: 3, anons: 'fgfgf', content: 'jguibug', price: 345, img_slide: '2_1.jpg|2_2.jpg|2_3.jpg')

#Characteristic.create(name: 'Диагональ экрана, дюйм:')
#Characteristic.create(name: 'Тип дисплея:')
#Characteristic.create(name: 'Сенсорный экран:')
#Characteristic.create(name: 'GPS-навигация:')
#Characteristic.create(name: 'Фотокамера:')
#Characteristic.create(name: 'Встроенная памятьб Мб.:')
#Characteristic.create(name: 'Wi-Fi:')

#Goodparam.create(value: '4,2', characteristic_id: 1, good_id: 1)
#Goodparam.create(value: '4,5', characteristic_id: 1, good_id: 2)
#Goodparam.create(value: 'TFT', characteristic_id: 2, good_id: 1)
#Goodparam.create(value: 'Есть', characteristic_id: 3, good_id: 1)
#Goodparam.create(value: 'Есть', characteristic_id: 4, good_id: 1)
#Goodparam.create(value: '12 м/п', characteristic_id: 5, good_id: 1)
#Goodparam.create(value: '4000', characteristic_id: 6, good_id: 1)
