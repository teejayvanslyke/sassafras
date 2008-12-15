Gem::Specification.new do |s|
  s.name = %q{sassafras}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["T.J. VanSlyke"]
  s.date = %q{2008-12-15}
  s.default_executable = %q{sassafras}
  s.description = %q{Sass color scheme generator}
  s.email = ["tj@elctech.com"]
  s.executables = ["sassafras"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.markdown", "Rakefile", "bin/sassafras", "config/hoe.rb", "config/requirements.rb", "examples/analogous_red.html", "examples/split_complementary_blue.html", "lib/sassafras.rb", "lib/sassafras/swatch.html.erb", "lib/sassafras/version.rb", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/sassafras_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "swatch.html", "tasks/deployment.rake", "tasks/environment.rake", "tasks/examples.rake", "tasks/rspec.rake", "tasks/website.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/teejayvanslyke/sassafras}
  s.post_install_message = %q{
For more information on sassafras, see http://sassafras.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sassafras}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Sass color scheme generator}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
