require 'colorize'
require 'before_actions'
require 'validates_email_format_of'
require 'user_agent_parser'
require 'http_accept_language'
require 'rails-i18n'
require 'bcrypt'
require 'nav_lynx'


require_relative "hello/engine"
require_relative "hello/configuration"

require_relative "hello/token"
require_relative "hello/errors"
require_relative "hello/locales"
require_relative "hello/device_name"
require_relative "hello/support"
require_relative "hello/manager"
require_relative "hello/rails"
