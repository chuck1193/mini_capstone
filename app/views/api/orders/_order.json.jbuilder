json.id order.id
json.user_id order.user_id
json.quantity order.quantity
json.subtotal order.subtotal
json.tax order.tax
json.total order.total

json.product do 
  json.partial! order.product, partial: 'api/products/product', as: :product
end


json.formatted do
  json.subtotal number_to_currency(order.subtotal)
  json.tax number_to_currency(order.tax)
  json.total number_to_currency(order.total)
end