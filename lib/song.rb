
require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = Song.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end 
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(fileformat)
    song_artist = fileformat.split(" - ")
    artist_name = song_artist[0]
    song_name = song_artist[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(fileformat)
    song_artist = fileformat.split(" - ")
    artist_name = song_artist[0]
    song_name = song_artist[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    Song.all.clear
  end




end
