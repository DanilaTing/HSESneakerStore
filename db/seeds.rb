# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

Brand.create([
  {
    name: 'Adidas'
  }, {
    name: 'Nike'
  }, {
    name: 'Puma'
  }, {
    name: 'Reebok'
  }, {
    name: 'Vans'
  }
])

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

Sneaker.create([
  {
    brand_id: random_brand_id,
    model: 'NMD R1 Japan Black',
    sex: 'unisex',
    price: 0,
    image: upload_fake_image
  }, {
    brand_id: random_brand_id,
    model: 'Sock Dart Peach',
    sex: 'female',
    price: 0,
    image: upload_fake_image
  }, {
    brand_id: random_brand_id,
    model: 'Insta Pump White',
    sex: 'unisex',
    price: 0,
    image: upload_fake_image
  }
])
