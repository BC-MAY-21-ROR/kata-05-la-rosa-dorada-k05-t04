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
   def quality50? (item)
        item.quality<50

    end 
    def backstage (item)
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
    
    def sell_in?(item)
        items.sell_in==0
    end
    def update_quality()
      @items.each do |item|
        case item.name
        when 'Conjured Mana Cake'
            resQuality(item)
        when 'Aged Brie'
            
        when 'Backstage passes to a TAFKAL80ETC concert'
        
        when 'Sulfuras'
            item.sell_in = nil
            item.quality = item.quality
        else
            item.sell_in=-1
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
  