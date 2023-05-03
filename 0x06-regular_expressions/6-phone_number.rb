#!/usr/bin/env ruby
#Match a 10digit phone number

puts ARGV[0].scan(/^[0-9]{10}$/).join
