require 'slim'
require 'temple'

module Slim
  module HTag
    class Filter < ::Slim::Filter

      define_options htag_level_attr: 'level'


      def initialize(opts = {})
        super
        @level_attr = options[:htag_level_attr]
      end

      def on_html_tag(tag, attributes, content = nil)
        return super if tag != 'h'

        level_index = attributes.find_index do |attrs|
          attrs[0..2] == [:html, :attr, @level_attr]
        end
        unless level_index
          fail Temple::FilterError, "Missing attribute '#{@level_attr}' on tag 'h'"
        end

        level_exp = attributes.delete_at(level_index).last
        if level_exp[0] == :slim && level_exp[1] == :attrvalue
          level_exp = [:dynamic, level_exp.last]
        end

        [:multi,
          [:capture, (level_var = unique_name), [:escape, true, level_exp]],
          [:multi,
            [:static, '<h'],
            [:dynamic, level_var],
            attributes,
            [:static, '>']],
          (compile(content) if content),
          [:multi,
            [:static, '</h'],
            [:dynamic, level_var],
            [:static, '>'],
          ]
        ].compact
      end
    end
  end
end
