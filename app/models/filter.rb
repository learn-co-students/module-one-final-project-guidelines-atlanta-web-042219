class Filter < ActiveRecord::Base
	belongs_to :user
	
	def self.get_current_filter
		hash = {}
		$user.filters.all.each {|filter| hash[filter.word] = filter.replacement }
		hash
	end

	def self.set_default_filters(id)
		Filter.create(word: "arse", replacement: "butt", user_id: id)
		Filter.create(word: "arsehole", replacement: "butthole", user_id: id)
		Filter.create(word: "ass", replacement: "butt", user_id: id)
		Filter.create(word: "asshole", replacement: "butthole", user_id: id)
		Filter.create(word: "bastard", replacement: "meanie", user_id: id)
		Filter.create(word: "bitch", replacement: "shrew", user_id: id)
		Filter.create(word: "bitchy", replacement: "cranky", user_id: id)
		Filter.create(word: "bullshit", replacement: "crap", user_id: id)
		Filter.create(word: "clit", replacement: "tip", user_id: id)
		Filter.create(word: "cock", replacement: "member", user_id: id)
		Filter.create(word: "cocksucker", replacement: "turd", user_id: id)
		Filter.create(word: "cunt", replacement: "woman", user_id: id)
		Filter.create(word: "damn", replacement: "dang", user_id: id)
		Filter.create(word: "dick", replacement: "jerk", user_id: id)
		Filter.create(word: "dickhead", replacement: "jerkhead", user_id: id)
		Filter.create(word: "douche", replacement: "moron", user_id: id)
		Filter.create(word: "douchebag", replacement: "blockhead", user_id: id)
		Filter.create(word: "dumbass", replacement: "imbecile", user_id: id)
		Filter.create(word: "dyke", replacement: "lesbian", user_id: id)
		Filter.create(word: "fag", replacement: "homosexual", user_id: id)
		Filter.create(word: "faggot", replacement: "homosexual", user_id: id)
		Filter.create(word: "fuck", replacement: "screw", user_id: id)
		Filter.create(word: "fucked", replacement: "screwed", user_id: id)
		Filter.create(word: "fucker", replacement: "idiot", user_id: id)
		Filter.create(word: "fucking", replacement: "loving", user_id: id)
		Filter.create(word: "fuckin", replacement: "lovin'", user_id: id)
		Filter.create(word: "fuckup", replacement: "loser", user_id: id)
		Filter.create(word: "goddamn", replacement: "goshdurn", user_id: id)
		Filter.create(word: "godammit", replacement: "dagnabbit", user_id: id)
		Filter.create(word: "godamnit", replacement: "dagnabbit", user_id: id)
		Filter.create(word: "jackass", replacement: "nincompoop", user_id: id)
		Filter.create(word: "motherfucker", replacement: "motherlover", user_id: id)
		Filter.create(word: "motherfucking", replacement: "motherloving", user_id: id)
		Filter.create(word: "muthafuckin", replacement: "motherloving", user_id: id)
		Filter.create(word: "nigga", replacement: "bro", user_id: id)
		Filter.create(word: "nigger", replacement: "brother", user_id: id)
		Filter.create(word: "piss", replacement: "urine", user_id: id)
		Filter.create(word: "pissed", replacement: "angry", user_id: id)
		Filter.create(word: "prick", replacement: "dolt", user_id: id)
		Filter.create(word: "pussy", replacement: "kitty", user_id: id)
		Filter.create(word: "shit", replacement: "poop", user_id: id)
		Filter.create(word: "shite", replacement: "poop", user_id: id)
		Filter.create(word: "shithead", replacement: "poopyhead", user_id: id)
		Filter.create(word: "shitty", replacement: "crappy", user_id: id)
		Filter.create(word: "skank", replacement: "trollop", user_id: id)
		Filter.create(word: "slut", replacement: "floozy", user_id: id)
		Filter.create(word: "tit", replacement: "breast", user_id: id)
	end
end
