if current_user
  json.current_user current_user
end

json.partial! @product, partial: "product", as: :product 