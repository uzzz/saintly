module Saintly
  VERSION = "0.2"

  def self.sanitize(text)
    return if text.nil?
    r = Regexp.new('^(' + ALLOWED_WORDS.join('|') + ')$')
    text.gsub(exclude_regex){|m| r.match(m).nil? ? '*' * m.length : m }
  end

  private

  def self.exclude_regex
    /\b(#{(RESTRICTED_WORDS + partials_regex_array).join('|')})\b/i
  end

  def self.partials_regex_array
    RESTRICTED_PARTIALS.map{|w| '\w*' + w + '\w*'}
  end

  ALLOWED_WORDS = [ 'scunthorpe', 'shitake.*']

  RESTRICTED_PARTIALS = [
    'fuck',
    'shit',
    'nigger',
    'cunt',
    'ass(hole|hat|clown|wipe|_)',
    '(dumb|jack)ass'
    ]

  RESTRICTED_WORDS = [
    'twat', 'ass', 'tits', 'piss', 'cocksucker'
    ]

  module Base
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def sanctify(*args)
        options =  args.last.instance_of?(Hash) ? args.pop : {}
        define_attribute_methods

        args.each do |col|
          define_method (col.to_s+"_with_saintly").to_sym do
            Saintly.sanitize(read_attribute(col))
          end
          alias_method_chain col, :saintly
        end
      end
    end
  end
end
