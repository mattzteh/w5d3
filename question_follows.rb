require_relative 'questions_db'

class QuestionFollow
    attr_accessor :id, :question_follows, follower_id



    def initialize(options)
        @id = options['id']
        @question_follows = options['question_follows']
        @follower_id = options['follower_id']
    end
end
