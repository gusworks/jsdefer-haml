require 'haml'
require 'jsdefer'

module Haml
  module Filters
    module Javascript
      include Base
      
      def render_with_options(text, options)
        if options[:format] == :html5
          type = ''
        else
          type = " type=#{options[:attr_wrapper]}text/javascript#{options[:attr_wrapper]}"
        end

        JsDefer.instance.push_script "<script#{type}>
  //<![CDATA[
    #{text.rstrip.gsub("\n", "\n    ")}
  //]]>
</script>"
        nil
      end
    end
  end
end
