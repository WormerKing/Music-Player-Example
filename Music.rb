require "gosu"
include Gosu

class Hello < Window
	def initialize
		@çal = 0
		@a = 1
		super 500,500,false
		Dir.chdir(Dir.getwd+"/Sounds")
		@a = Dir.glob("*.mp3")
		oynat
	end
	def oynat(nesne=0)
		if nesne == "arttır";@çal += 1 elsif nesne=="azalt";@çal -= 1 else @çal = 0 end
		@music = Song.new self,@a[@çal]
		@music.play
	rescue RuntimeError
		oynat
	end
	def update
		if button_down? KbLeft
			oynat("azalt")
		elsif button_down? KbRight
			oynat("arttır")
		elsif button_down? KbEscape
			exit
		unless @music.playing?;oynat("arttır") end
		end
	end
end

worm = Hello.new.show
