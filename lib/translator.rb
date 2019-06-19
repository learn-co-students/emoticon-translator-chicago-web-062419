# require modules here
require 'YAML'
require 'pry'


def load_library(path)
  # code goes here
  library = YAML.load_file("./lib/emoticons.yml")
  
  meanings = library.keys
  emoticons = library.values

  libraryhash = {
    'get_meaning' => {

    },
    'get_emoticon' => {

    }
  }

  meanings.each do |emoticon|
    emoticons.each do |emotes|
      libraryhash['get_meaning'][emotes[1]] = nil
    end
  end

  count = 0
  while count < meanings.length do 
    libraryhash["get_meaning"].each do |emote, definition|  
      libraryhash["get_meaning"][emote] = meanings[count]
      count += 1
    end
  end

  meanings.each do |emoticon|
    emoticons.each do |emotes|
      libraryhash['get_emoticon'][emotes[0]] = nil
    end
  end

  japemotes = []
  emoticons.each do |emotes|
    japemotes << emotes[1]
  end 

  counter = 0
  while counter < japemotes.length do
    libraryhash["get_emoticon"].each do |amemote, japemote|
      libraryhash["get_emoticon"][amemote] = japemotes[counter]
      counter += 1
    end
  end
  
  libraryhash
  
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else 
    hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else 
    hash["get_meaning"][emoticon]
  end
end