require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://library.st-andrews.ac.uk/patroninfo')

barcode_form = page.form('patform')
barcode_form.code = ARGV[0]

page = agent.submit(barcode_form, barcode_form.buttons.first)

page = agent.page.link_with(:text => 'RENEW ALL').click

pp page
