User.delete_all
Quote.delete_all
Favorite.delete_all

will = User.create(name: "Will")
blake = User.create(name: "Blake")
cool_quote = Quote.create(quote_text: "This is a super duper quote a moat!")
new_quote = Quote.create(quote_text: "Shazambam is the coolest quote thats ever been quoted")
