require_relative 'player'
require 'smalrubot'

module Game5
  class Director
    def initialize(input, score)
      @input = input
      @frm = 1
      @score = score

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
      @taiko = Sound.new('game5/sound/ジャンケン321.wav')
      @fini = Sound.new('game5/sound/勝負あり.wav')
      @font = Font.new(50, font_name="ＭＳ Ｐゴシック")
      @font2 = Font.new(80, font_name="ＭＳ Ｐゴシック")
      @i1, @j1, @k1, @i2, @j2, @k2, @c, @s, @v1, @v2, @sn= 0,0,0,0,0,0,0,0,0,0,0
      @bgm = [0, 0, 0, 0]
      @x1 = 50
      @y1 = 150
      @x2 = 520
      @y2 = 150
      @taiko = Sound.new('game5/sound/ジャンケン321.wav')
      @taiko.set_volume(255)
      @fini = Sound.new('game5/sound/勝負あり.wav')

      @bgm_on = false
      @fin_flg = false
      @janken_bgm = Sound.new('game5/sound/janken.wav')
      @janken_bgm.loop_count = -1

      @font = Font.new(50, font_name="ＭＳ Ｐゴシック")
      @font2 = Font.new(80, font_name="ＭＳ Ｐゴシック")

    end

    def play
      @frm += 1
      @frm = 0 if @frm > 30
      @janken_bgm.play if @bgm_on == false
      @bgm_on = true

      if @sn == 0
        Window.draw_font(100, 100,"じゃんけんゲーム", @font2)
        Window.draw_font(300, 300,"二本先取!!", @font)
        @c += 1
        if @c == 180
          @sn = 1
          @c = 0
        end
      end



      if @sn == 1

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
            p "!!"
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
        Window.draw_font(0, 0,"P1 勝利数#{@v1}", @font)
        Window.draw_font(550, 0,"P2 勝利数#{@v2}", @font)

        if @v1 == 1
          Window.draw_font(0, 50,"リーチ！", @font)
        end
        if @v2 == 1
          Window.draw_font(600, 50,"リーチ！", @font)
        end

        @c += 1
        @s = @c / 60

        if @s > 5 && @s < 8
          Window.draw(280, 300, @c3)
        if @bgm[3] == 0
          #@janken_bgm.stop
          @taiko.play
          @bgm[3] = 1
        end

      elsif @s >= 8 && @s < 10
        Window.draw(280, 300, @c2)
        if @bgm[2] == 0
          @taiko.play
          @bgm[2] = 1
        end
      elsif @s >= 10 && @s < 12
        Window.draw(280, 300, @c1)
        if @bgm[1] == 0
          @taiko.play
          @bgm[1] = 1
        end

        elsif @s >= 12
          @i1 = 200
          @i2 = 200
        end

        if @s >= 12

        if @j1 == @j2
          Window.draw(290, 450, @aiko)
        elsif (@j1 + 1) % 3 == @j2
          Window.draw(0, 450, @kati)
          Window.draw(580, 450, @make)
          @v1 += @s / 16
        else
          Window.draw(580, 450, @kati)
          Window.draw(0, 450, @make)
          @v2 += @s / 16
        end
      end
      if @v1 == 2
        @sn = 2
        @v1 = 1
      elsif @v2 == 2
        @sn = 2
        @v1 = 2
      end
      if @s > 15 && @s < 20
        @i1,@j1,@k1 = 0,0,0
        @i2,@j2,@k2 = 0,0,0
        @c,@s = 0,0
        @bgm = [0, 0, 0, 0]
      end
    end

    if @sn == 2

      Window.draw_font(170, 250,"プレイヤー#{@v1}の勝利！！", @font)
      if @input.get_input then
        Scene.move_to(:game)
        self.clear
      end


      if @bgm[0] == 0
<<<<<<< HEAD
          @janken_bgm.stop
          @fini.play if @fin_flg == false
          @fin_flg = true
          @bgm[0] = 1
      end
    end

=======
        @fini.play
        @bgm[0] = 1
      end
    end
    
>>>>>>> 2f068621581b3e43d39ef65ce5bd2f111657cf9f
    @c = 600 if Input.key_push?(K_5)
    end

    def clear
      @i1, @j1, @k1, @i2, @j2, @k2, @c, @s, @v1, @v2, @sn= 0,0,0,0,0,0,0,0,0,0,0
      @bgm[1], @bgm[2], @bgm[3] = 0, 0, 0
      @x1 = 50
      @y1 = 150
      @x2 = 520
      @y2 = 150
      @bgm_on = false
      @fin_flg =false
    end
  end
end
