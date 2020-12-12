# todolist_1.rb

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

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

  private

  attr_accessor :todos
end

# given
todo1 = Todo.new("Buy eggs")
todo2 = Todo.new("Clean kitchen")
todo3 = Todo.new("Go to gallery")
todo4 = Todo.new("Study RB130")
list = TodoList.new("Today's Tasks")

# ---- Adding to the list -----

# add
list.add(todo1)     # adds todo1 to end of list, returns list
list.add(todo2)     # adds todo2 to end of list, returns list
list << todo3
list << todo4

# list.add(1)       # raises TypeError with message "Can only add Todo objects"
# p list
# <<
# same behavior as add

# ---- Interrogating the list -----

# size
p list.size
# returns 3

# first
p list.first
# returns todo1, which is the first item in the list

# last
p list.last
# returns todo3, which is the last item in the list

# to_a
list.to_a
# returns an array of all items in the list

# done?
p list.done?
# returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
list.item_at(1) # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1) # marks the 2nd item as done
list.item_at(1)
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1) # marks the 2nd item as not done,
list.item_at(1)
# list.mark_undone_at(100)        # raises IndexError

# done!
list.done!
list.done?
# marks all items as done

list.mark_undone_at(0)
list.mark_undone_at(1)
list.mark_undone_at(2)
list.mark_undone_at(3)
# ---- Deleting from the list -----

# shift
list.shift
# removes and returns the first item in list

# pop
list.pop
# removes and returns the last item in list

# p list

# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(1) # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError
# p list

# ---- Outputting the list -----

# to_s
# list.to_s
puts list
# returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
