
# The version number for Rebirth.
REBIRTH_VERSION = [0,2]

require 'rake'

task :version do 
  puts "Rebirth v#{REBIRTH_VERSION.join(".")}"
end



#########
# SPECS #
#########

begin
  require 'spec/rake/spectask'


  desc "Run all specs"
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['spec/*_spec.rb']
  end


  namespace :spec do
    desc "Run all specs"
    Spec::Rake::SpecTask.new(:all) do |t|
      t.spec_files = FileList['spec/*_spec.rb']
    end

    desc "Run spec/[name]_spec.rb (e.g. 'color')"
    task :name do
      puts( "This is just a stand-in spec.",
            "Run rake spec:[name] where [name] is e.g. 'color', 'music'." )
    end
  end


  rule(/spec:.+/) do |t|
    name = t.name.gsub("spec:","")

    path = File.join( File.dirname(__FILE__),'spec','%s_spec.rb'%name )

    if File.exist? path
      Spec::Rake::SpecTask.new(name) do |t|
        t.spec_files = [path]
      end

      puts "\nRunning spec/%s_spec.rb"%name

      Rake::Task[name].invoke
    else
      puts "File does not exist: %s"%path
    end

  end

rescue LoadError

  error = "ERROR: RSpec is not installed?"

  task :spec do 
    puts error
  end

  rule( /spec:.*/ ) do
    puts error
  end

end
