# db/seeds.rb
require "faker"

puts "🧹 Clearing old data..."
PackingListItem.destroy_all
PackingList.destroy_all
Item.destroy_all
User.destroy_all

# ----------------------------
# Users
# ----------------------------
puts "👤 Creating users..."

test_user = User.create!(
  name: "Test User",
  email: "test@example.com",
  password: "password"
)

users = [ test_user ] + 10.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password"
  )
end

# ----------------------------
# Generic Items (shared pool)
# ----------------------------
puts "🎒 Creating generic items..."
TRAVEL_ITEMS = {
  "clothing"     => [ "t-shirt", "jeans", "jacket", "socks", "dress", "hat", "swimsuit" ],
  "shoes"        => [ "sneakers", "sandals", "hiking boots", "flip-flops" ],
  "accessories"  => [ "sunglasses", "scarf", "watch", "belt", "backpack" ],
  "toiletries"   => [ "toothbrush", "toothpaste", "shampoo", "soap", "razor", "sunscreen" ],
  "electronics"  => [ "phone charger", "laptop", "camera", "headphones", "power bank" ],
  "documents"    => [ "passport", "boarding pass", "travel insurance", "visa" ],
  "misc"         => [ "guidebook", "snacks", "water bottle", "first aid kit" ]
}

generic_items = []
TRAVEL_ITEMS.each do |category, names|
  names.each do |item_name|
    generic_items << Item.create!(
      name: item_name,
      category: category,
      user_id: nil # generic
    )
  end
end

# ----------------------------
# User-specific items
# ----------------------------
puts "🎒 Creating user-specific items..."
users.each do |user|
  5.times do
    # generate a unique name per user
    name = Faker::Commerce.unique.product_name
    category = Item::CATEGORIES.sample
    Item.create!(
      name: name,
      category: category,
      user: user
    )
  end
end

# ----------------------------
# Packing Lists
# ----------------------------
puts "📝 Creating packing lists..."
packing_lists = 20.times.map do
  PackingList.create!(
    name: "#{Faker::Verb.base.capitalize} Trip",
    destination: Faker::Address.city,
    user: users.sample
  )
end

# ----------------------------
# Packing List Items
# ----------------------------
puts "📦 Adding items to packing lists..."
packing_lists.each do |list|
  rand(3..7).times do
    # combine generic items + user's own items
    available_items = generic_items + list.user.items
    item = available_items.sample
    PackingListItem.create!(
      packing_list: list,
      item: item,
      status: [ "packed", "not_packed" ].sample
    )
  end
end

puts "✅ Done seeding!"
puts "  Users: #{User.count}"
puts "  Items: #{Item.count}"
puts "  Packing Lists: #{PackingList.count}"
puts "  Packing List Items: #{PackingListItem.count}"
