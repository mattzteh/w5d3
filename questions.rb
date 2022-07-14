require_relative 'questions_db'
require_relative 'users.rb'
require_relative 'question_follows'

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

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


    def author
        data = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL

        User.new(data.first)
    end



end
