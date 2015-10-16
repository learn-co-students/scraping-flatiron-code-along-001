require 'nokogiri'
require 'open-uri'
require "pry"
require_relative './course.rb'

class Scraper
  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |x|
      # Course.new(x.children.css(".h2").text, x.children.css(".date").text, x.children.css("p").text)
      new_course = Course.new
      new_course.title = x.children.css(".h2").text
      new_course.schedule = x.children.css(".date").text
      new_course.description = x.children.css("p").text
    end
  end
end
