# todolist_test.rb

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_add_raises_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('how about this') }
    assert_raises(TypeError) { @list.add([:one, :two, :three]) }
  end

  def test_shovel
    new_todo = Todo.new('Study RB130')
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new('Order coffee')
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todos.first, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(7) }
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(7) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(7) }
    @list.mark_undone_at(0)
    @list.mark_undone_at(1)
    @list.mark_done_at(2)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_done
    @list.done!
    assert_equal(true, @list.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(false, @list.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_all_done
    @todo1.done!
    @todo2.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo2)
    list.add(@todo3)
    assert_equal(list.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo2)
    list.add(@todo3)
    assert_equal(list.to_a, @list.all_not_done.to_a)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(7) }
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_marked
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_marked
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    new_arr = []
    @list.each { |todo| new_arr << todo }

    assert_equal([@todo1, @todo2, @todo3], new_arr)
  end

  def test_each_return_obj
    ret_obj = @list.each { |todo| todo.nil? }

    assert_equal(@list, ret_obj)
  end

  # def test_select
  #   new_list = @list.select { |todo| todo }
  #   assert_equal(new_list.to_a, @list.to_a)
  # end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(@todo2, @list.find_by_title('Clean room'))
  end

  def test_mark_done
    @todo2.done!
    assert_equal(@todo2.done?, @list.mark_done('Clean room'))
  end
end
