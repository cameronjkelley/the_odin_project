def stock_picker(prices)
	buy_sell = []
	profit = 0
	
	prices.each do |buy|
		sell = buy + 1		
		margin = (prices[sell].to_i) - buy
		if margin > profit
			profit = margin
			buy_sell.pop
			buy_sell.push(prices.index(buy), prices.index(prices[sell]))
		end
		sell += 1 unless sell == prices.length - 1
	end
	return buy_sell
end

print stock_picker([17,3,6,9,15,8,6,1,10])
