# As of now PackRat is limited:
# => We can specify only one backup configuration at a time
# => Can't use 2 or 3 backup directories
# => Can't backup files on different schedules
# => Its implementation is messy...relying on the top-level methods (interval, to and backup) 

# We can change the code so that the user is creating and configuring multiple instances of Backup:

Backup.new do |b|
  b.backup '/home/russ/oldies', file_name('*mp3') | file_name('*.wav')
  b.to '/tmp/backup'
  b.interval 60
end

Backup.new do |b|
  b.backup '/home/russ/newies',file_name('*mp3') | file_name('*.wav')
  b.to '/tmp/backup'
  b.interval 60
end


class Backup
  attr_accessor :backup_directory, :interval
  attr_reader :data_sources

  def initialize
    @data_sources = []
    @backup_directory = '/backup'
    @interval = 60
    yield(self) if block_given?
    PackRat.instance.register_backup(self)
  end

  def backup(dir, find_expression = All.new)
    Backup.instance,data_sources << DataSource.new(dir, find_expression)
  end

  def to(backup_directory)
    @backup_directory = backup_directory
  end

  def interval(minutes)
    @interval = minutes
  end

  def run
    while true
      this_backup_dir = Time.new.ctime.tr(":", "_")
      this_backup_path = File.join(backup_directory, this_backup_path)
      @data_sources.each {|source| source.backup(this_backup_path)}
      sleep @interval*60
    end
  end
end

class PackRat
  include Singleton

  def inititialize
    @backups = []
  end

  def register_backup(backup)
    @backups << backup
  end

  def run
    threads = []
    @backups.each do |backup|
      threads << Thread.new {backup.run}
    end

    threads.each {|t| t.join}
  end
end

eval(File.read('backup.pr'))
PackRat.instance.run