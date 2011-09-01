class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  helpers = field_helpers + 
    %w(time_zone_select date_select) - 
    %w(hidden_field fields_for label)
  
    def bootstrap_wrapper(text)
       "------#{text}------"
    end
    
    def bootstrap_form_for(*args, &block)
      options = args.extract_options!
      options.merge(:builder => CustomFormBuilder)
      form_for(*(args + [options]), &block)
    end
  
  
    def email_field(name, options = {})
      options.reverse_merge! (:size => 12)
      #bootstrap_wrapper(@template.content_tag(:td, super))
      @template.content_tag(:td, super)
  #    ----#{@template.content_tag(:td, super)}"
    end

    
    def text_field(name, options = {})
      "pppp"
    end
    
  #def bootstrap_form_for(      record_or_name_or_array, *args, &proc) 
  #  form_for(      record_or_name_or_array, *args, &proc) 
  #end
end