class Course
    attr_accessor :title, :schedule, :description
    COURSES = []
    
    def initialize
        COURSES << self
    end
    
    def self.all
        COURSES
    end
    
    def self.reset_all
        COURSES.clear
    end
end