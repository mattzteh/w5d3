require_relative 'questions_db'
require_relative 'questions'

class User
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map{|datum| User.new(datum)}
    end

    def self.find_by_id
        data = QuestionsDatabase.instance.execute("SELECT id FROM replies")
        data.map{|datum| User.new(datum)}

    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        QuestionsDatabase.instance.execute("SELECT * FROM questions JOIN users ON questions.id = users.id")
    end
end