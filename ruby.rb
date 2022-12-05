def say_goodnight(name)
  result = 'Good night, ' + name
  return result
end
  # Time for bed...
puts say_goodnight('Mary-Ellen') # => 'Goodnight, Mary-Ellen'
puts say_goodnight('John-Boy') # => 'Goodnight, John-Boy'

def say_goodnight(name)
  "Good night, #{name.capitalize}"
end
puts say_goodnight('pa') # => Good night, Pa

a = [ 1, 'cat', 3.14 ] # array with three elements
a[0] # access the first element (1)
a[2] = nil # set the third element
           # array now [ 1, 'cat', nil ]

# he <<() method is often used with arrays. 
# It appends a single value to its receiver:

# ages = []
# for person in @people
  # ages << person.age
# end

a = [ 'ant', 'bee', 'cat', 'dog', 'elk' ]
# this is the same:
a = %w{ ant bee cat dog elk }

inst_section = {
  :cello => 'string',
  :clarinet => 'woodwind',
  :drum => 'percussion',
  :oboe => 'woodwind',
  :trumpet => 'brass',
  :violin => 'string'
} # =>  {:cello=>"string", :clarinet=>"woodwind", :drum=>"percussion", :oboe=>"woodwind", :trumpet=>"brass", :violin=>...

inst_section = {
  cello: 'string',
  clarinet: 'woodwind',
  drum: 'percussion',
  oboe: 'woodwind',
  trumpet: 'brass',
  violin: 'string'
}
# Doesn’t that look much better?

inst_section = {
  cello: :string,
  clarinet: :woodwind,
  drum: :percussion,
  oboe: :woodwind,
  trumpet: :brass,
  violin: :string
}
# => {:cello=>:string, :clarinet=>:woodwind, :drum=>:percussion, :oboe=>:woodwind, :trumpet=>:brass, :violin=>:string}

inst_section[:oboe] #=> :woodwind
inst_section[:cello] #=> :string
inst_section[:bassoon] #=> nil

# Regular Expressions
# In Ruby, you typically create a regular expression 
# by writing /pattern/ or %r{pattern}
# if line =~ /P(erl|ython)/
  # puts "There seems to be another scripting language here"
# end

# Logic
# Control Structures
# if count > 10
  # puts "Try again"
# elsif tries == 3
  # puts "You lose"
# else
  # puts "Enter a number"
# end

# Similarly, while statements are terminated with end:
# while weight < 100 and num_pallets <= 30
  # pallet = next_pallet()
  # weight += pallet.weight
  # num_pallets += 1
# end

# Ruby statement modifiers are a useful shortcut if the body of an if, unless, while,
# or until statement is a single expression. Simply write the expression, followed
# by the modifier keyword and the condition:
# puts "Danger, Will Robinson" if radiation > 3000
# distance = distance * 1.2 while distance < 100

# Blocks and Iterators
{ puts "Hello" } # this is a block
do ###
  club.enroll(person) # and so is this
  person.socialize #
end ###

# To pass a block to a method, place the block after the parameters (if any) to
# the method. In other words, put the start of the block at the end of the source
# line containing the method call. For example, in the following code, the block
# containing puts "Hi" is associated with the call to the greet() method:
# greet { puts "Hi" }
# If a method call has parameters, they appear before the block:
# verbose_greet("Dave", "loyal customer") { puts "Hi" }

animals = %w( ant bee cat dog elk ) # create an array
animals.each {|animal| puts animal } # iterate over the contents
# ant
# bee
# cat
# dog
# elk
#  => ["ant", "bee", "cat", "dog", "elk"]

3.times { print "Ho! " } #=> Ho! Ho! Ho!

# The & prefix operator allows a method 
# to capture a passed block as a named parameter:
def wrap &b
  print "Santa says: "
  3.times(&b)
  print "\n"
end
wrap { print "Ho! " } # => Santa says: Ho! Ho! Ho!

# Exceptions
# begin
  # content = load_blog_data(file_name)
# rescue BlogDataNotFound
  # STDERR.puts "File #{file_name} not found"
# rescue BlogDataFormatError
  # STDERR.puts "Invalid blog data in #{file_name}"
# rescue Exception => exc
  # STDERR.puts "General error loading #{file_name}: #{exc.message}"
# end

# Organizing Structures
# Classes
# Here’s a Ruby class definition:
# class Order < ApplicationRecord
  # has_many :line_items
  # def self.find_all_unpaid
    # self.where('paid = 0')
  # end
  # def total
    # sum = 0
    # line_items.each {|li| sum += li.total}
    # sum
  # end
# end

class Greeter
  def initialize(name)
    @name = name
  end
  def name
    @name
  end
  def name=(new_name)
    @name = new_name
  end
end

g = Greeter.new("Barney") # => #<Greeter:0x00007fe9ec6e95a0 @name="Barney">
g.name # => Barney
g.name = "Betty"
g.name # => Betty

class Greeter
  attr_accessor :name # create reader and writer methods
  attr_reader :greeting # create reader only
  attr_writer :age # create writer only
end # => [:age=]

class MyClass
  def m1 # this method is public
  end
  protected
  def m2 # this method is protected
  end
  private
  def m3 # this method is private
  end
end

# Modules

module StoreHelper
  def capitalize_words(string)
    string.split(' ').map {|word| word.capitalize}.join(' ')
  end
end # => :capitilize_words

# Ruby Idioms
=begin
A number of individual Ruby features can be combined in interesting ways,
and the meaning of such idiomatic usage is often not immediately obvious to
people new to the language.

Methods such as empty! and empty?
Ruby method names can end with an exclamation mark (a bang method)
or a question mark (a predicate method). Bang methods normally do
something destructive to the receiver. Predicate methods return true or
false, depending on some condition.

a || b
The expression a || b evaluates a. If it isn’t false or nil, then evaluation stops,
and the expression returns a. Otherwise, the statement returns b. This is
a common way of returning a default value if the first value hasn’t been
set.

a ||= b
The assignment statement supports a set of shortcuts: a op= b is the same
as a = a op b. This works for most operators:
count += 1 # same as count = count + 1
price *= discount # price = price * discount
count ||= 0 # count = count || 0
So, count ||= 0 gives count the value 0 if count is nil or false.
obj = self.new

Sometimes a class method needs to create an instance of that class:
class Person < ApplicationRecord
  def self.for_dave
    Person.new(name: 'Dave')
  end
end

This works fine, returning a new Person object. But later, someone might
subclass our class:
class Employee < Person
# ..
end
dave = Employee.for_dave # returns a Person
The for_dave() method was hardwired to return a Person object, so that’s
what’s returned by Employee.for_dave. Using self.new instead returns a new
object of the receiver’s class, Employee.

lambda
The lambda operator converts a block into an object of type Proc. An alternative syntax, introduced in Ruby 1.9, is ->. As a matter of style, the Rails
team prefers the latter syntax.

require File.expand_path('../../config/environment', __FILE__)
Ruby’s require method loads an external source file into our application.
This is used to include library code and classes that our application relies
on. In normal use, Ruby finds these files by searching in a list of directories, the LOAD_PATH.
Sometimes we need to be specific about which file to include. We can do
that by giving require a full filesystem path. The problem is, we don’t know
what that path will be—our users could install our code anywhere.
Wherever our application ends up getting installed, the relative path
between the file doing the requiring and the target file will be the same.
Knowing this, we can construct the absolute path to the target by using
the File.expand_path() method, passing in the relative path to the target file,
as well as the absolute path to the file doing the requiring (available in
the special __FILE__ variable).
=end
