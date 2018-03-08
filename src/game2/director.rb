require 'smalrubot'

module Game2
  class Director
    def initialize(input, score)
      @score = score
      @input = input
      @frm = 1

      @bar = Image.load('images/bar.png')
      @hako = Image.load('images/hako.png')
      @end = Image.load('images/gameover.png')
      @huji = Image.load('images/019AME5031_TP_V.png')
      @title_balance = Image.load('images/balance_title.png')
      @result_img = Image.load('images/winning.png')

      @ran = 0
      @an = 0
      @iti = 350
      @aiti = 51
      @bgm=0
      @gm = Sound.new('game2/sound/tarara.wav')
      @bgm_b = Sound.new('game2/sound/balance_bgm.wav')
      @win_music = Sound.new('game2/sound/win_balance.wav')
      @win_flg = false
      @bgm_b.loop_count = -1
      @bgm_flg = false

      @start=0
      @count=0
      @mod = 1
      @title = 0
      @c = 0
      @cs = 0
      @s = 0
      @l=0
      @d=0
      @font = Font.new(50, font_name="ＭＳ Ｐゴシック")
      @font2 = Font.new(100, font_name="ＭＳ Ｐゴシック")
    end

    def play
      @frm += 1
      @frm = 0 if @frm > 30

      if @title == 0
        Window.draw(0,0,@title_balance)
        Window.draw_font(70, 200,"バランスゲーム", @font2)

        @count +=1
        if @count == 300
          @title = 1
          @count = 0
        end
      elsif @title == 1

        @count +=1
        @start +=1

        if @count==25
          @count=0
          @d= @input.get_tilt
          @l= @input.get_light
        end
          @l= @l/2.5 + 3
        if @start <= 300
          @l = 5
        end

        if @mod == 1 || @mod == 2
          @bgm_b.play if @bgm_flg == false
          @bgm_flg = true
          Window.draw_rot(0, 300, @bar, @ran, 401, 0)
          Window.draw_rot(@iti, 200, @hako, @ran, @aiti, 101)
          Window.draw(249, 265, @huji)
          @an += @l if @d==0
          @an -= @l if @d==1
          @ran = @an / 60
          @iti += @ran / 3
          @aiti -= @ran / 3
          if @mod == 1
            @c += 1
            Window.draw_font(0, 0,"一回戦", @font)
          else
            @c -= 1
            Window.draw_font(0, 0,"二回戦", @font)
          end
          Window.draw_font(300, 0,"タイム #{@c/60}", @font)
        end

        if (@iti < 20 || @iti > 680) && @cs < 600
          @mod = 0
        end

        if (@iti < 20 || @iti > 680) && @cs >= 600
          @mod = 3
          @s = 1
        elsif @c < 0
          @mod = 3
          @s = 2
        end

        if @mod == 0
          @bgm_b.stop
          Window.draw(0, 0, @end)
          Window.draw_font(250, 0,"タイマー #{@c/60}", @font)
        if @bgm == 0
          @bgm_flg = false
          @gm.play
          @bgm =  1
        end

          @cs += 1
          if @cs == 600
            @an = 0
            @iti = 350
            @aiti = 51
            @mod = 2
            @start = 0
          end
        end

        if @mod == 3
          @bgm_b.stop
          @win_music.play if @win_flg == false
          @win_flg = true
          Window.draw(0,0,@result_img)
          if @s == 1
            Window.draw_font(200, 200,"勝利　プレイヤー１", @font)
          elsif @s == 2
            Window.draw_font(200, 200,"勝利　プレイヤー２", @font)
          end
          if @input.get_sw1 == 1 && @frm % 15 == 0 then
            Scene.move_to(:game)
            self.clear
          end

        end
      end
    end

    def clear
      @frm = 1
      @ran = 0
      @an = 0
      @iti = 350
      @aiti = 51

      @start=0
      @count=0
      @mod = 1
      @title = 0
      @c = 0
      @cs = 0
      @s = 0
      @l=0
      @d=0
      @bgm=0
      @bgm_flg = false
      @win_flg = false

    end

  end
end
