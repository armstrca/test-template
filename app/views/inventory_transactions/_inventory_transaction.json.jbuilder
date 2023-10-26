json.extract! inventory_transaction, :id, : location, : order_item, : order, : report, : role, : supplier, : user, :created_at, :updated_at
json.url inventory_transaction_url(inventory_transaction, format: :json)
