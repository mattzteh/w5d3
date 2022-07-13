require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLITE3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User

    attr_accessor :id, :fname, :lname

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map{|datum| User.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

class Question
    attr_accessor :id, :title, :body, :author_id 

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map{|datum| Question.new(datum)}
    end
end

class QuestionFollow
    attr_accessor :id, :question_follows, follower_id

    def initialize(options)
        @id = options['id']
        @question_follows = options['question_follows']
        @follower_id = options['follower_id']
    end 

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map{|datum| QuestionFollow.new(datum)}
    end
end

class Reply
    def initialize(options)
        attr_accessor :id, :parent_id, :question_id, :writer_id, :title, :body

        @id = options['id']
        @parent_id = options['parent_id']
        @question_id = options['question_id']
        @writer_id = options['writer_id']
        @title = options['title']
        @body = options['body']

    end 

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map{|datum| Reply.new(datum)}
    end
end

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