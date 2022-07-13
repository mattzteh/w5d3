require_relative 'questions_db'

class Question
    attr_accessor :id, :title, :body, :author_id 

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Question.new(datum)}
    end
    
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 
end