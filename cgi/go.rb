#!/usr/bin/ruby 

require 'cgi'

cgi = CGI.new("html4")

x = cgi.params['get_text']
puts x

