require_relative 'questions_db'

class QuestionLike
    attr_accessor :id, :writer_id, :question_id 
    
    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map{|datum| QuestionLike.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @writer_id = options['writer_id']
        @question_id = options['question_id']
    end
end