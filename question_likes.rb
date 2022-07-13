
class QuestionLike
    def initialize(options)
        attr_accessor :id, :writer_id, :question_id 

        @id = options['id']
        @writer_id = options['writer_id']
        @question_id = options['question_id']
    end 

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map{|datum| QuestionLike.new(datum)}
    end
end