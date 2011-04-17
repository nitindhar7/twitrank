require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

load 'test/tasks.rake'

desc 'Default: run unit tests.'
task :default => :test

desc 'Generate documentation for the GeoKit plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'GeoKit'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'yaml'
about = YAML.load(IO.read('about.yml'))

%w[rubygems hoe].each { |f| require f }

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec('geokit-rails') do |p|
  p.version = about['version']
  p.developer("Andre Lewis", "andre@earthcode.com")
  p.developer("Bill Eisenhauer", "bill@billeisenhauer.com")
  p.changes = p.paragraphs_of("CHANGELOG.rdoc", 0..1).join("\n\n")
  p.summary = about['summary']

  p.rubyforge_name       = p.name # TODO this is default value
  p.extra_deps         = [
     ['geokit', '>= 1.5.0']
  ]

  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  p.rsync_args = '-av --delete --ignore-errors'
end

desc 'Recreate Manifest.txt to include ALL files'
task :manifest do
  `rake check_manifest | grep -v "^\(in" | patch -p0`
end

desc "Generate a #{$hoe.name}.gemspec file"
task :gemspec do
  File.open("#{$hoe.name}.gemspec", "w") do |file|
    file.puts $hoe.spec.to_ruby
  end
end
