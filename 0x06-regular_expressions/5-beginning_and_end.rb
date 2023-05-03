#!/usr/bin/env ruby
#Match a string that stats with h, ends with n and can have any single character inbetween

puts ARGV[0].scan(/h[0-9A-Za-z]n/).join
