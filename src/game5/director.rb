require_relative 'player'
require 'smalrubot'

module Game5
  class Director
    def initialize(input)
      @input = input
      @frm = 1

      @gu = Image.load('images/gu.png')
      @cho = Image.load('images/cho.png')
      @pa = Image.load('images/pa.png')
      @bou = Image.load('images/bou.png')
      @c1 = Image.load('images/c1.png')
      @c2 = Image.load('images/c2.png')
      @c3 = Image.load('images/c3.png')
      @aiko = Image.load('images/aiko.png')
      @kati = Image.load('images/kati.png')
      @make = Image.load('images/make.png')
      @x1 = 100
      @y1 = 200
      @x2 = 453
      @y2 = 200
      
      @i1 = 0
      @j1 = 0
      @k1 = 0
      
      @i2 = 0
      @j2 = 0
      @k2 = 0
      @c = 0
      @s = 0     
    end

    def play
      @frm += 1
      @frm = 0 if @frm > 30

      if @input.get_sw1 == 1
        @i1 = @i1 + 1
      else
        if @i1 > 180
          @k1 = 1
        elsif @i1 > 0
          @j1 = (@j1 + 1) % 3
          @i1 = 0
        end
      end
    
      if @input.get_sw2 == 1
        @i2 = @i2 + 1
      else
        if @i2 > 180 
          @k2 = 1
        elsif @i2 > 0
          @j2 = (@j2 + 1) % 3
          @i2 = 0
        end
      end
    
    if @s <= 5 || @s >= 12
     if @j1 == 0
       Window.draw(@x1, @y1, @gu)
     elsif @j1 == 1
       Window.draw(@x1, @y1, @cho)
     elsif @j1 == 2
       Window.draw(@x1, @y1, @pa)
     end
    
     if @j2 == 0
       Window.draw(@x2, @y2, @gu)
     elsif @j2 == 1
       Window.draw(@x2, @y2, @cho)
     elsif @j2 == 2
       Window.draw(@x2, @y2, @pa)
     end
    end
    
    Window.draw(385, 0, @bou)
        
    @c += 1
    @s = @c / 60
    
    if @s > 5 && @s < 8
      Window.draw(280, 300, @c3)
    elsif @s >= 8 && @s < 10
      Window.draw(280, 300, @c2)
    elsif @s >= 10 && @s < 12
      Window.draw(280, 300, @c1)
    elsif @s >= 12
        @i1 = 200
        @i2 = 200
    end
    
    if @s >= 12
    
      if @j1 == @j2 
        Window.draw(290, 450, @aiko)  
        if @input.get_input then
          self.clear
          Scene.move_to(:game)
        end
      elsif (@j1 + 1) % 3 == @j2
        Window.draw(0, 450, @kati)
        Window.draw(580, 450, @make)
        if @input.get_input then
          self.clear
          Scene.move_to(:game)
        end
      else
        Window.draw(580, 450, @kati)
        Window.draw(0, 450, @make)
        if @input.get_input then
          self.clear
          Scene.move_to(:game)
        end
      end    
    end
    
    def clear
      @x1 = 100
      @y1 = 200
      @x2 = 453
      @y2 = 200
      
      @i1 = 0
      @j1 = 0
      @k1 = 0
      
      @i2 = 0
      @j2 = 0
      @k2 = 0
      @c = 0
      @s = 0     
    end

    end
  end
end
