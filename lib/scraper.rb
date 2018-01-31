require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    html = open("https://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    doc = get_page
    doc.css(".post")
  end

  def make_courses
    xml = get_courses
    courses = []
    xml.each do | el |
      course = Course.new
      course.title = el.css("h2").text
      course.schedule = el.css(".date").text
      course.description = el.css("p").text
      courses << course
    end
    courses
  end
end



