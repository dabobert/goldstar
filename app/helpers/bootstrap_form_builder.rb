class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  
  def build_row label, element
     "<div class=\"clearfix\">
   		   #{label}
  		  <div class=\"input\">
  		    #{element}
  		  </div>
  		</div>".html_safe   
  end
end
=begin
<%= form_for(resource, :as => resource_name, :url => session_path(resource_name)) do |f| %>
	<fieldset class="devise">
		<legend>Sign in</legend>
		<div class="clearfix">
		  <%= f.label :email %>
		  <div class="input">
		    <%= f.text_field :email %>
		  </div>
		</div>

		<div class="clearfix">
		  <%= f.label :password %>
		  <div class="input">
		    <%= f.password_field :password %>
		  </div>
		</div>


	  <% if devise_mapping.rememberable? -%>
	    <div><%= f.check_box :remember_me %> <%= f.label :remember_me %></div>
	  <% end -%>
	
		<div class="clearfix">
		  <div class="input">
		    <button class="btn success">Sign in</button>
		  </div>
		</div>
		
	</fieldset>
<% end %>

<%= render :partial => "devise/shared/links" %>
----------------------------------------------------------------
<%= form_for(resource, :as => resource_name, :url => registration_path(resource_name),:builder => BootstrapFormBuilder) do |f| %>
	<fieldset class="devise">
		<legend>Sign in</legend>
		<%= f.build_row f.label( :email), f.text_field( :email) %>
		<%= f.build_row f.label( :password), f.password_field(:email) %>
	  <% if devise_mapping.rememberable? -%>
	    <%= f.build_row f.label(:remember_me), f.check_box(:remember_me) %>
	  <% end -%>
		<%= f.build_row nil, '<button class="btn success">') %>		
	</fieldset>
<% end %>

<%= render :partial => "devise/shared/links" %>




=end