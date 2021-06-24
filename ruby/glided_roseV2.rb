# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end
  # Ternary  suma<0 ? true : false

  def sumQuality(item)
    item.quality += 1
  end

  def resQuality(item)
    item.quality -= 1
  end

  def quality50?(item)
    item.quality < 50
  end

  def backstage(item)
    sumQuality(item) if item.sell_in < 11
    sumQuality(item) if item.sell_in < 6 && (item.quality < 50)
    item.quality -= item.quality if item.sell_in.negative?
  end

  def prodCalidS(item)
    case item.name
    when 'Aged Brie'
      ageBrie item
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage item
    else
      quality0 item
    end
  end

  def ageBrie(item)
    sumQuality item
    sumQuality item if item.sell_in.negative?
  end

  def prodCalidR(item)
    if item.name == 'Conjured Mana Cake'
      item.quality -= 2
    else
      resQuality item
    end
  end

  def restSell_in(item)
    item.sell_in -= 1
  end

  def notsulfuras?(item)
    item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def sell_in?(_item)
    items.sell_in.zero?
  end

  def backstage0(item)
    item.quality = 0
  end

  def quality0(item)
    prodCalidR item if item.quality.positive?
  end

  def update_quality
    @items.each do |item|
      prodCalidS item if quality50? item
      restSell_in item if notsulfuras? item
      backstage0 item if item.sell_in.zero? && item.name == 'Backstage passes to a TAFKAL80ETC concert'
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
