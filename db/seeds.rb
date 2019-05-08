User.delete_all
Quote.delete_all
Favorite.delete_all

will = User.new(name: "Will")
blake = User.new(name: "Blake")
cool_quote = Quote.new(title: 'Superduper', date: 5719, quote_text: "This is a super duper quote a moat!")
