require 'rubygems'
require "test/unit"
require 'saintly'
require 'shoulda'
require 'mocha'
require 'ruby-debug'

class SaintlyTest < Test::Unit::TestCase
  should "sanitize full word" do
    assert_equal '****', Saintly.sanitize('fuck')
    assert_equal '***', Saintly.sanitize('ass')
    assert_equal '****', Saintly.sanitize('shit')
    assert_equal '****', Saintly.sanitize('cunt')
    assert_equal '****', Saintly.sanitize('twat')
    assert_equal '******', Saintly.sanitize('nigger')
    assert_equal '*******', Saintly.sanitize('dumbass')
    assert_equal '*******', Saintly.sanitize('jackass')
    assert_equal '*******', Saintly.sanitize('asshole')
    assert_equal '********', Saintly.sanitize('assholes')
    
    assert_equal '******', Saintly.sanitize('asshat')
    assert_equal '********', Saintly.sanitize('assclown')
    assert_equal '*******', Saintly.sanitize('asswipe')
    
    
  end
  should "sanitize partial words" do
    assert_equal '*******', Saintly.sanitize('fucking')
    assert_equal '********', Saintly.sanitize('shithead')
    
  end
  
  should "not care about case" do
    assert_equal '***', Saintly.sanitize('Ass')
    
  end
  
  should "not sanitize allowed words" do
    assert_equal 'shitake', Saintly.sanitize('shitake')
  
    assert_equal 'assassin', Saintly.sanitize('assassin')
    assert_equal 'assumption', Saintly.sanitize('assumption')
    assert_equal 'assume', Saintly.sanitize('assume')
    assert_equal 'associate', Saintly.sanitize('associate')
    
    assert_equal 'bass', Saintly.sanitize('bass')
    assert_equal 'massachusetts', Saintly.sanitize('massachusetts')
    assert_equal 'mass', Saintly.sanitize('mass')
    
    assert_equal 'scunthorpe', Saintly.sanitize('scunthorpe')
    assert_equal 'lightwater', Saintly.sanitize('lightwater')
    
    assert_equal 'assets', Saintly.sanitize('assets')
    assert_equal 'glass', Saintly.sanitize('glass')
    assert_equal 'classified', Saintly.sanitize('classified')
    
  end
  
  
  class MockArModel
    
    def self.define_attribute_methods
    end
    def self.alias_method_chain(method, behavior)
      alias_method (method.to_s + '_without_' + behavior.to_s).to_sym, method
      alias_method method, (method.to_s + '_with_' + behavior.to_s).to_sym
      
    end
    def body
      read_attribute(:body)
    end
    
    def title
      read_attribute(:title)
    end
    
    def read_attribute (col)
      case col
      when :body
        'assassin ass fucking'
      when :title
        'typical shithead'
      end
    end
    
    include Saintly::Rails
    sanctify :body, :title

  end

  
  context "rails app" do
    setup do
      @m = MockArModel.new
    end
    
    should "create new methods" do
      assert_equal 'assassin ass fucking', @m.body_without_saintly
      assert_equal 'assassin *** *******', @m.body
    end
  end
    
end      