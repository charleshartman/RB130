# exercise6.rb - Exception Assertions

# Write a minitest assertion that will fail unless employee.hire raises
# a NoExperienceError exception.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError, "I'm sorry, applicant, but you have no experience."
  end
end

class ExceptionTest < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_no_exp_error
    assert_raises(NoExperienceError) { @employee.hire }
  end
end
