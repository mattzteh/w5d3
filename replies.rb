require_relative 'questions_db'

class Reply
    attr_accessor :id, :parent_id, :question_id, :writer_id, :title, :body

    def self.find_by_user_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            writer_id = ?
        SQL
        user.each do |reply|
            puts Reply.new(reply)
        end
    end

    def self.find_by_question_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL
        user.each do |question|
            puts Reply.new(question)
        end
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
