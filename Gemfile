source 'https://rubygems.org'

gem 'active_model_serializers', '~> 0.9.3'
gem 'active_skin', github: 'SoftwareBrothers/active_skin'
gem 'activeadmin', '~> 2.6'
gem 'activeadmin_addons'
gem 'aws-sdk-s3', '~> 1.0'
gem 'bootsnap', require: false
gem 'data_migrate'
gem 'devise'
gem 'devise-i18n'
gem 'draper', '~> 3.1'
gem 'enumerize'
gem 'jbuilder', '~> 2.7'
gem 'pg'
gem 'power-types'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 0.4.0'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rails-i18n'
gem 'recipient_interceptor'
gem 'responders'
gem 'sass-rails', '>= 6'
gem 'send_grid_mailer'
gem 'sentry-raven'
gem 'sidekiq'
gem 'sidekiq-scheduler', '>= 3.0.1'
gem 'simple_token_authentication', '~> 1.0'
gem 'strong_migrations'
gem 'turbolinks', '~> 5'
gem 'versionist'
gem 'webpacker', '~> 4.0'

group :development do
  gem 'annotate', '~> 3.0'
  gem 'listen'
  gem 'spring'
end

group :test do
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rack-timeout'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-nc', require: false
  gem 'rspec-rails'
end

group :production, :development, :test do
  gem 'tzinfo-data'
end
