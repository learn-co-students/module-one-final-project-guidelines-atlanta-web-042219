User.destroy_all
Search.destroy_all
Song.destroy_all
Filter.destroy_all
#...

User.create(name: "Developer", username: "dev", displayname: "Test Mode", password: "123")

Filter.create(word: "arse", replacement: "butt")
Filter.create(word: "arsehole", replacement: "butthole")
Filter.create(word: "ass", replacement: "butt")
Filter.create(word: "asshole", replacement: "butthole")
Filter.create(word: "assholes", replacement: "buttholes")
Filter.create(word: "bastard", replacement: "meanie")
Filter.create(word: "bastards", replacement: "meanies")
Filter.create(word: "bitch", replacement: "shrew")
Filter.create(word: "bitches", replacement: "shrews")
Filter.create(word: "bitchy", replacement: "cranky")
Filter.create(word: "bullshit", replacement: "crap")
Filter.create(word: "cocksucker", replacement: "turd")
Filter.create(word: "cunt", replacement: "vixen")
Filter.create(word: "cunts", replacement: "")
Filter.create(word: "damn", replacement: "dang")
Filter.create(word: "dick", replacement: "jerk")
Filter.create(word: "dickhead", replacement: "jerkhead")
Filter.create(word: "douche", replacement: "moron")
Filter.create(word: "douchebag", replacement: "blockhead")
Filter.create(word: "dumbass", replacement: "imbecile")
Filter.create(word: "dyke", replacement: "lesbian")
Filter.create(word: "fag", replacement: "homosexual")
Filter.create(word: "faggot", replacement: "homosexual")
Filter.create(word: "fuck", replacement: "screw")
Filter.create(word: "fucked", replacement: "screwed")
Filter.create(word: "fucker", replacement: "idiot")
Filter.create(word: "fuckers", replacement: "idiots")
Filter.create(word: "fucking", replacement: "loving")
Filter.create(word: "fuckin'", replacement: "lovin'")
Filter.create(word: "fucks", replacement: "cares")
Filter.create(word: "fuckup", replacement: "loser")
Filter.create(word: "goddamn", replacement: "goshdurn")
Filter.create(word: "godammit", replacement: "dagnabbit")
Filter.create(word: "godamnit", replacement: "dagnabbit")
Filter.create(word: "jackass", replacement: "nincompoop")
Filter.create(word: "jackasses", replacement: "nincompoops")
Filter.create(word: "motherfucker", replacement: "motherlover")
Filter.create(word: "motherfuckers", replacement: "motherlovers")
Filter.create(word: "nigga", replacement: "bro")
Filter.create(word: "niggas", replacement: "bros")
Filter.create(word: "nigger", replacement: "brother")
Filter.create(word: "niggers", replacement: "brothers")
Filter.create(word: "piss", replacement: "urine")
Filter.create(word: "pisses", replacement: "urinates")
Filter.create(word: "pissed", replacement: "angry")
Filter.create(word: "prick", replacement: "dolt")
Filter.create(word: "pussy", replacement: "kitty")
Filter.create(word: "shit", replacement: "poop")
Filter.create(word: "shite", replacement: "poop")
Filter.create(word: "shithead", replacement: "poopyhead")
Filter.create(word: "shitty", replacement: "crappy")
Filter.create(word: "skank", replacement: "trollop")
Filter.create(word: "slut", replacement: "floozy")
Filter.create(word: "tit", replacement: "breast")
Filter.create(word: "tits", replacement: "breasts")
Filter.create(word: "titties", replacement: "breasts")
