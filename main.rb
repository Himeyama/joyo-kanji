#!/usr/bin/env ruby
require "csv"
require "json"

csv = CSV.open("joyo2021.txt").read
h = csv.map{|e|
    [
        e[0],
        {
            "old_character": e[1], 
            "radical": e[2], 
            "stroke": e[3].to_i, 
            "grade": e[4].to_i, 
            "added_year": e[5].to_i, 
            "removed_year": e[6].to_i,
            "onkun": e[7]
        }.filter{|k, v| v != 0 }.compact
    ]
}.to_h

open("json/joyo2021.json", "w") do |f|
    f.puts JSON.pretty_generate(h)
end