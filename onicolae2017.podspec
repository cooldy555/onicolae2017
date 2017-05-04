Pod::Spec.new do |s|
  s.name = 'onicolae2017'
  s.version = '0.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'pod for ecole 42'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  my very important pod
                       DESC

  s.homepage         = 'https://github.com/cooldy555/onicolae2017'
  s.authors = { 'PROJECT_OWNER' => 'USER_EMAIL' }
  s.source = { :git => 'https://github.com/cooldy555/onicolae2017.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.frameworks = 'UIKit', 'CoreData'
  s.source_files = 'onicolae2017/Classes/**/*'
  # s.resource_bundles = {
  #   'onicolae2017' => ['Resources/**/*.{png}']
  # }
end
