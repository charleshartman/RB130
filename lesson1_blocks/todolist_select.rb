# todolist_select.rb

# removed extraneous tests and comments for next assignment

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other_todo)
    title == other_todo.title &&
      description == other_todo.description &&
      done == other_todo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    todos << todo
  end

  alias add <<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    report = "---- #{title} ----\n" 
    report << todos.map(&:to_s).join("\n")
    report
  end

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  # def select
  #   result = []
  #   each do |todo|
  #     result << todo if yield(todo)
  #   end
  #   result
  # end

  def select
    result = TodoList.new(title)
    each do |todo|
      result << todo if yield(todo)
    end
    result
  end

  private

  attr_accessor :todos
end

todo1 = Todo.new("Buy eggs")
todo2 = Todo.new("Clean kitchen")
todo3 = Todo.new("Go to gallery")
todo4 = Todo.new("Study RB130")

list = TodoList.new("Today's Tasks")
list.add(todo1)
list.add(todo2)
list.add(todo3)
list.add(todo4)

todo1.done!

results = list.select { |todo| todo.done? } # you need to implement this method

puts results.inspect
