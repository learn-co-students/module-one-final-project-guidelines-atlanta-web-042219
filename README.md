## Clean.ly - Tiffani and Andrew's Module One Project
A simple CRUD app that allows the user to search for and return song lyrics, along with information regarding the presence of vulgarity or profanity. User can choose to replace instances of profanity with "clean" words to create their own version.

## Motivation
We wanted to design something simple and useful that retrieves and persists data from an API, while demonstating knowledge of Ruby, SQLite3, ActiveRecord, and "has-many-through" model relationships.

## Features
* User login and password authentication (no encryption at the moment)
* Searches an API for song lyrics based on artist and title.
* Displays song lyrics with profanity highlighted.
* Calculates a parental rating for each song based on the percentage of profanity present in the lyrics.
* User can filter the lyrics which replaces profane words with "clean" words.
* User can retrieve (and clear) recent searches.
* User can create new profanity filters for future searches and modify replacement values for existing filters.

## Installation
Requires Ruby 2.6.1 or later and a variety of Ruby Gems (check Gemfile or use "bundle install")

## API Reference
[Song Lyrics API](https://lyricsovh.docs.apiary.io/#)

## How do I use it?
Clean.ly is a CLI app designed to be run from the user's terminal.

## Credits
Many thanks to Brit for suggesting such cool interface gems!

#### The Flatiron School - Atlanta, GA
#### Class of April 2019 - GitLit!
