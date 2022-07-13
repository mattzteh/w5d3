require_relative 'questions_db'

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_author_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL

        user.each do |question|
            puts Question.new(question)
        end
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end
