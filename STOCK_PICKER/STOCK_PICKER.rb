def stock_picker(stock_prices_array)
  best_deal = {
    buy_day: 0,
    buy_day_price: 0,
    sell_day: 0,
    sell_day_price: 0,
    price_difference: 0,
  }

  stock_prices_array.length.times do |index|
    buy_day_price = stock_prices_array[index]
    shortened_array = stock_prices_array.drop(index)
    best_relative_sell_price = shortened_array.drop(index).max
    unless best_relative_sell_price == nil
      price_difference = best_relative_sell_price - buy_day_price
      if price_difference > best_deal[:price_difference]
        best_deal[:buy_day] = index
        best_deal[:buy_day_price] = buy_day_price
        best_deal[:sell_day] = shortened_array.index(best_relative_sell_price) + index
        best_deal[:sell_day_price] = best_relative_sell_price 
        best_deal[:price_difference] = price_difference
      end
    end
  end

  p best_deal
end