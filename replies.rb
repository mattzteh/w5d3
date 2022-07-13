require_relative 'questions_db'

class Reply
    attr_accessor :id, :parent_id, :question_id, :writer_id, :title, :body

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map{|datum| Reply.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @parent_id = options['parent_id']
        @question_id = options['question_id']
        @writer_id = options['writer_id']
        @title = options['title']
        @body = options['body']
    end 
end