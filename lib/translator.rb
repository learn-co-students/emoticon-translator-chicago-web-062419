require 'pry'
require 'yaml'

def load_library (path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(path).each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  result = library["get_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  result = library["get_meaning"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end