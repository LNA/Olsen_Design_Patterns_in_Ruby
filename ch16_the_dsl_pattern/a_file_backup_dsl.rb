# Building an internal DSL in Ruby

# We want to build a backup program that will
# copy files to a safe directory.

# Olsen decides to do so by creating PackRat, a DSL
# that will allow users to decided what and when to back up files.

# We have 3 directories that we want copied to 'external_drive/backups'
# once an hour. So...

backup '/home/russ/documents'

backup '/home/russ/music', file_name('*.mp3')& file_name('*.wav')

backup '/home/russ/images', except(file_name('*.tmp'))

to 'external_drive/backups'

interval 60