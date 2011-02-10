# encoding: utf-8
require 'saintly'
require 'rails'

class Railtie < ::Rails::Railtie
  initializer "saintly.on_rails_init" do
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send :include, Saintly::Base
    end
  end
end
