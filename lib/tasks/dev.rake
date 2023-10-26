desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  # Seed Categories table with sample data

  # if Rails.env.development?
  #   OrderItem.destroy_all
  #   Order.destroy_all
  #   InventoryTransaction.destroy_all
  #   Location.destroy_all
  #   Product.destroy_all
  #   Report.destroy_all
  #   Role.destroy_all
  #   Supplier.destroy_all
  #   User.destroy_all
  #   Category.destroy_all
  # end

  # people = []

  # people << { first_name: "Alice", last_name: "Smith" }
  # people << { first_name: "Bob", last_name: "Smith" }
  # people << { first_name: "Carol", last_name: "Smith" }
  # people << { first_name: "Doug", last_name: "Smith" }

  10.times do
    Category.create(
      name: Faker::Commerce.department,
      description: Faker::Lorem.sentence,
      subcategory: Faker::Commerce.department,
    )
  end

  # Seed InventoryTransactions table with sample data
  20.times do
    InventoryTransaction.create(
      transaction_type: %w(incoming_return outgoing_return incoming_sale outgoing_sale).sample,
      quantity: Faker::Number.between(from: 1, to: 100),
    )
  end

  # Seed Locations table with sample data
  10.times do
    Location.create(
      name: Faker::Address.community,
      description: Faker::Lorem.sentence,
      address: Faker::Address.full_address,
    )
  end

  # Seed OrderItems table with sample data
  # 30.times do
  #   OrderItem.create(
  #     quantity_ordered_id: Faker::Number.between(from: 1, to: 20),
  #     unit_price_id: Product.price,
  #     shipping_cost_id: Faker::Number.between(from: 1, to: 30),
  #   )
  # end

  # Seed Orders table with sample data
  15.times do
    Order.create(
      expected_delivery: Faker::Time.forward(days: 30),
      status: %w(delivered processing in_transit).sample,
      description: "#{["FedEx", "UPS", "USPS"].sample} tracking ##{rand(1000000000000)}",
    )
  end

  # Seed Products table with sample data
  50.times do
    Product.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      sku: Faker::Number.unique.number(digits: 6),
      price: Faker::Commerce.price(range: 10.0..100.0),
      stock_quantity: Faker::Number.between(from: 0, to: 1000),
      category_id: Faker::Number.between(from: 1, to: 10),
    )
  end

  # Seed Reports table with sample data (probably not gonna use this but just in case)
  10.times do
    Report.create(
      report_type: Faker::Lorem.word,
      date: Faker::Time.backward(days: 90),
      data_criteria: Faker::Lorem.sentence,
    )
  end

  # Seed Roles table with sample data (probably not gonna use this either but just in case)
  # 5.times do
  #   Role.create(
  #     admin_id: Faker::Number.between(from: 1, to: 10),
  #     staff_id: Faker::Number.between(from: 1, to: 10),
  #     manager_id: Faker::Number.between(from: 1, to: 10),
  #   )
  # end

  # Seed Suppliers table with sample data
  10.times do
    Supplier.create(
      name: Faker::Company.name,
      contact_info: Faker::Internet.email,
      description: Faker::Company.catch_phrase,
      standing: %w(good arrears).sample,
    )
  end

  # Seed Users table with sample data
  20.times do
    User.create(
      email: Faker::Internet.email,
      encrypted_password: "password",
      role: %w(admin staff manager).sample,
      bio: Faker::Lorem.paragraph,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      image: Faker::Avatar.image,
    )
  end

  puts "Sample data has been seeded into the database."
end
