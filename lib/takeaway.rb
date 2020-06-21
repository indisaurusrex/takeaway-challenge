require_relative 'menu'

class Takeaway
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def see_menu
    display = String.new
    @menu.list.each do |dish, price|
      display << "#{dish}: £#{price}\n"
    end
    display
  end

  def place_order(item, quantity)
    validate_order(item, quantity)
    @order.store item, quantity
  end

  def check_total
    sum = 0
    @order.each do |item, quantity|
      sum += quantity * @menu.list[item.to_sym]
    end
    sum
  end

  private

  def validate_order(item, quantity)
    raise "Please order whole dishes only, thanks" unless quantity.is_a? Integer
    raise "Sorry we don't do that here" unless @menu.list.include?(item.to_sym) 
    raise "Are you having a laugh?!" if quantity.to_i < 1
  end

end
