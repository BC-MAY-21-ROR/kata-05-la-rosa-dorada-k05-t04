class GildedRose

  def initialize(items)
    @items = items
  end
# Ternary  suma<0 ? true : false
 
  def sumQuality (item)
    item.quality += 1 
  end
  
 def resQuality (item)
  item.quality-=1
 end 
  
  def update_quality()
    @items.each do |item|
      #no es nada importante resta la calidad
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            resQuality(item)
          end
        end
      else
        if item.quality < 50
          sumQuality(item)
          # si esta en backstage
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                sumQuality(item)
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                sumQuality(item)
              end
            end
          end
        end
      end
      #verifica que no sea sulfuras para decrementar sell_in
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      # Verífica la calidad de venta
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                resQuality(item)
              end
            end
          # Backstage 
          else
            item.quality = item.quality - item.quality
          end
        #aumenta calidad brie  
        else
          if item.quality < 50
            sumQuality(item)
          end
        end
      end
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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
