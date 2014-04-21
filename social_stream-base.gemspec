require File.join(File.dirname(__FILE__), 'lib', 'social_stream', 'base', 'version')

Gem::Specification.new do |s|
  s.name = "social_stream-base"
  s.version = SocialStream::Base::VERSION.dup
  s.summary = "Basic features for Social Stream, the core for building social network websites"
  s.description = "Social Stream is a Ruby on Rails engine providing your application with social networking features and activity streams.\n\nThis gem packages the basic functionality, along with basic actors (user, group) and activity objects(post and comments)"
  s.authors = [ "GING - DIT - UPM",
                "CISE - ESPOL",
                "FluxAugur" ]
  s.homepage = "http://social-stream.dit.upm.es/"
  s.files = `git ls-files`.split("\n")

  # Gem dependencies
  #
  # Activity and Relation hierarchies
  s.add_runtime_dependency('ancestry', '~> 2.1.0')
  # SQL foreign keys
  s.add_runtime_dependency('foreigner', '~> 1.6.1')
  # Authentication
  s.add_runtime_dependency('devise', '~> 3.2.4')
  # CRUD controllers
  s.add_runtime_dependency('inherited_resources', '~> 1.4.1')
  # Slug generation
  s.add_runtime_dependency('stringex', '~> 2.5.2')
  # Avatar attachments
  s.add_runtime_dependency('avatars_for_rails', '~> 1.1.4')
  # jQuery
  s.add_runtime_dependency('jquery-rails', '~> 3.1.0')
  # Authorization
  s.add_runtime_dependency('cancan', '~> 1.6.10')
  # Pagination
  s.add_runtime_dependency('kaminari', '~> 0.15.1')
  # OAuth client
  s.add_runtime_dependency('omniauth','~> 1.2.1')
  # OAuth provider
  s.add_runtime_dependency('omniauth-twitter','~> 1.0.1')
  # Messages
  s.add_runtime_dependency('mailboxer','~> 0.11.0')
  # Avatar manipulation
  s.add_runtime_dependency('rmagick','~> 2.13.2')
  # Tagging
  s.add_runtime_dependency('acts-as-taggable-on','~> 3.1.1')
  # HTML Forms
  s.add_runtime_dependency('formtastic','~> 2.2.1')
  # Simple Forms
  s.add_runtime_dependency('simple_form', '~> 3.0.2')
  #Gem dependencies
  s.add_runtime_dependency('resque','~> 1.25.2')

  # Freeze Rails to 3.0.7 until Mailboxer bug is fixed
  s.add_runtime_dependency('rails', '4.1.0')

  # Development Gem dependencies
  # Integration testing
  s.add_development_dependency('capybara', '~> 2.2.1')
  # Testing database
  s.add_development_dependency('sqlite3-ruby')
  # Debugging
  if RUBY_VERSION < '1.9'
    s.add_development_dependency('ruby-debug', '~> 0.10.3')
  end
  # Specs
  s.add_development_dependency('rspec-rails', '~> 2.14.2')
  # Fixtures
  s.add_development_dependency('factory_girl', '~> 4.4.0')
  # Population
  s.add_development_dependency('forgery', '~> 0.6.0')
  # Continous integration
  s.add_development_dependency('ci_reporter', '~> 1.9.2')
  # Scaffold generator
  s.add_development_dependency('nifty-generators','~> 0.4.6')
end
