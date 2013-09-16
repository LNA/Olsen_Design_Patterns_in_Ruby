# In a_file_backup_dsl.rb we use the words backup, to and interval
# to describe what we want to do to our files.  These will be our Ruby method calls.

require 'finder'

def backup(dir, find_expression=All.new)
	puts "Backup called, source dir = #{dir} find expr = #{find_expression}"
end

def to(backup_directory)
	puts "To called, backup dir = #{backup_directory}"
end

def interval(minutes)
	puts "Interval called, interval = #{minutes} minutes"
end

eval(File.read('backup.pr'))

# The last statement tells the program to read the contents of the backup.pr and 
# run them as a Ruby program text. When we run packrat.rb, we get the output of the 
# backup, to and interval Ruby method calls.

# It is interpreting the DSL as Ruby that puts the 
# 'internal' into internal DSL.