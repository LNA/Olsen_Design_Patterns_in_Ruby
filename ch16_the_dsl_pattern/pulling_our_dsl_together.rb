# Lets rewrite our original backup, to and interval methods 
# to use the classes we just wrote:

def backup(dir, find_expression = All.new)
	Backup.instance,data_sources << DataSource.new(dir, find_expression)
end

def to(backup_directory)
	Backup.instance.backup_directory = backup_directory
end

def interval(minutes)
	Backup.instance.interval = minutes
end

eval(File.read('backup.pr'))
Backup.instance.run


# The backup method grabs the Backup singleton instance and adds a data source to it.

# The interval method collects the backup interval and sets the right field on the Backup singleton.

# The to method collects the backup directory and sets the right field on the Backup singleton.