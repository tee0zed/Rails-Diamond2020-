# encoding: utf-8

# Подключаем гем для общения с базой данных sqlite3
require 'sqlite3'

# Базовый класс «Запись» — здесь мы определим основные методы и свойства,
# общие для всех типов записей.
class Post
  # Статическое поле класса или class variable (переменная класса) аналогично
  # статическим методам принадлежит всему классу в целом и доступно независимо от
  # созданных объектов
  SQLITE_DB_FILE = 'notepad.sqlite'.freeze

  # Теперь нам нужно будет читать объекты из базы данных поэтому удобнее всегда
  # иметь под рукой связь между классом и его именем в виде строки
  def self.post_types
    {'Memo' => Memo, 'Task' => Task, 'Link' => Link}
  end

  # Параметром для метода create теперь является строковое имя нужного класса
  def self.create(type)
    post_types[type].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def self.find_by_id(id)
    db = SQLite3::Database.open(SQLITE_DB_FILE)

    unless id.nil?
      db.results_as_hash = true
      result = db.execute('SELECT * FROM posts WHERE  rowid = ?', id)
      db.close
      if result.empty?
        puts "Такой id #{id} не найден в базе :("
        return nil
      else
        result = result[0]
        post = create(result['type'])
        post.load_data(result)
        post
      end
    end
  end

  def self.find_all(limit, type)
    db = SQLite3::Database.open(SQLITE_DB_FILE)

    db.results_as_hash = false
    query = 'SELECT rowid, * FROM posts '
    query += 'WHERE type = :type ' unless type.nil?
    query += 'ORDER by rowid DESC '
    query += 'LIMIT :limit ' unless limit.nil?
    statement = db.prepare query
    statement.bind_param('type', type) unless type.nil?
    statement.bind_param('limit', limit) unless limit.nil?
    result = statement.execute!
    statement.close
    db.close
    result
  end

  def read_from_console
    # Этот метод должен быть реализован у каждого ребенка
  end

  def to_strings
    # Этот метод должен быть реализован у каждого ребенка
  end

  # Метод load_data заполняет переменные экземпляра из полученного хэша
  def load_data(data_hash)
    # Общее для всех детей класса Post поведение описано в методе экземпляра
    # класса Post.
    @created_at = Time.parse(data_hash['created_at'])
    @text = data_hash['text']
    # Остальные специфичные переменные должны заполнить дочерние классы в своих
    # версиях класса load_data (вызвав текущий метод с пом. super)
  end

  # Метод to_db_hash должен вернуть хэш типа {'имя_столбца' -> 'значение'} для
  # сохранения новой записи в базу данных
  def to_db_hash
    # Дочерние классы сами знают свое представление, но общие для всех детей
    # переменные экземпляра можно заполнить уже сейчас в родительском классе.
    {
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
    # self — ключевое слово, указывает на «этот объект», то есть конкретный
    # экземпляр класса, где выполняется в данный момент этот код.
    #
    # Дочерние классы должны дополнять этот хэш массив своими полями
  end

      # Метод save_to_db, сохраняющий состояние объекта в базу данных.
      def save_to_db
        # Открываем «соединение» с базой данных SQLite и говорим, что хотим получать
        # результат в виде хэшей руби.
        db = SQLite3::Database.open(SQLITE_DB_FILE)
        db.results_as_hash = true

        # Выполняем Запрос к базе на вставку новой записи в соответствии с хэшем,
        # сформированным методом to_db_hash. Обратите внимание, что не смотря на то,
        # что каждый ребенок реализует этот метод по-своему, код save_to_db будет
        # одинаковым для всех.
        post_hash = to_db_hash

        db.execute(
          # Указываем тип запроса
          'INSERT INTO posts (' +

            # Добавляем названия полей таблицы, склеивая ключи хэша через запятую
            post_hash.keys.join(', ') +

            # Сообщаем, что сейчас будем передавать значения, указав после VALUES
            # нужное количество знаков '?', разделенных запятыми. Каждый такой знак
            # будет воспринят как плейсхолдер для значения, которое мы передадим
            # дальше.
            ") VALUES (#{('?,' * post_hash.size).chomp(',')})",

          # Наконец, вторым параметром передаем массив значений, которые будут
          # вставлены в запрос вместо плейсхолдеров '?' в нужном порядке.
          post_hash.values
        )

        # Сохраняем в переменную id записи, которую мы только что добавили в таблицу
        insert_row_id = db.last_insert_row_id

        # Закрываем соединение
        db.close

        # Возвращаем идентификатор записи в базе
        insert_row_id
      end

      def save
        file = File.new(file_path, 'w:UTF-8')

        to_strings.each { |string| file.puts(string) }

        file.close
      end

      def file_path
        current_path = File.dirname(__FILE__)

        file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

        "#{current_path}/#{self.class.name}_#{file_time}.txt"
      end
    end
