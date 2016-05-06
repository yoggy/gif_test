#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

require 'erb'

temp = <<-EOS
gif_test
====

<%=str%>

Copyright and license
----
Copyright (c) 2016 yoggy

Released under the [MIT license](LICENSE.txt)
EOS

base_dir = File.dirname($0)
gifs = Dir.glob("*/*.gif")
gifs = gifs.sort.reverse

str = ""
gifs.each do |f|
  str += "![#{f}](#{f})\n"
end

erb = ERB.new(temp)

open("README.md", "wb") do |f|
  f.write(erb.result)
end
