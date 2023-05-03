#!/usr/bin/env ruby
#Output [SENDER],[Receiver],[FLAGS]

sender = ARGV[0].scan(/(?<=\[from:)(.*?)(?=\])/).flatten.join('')
sender = sender.sub(/\[|\]/, "")

reciever = ARGV[0].scan(/(?<=\[to:)(.*?)(?=\])/).flatten.join('')
reciever = reciever.sub(/\[|\]/, "")
flags = ARGV[0].scan(/(?<=\[flags:)(.*?)(?=\])/).flatten.join('')
flags = flags.sub(/\[|\]/, "")
puts "#{sender},#{reciever},#{flags}"
