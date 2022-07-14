require_relative 'questions_db'

class QuestionFollow
    attr_accessor :id, :question_follows, :follower_id

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL,n)
        SELECT
            COUNT(follower_id)
        FROM
            question_follows
        ORDER BY
            follower_id DESC
        LIMIT
            ?

        SQL
        return data
    end

    def initialize(options)
        @id = options['id']
        @question_follows = options['question_follows']
        @follower_id = options['follower_id']
    end

    def self.most_followed(n)
        QuestionFollow
    end
end
