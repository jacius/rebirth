
# The version number for Rebirth.
REBIRTH_VERSION = [0,0,0]

require 'rake'

begin
  require 'spec/rake/spectask'

  desc "Run all specs (tests)"
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['specs/*_spec.rb']
  end
rescue LoadError
  task :spec do 
    puts "ERROR: RSpec is not installed?"
  end
end
