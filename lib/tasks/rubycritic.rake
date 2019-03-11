require "rubycritic/rake_task"

RubyCritic::RakeTask.new do |task|
  task.paths   = FileList['app/controllers','app/models','app/views','app/helpers']

  task.options = '-f html'

  task.verbose = true
end
