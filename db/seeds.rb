User.delete_all
Quote.delete_all
Favorite.delete_all

will = User.create(name: "Will")
blake = User.create(name: "Blake")
cool_quote = Quote.create(title: 'Superduper', date: 5719, quote_text: "This is a super duper quote a moat!")
new_quote = Quote.new(title: "Shazam", date: 50819, quote_text: "Shazambam")
