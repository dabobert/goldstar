module Bootstrap1Helper
  class ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::AssetTagHelper

    # Accepts an int and displays a smiley based on >, <, or = 0
    def smile_tag(method, options = {})
      value = @object.nil? ? 0 : @object.send(method).to_i
      options[:id] = field_id(method,options[:index])
      smiley = ":-|"
      
      return text_field_tag(field_name(method,options[:index]),options) + smiley
    end

    def field_name(label,index=nil)
      output = index ? "[#{index}]" : ''
      return @object_name + output + "[#{label}]"
    end

    def field_id(label,index=nil)
      output = index ? "_#{index}" : ''
      return @object_name + output + "_#{label}"
    end

  end
end

=begin

<% form_for @quiz do |f| %>
  <%= f.smile_tag(:score) %>
<% end %>
There are some instance variables created by Rails that you can access in these helper methods:

@object - the model object specified by the form
@object_name - the class name of the object
@template - I think its an instance of the ActionView, you can possibly bypass all the includes I added by calling methods on the template. Haven't tried that yet.
@options - options passed to the FormBuilder when its created by the form_for call
I wrote the field_id and field_name methods to create these attributes on the HTML input elements the same way the regular helpers do, I'm sure there is a way to tie into the same methods that Rails uses, but I haven't found it yet.

The sky is the limit on what you can do with these helper methods, they simply return strings. You can create entire HTML tables or pages in one, but you better have a good reason to.

This file should be added in the app/helpers folder
=end