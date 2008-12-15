task :build_examples do
  def build_example(sassafras_options, output_file)
    sh "#{File.dirname(__FILE__)}/../bin/sassafras #{sassafras_options} > #{File.dirname(__FILE__)}/../examples/#{output_file}"
  end

  build_example '-t split_complementary -b blue -f html', 'split_complementary_blue.html'
  build_example '-t analogous -b red -f html',            'analogous_red.html'
end
