require 'sinatra'
require 'httparty'
require 'nokogiri'

get '/' do
  stock = params[:stock]
  symbol = stock.downcase
  response = HTTParty.get("http://finance.yahoo.com/q?s=#{symbol}")
  dom = Nokogiri::HTML(response.body)
  my_span = dom.xpath("//span[@id='yfs_l84_#{symbol}']").first.content
  "The current stock price is $#{my_span}"

end








