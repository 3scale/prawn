# encoding: utf-8

puts "Prawn specs: Running on Ruby Version: #{RUBY_VERSION}"

require "rubygems"
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "prawn/core"

Prawn.debug = true

require "test/spec"
require "mocha"
require "pdf/reader"
require "pdf/inspector"

def create_pdf(klass=Prawn::Document)
  @pdf = klass.new(:left_margin   => 0,
                   :right_margin  => 0,
                   :top_margin    => 0,
                   :bottom_margin => 0)
end    
