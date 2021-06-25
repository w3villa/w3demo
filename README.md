# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<%= form_with(model: blog, local: true) do |form| %>
  <% if blog.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(blog.errors.count, "error") %> prohibited this blog from being saved:</h2>
      <ul>
        <% blog.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="form-row">
    <div class="formlable">
      <%= form.label :title,class:"form-label" %>
    </div>
    <div class="formfield">
       <%= form.text_field :title , class: "form-control" %>
    </div>
  </div>
  <div class="form-row">
    <div class="formlable">
      <%= form.label :image %>
    </div>
    <div >
       <%= form.file_field :image %>
    </div>
  </div>
  <div class="form-row">
    <div class="formlable">
      <%= form.label :body, class:"form-label"  %>
    </div>
    <div class="formfield">
       <%= form.rich_text_area :body %>
    </div>
  </div>
  <div class="form-row">
    <div class="formlable">
      <%= form.label :category%>
    </div>
    <div class="formfield">
       <%= form.select :category_id, Category.all.map {|c|[c.name, c.id]}, class: "form-control" %>
    </div><br/>
  <% @blog.tags.each_with_index do |tag, i| %> 
    <div>
      <input type="hidden" value="<%= tag.id %>" name="blog[tags_attributes][<%= i %>][id]">
      <label>Tag#<%= i + 1%>: <input type="text" value="<%= tag.name %>" name="user[tags_attributes][<%= i %>][name]"></label>
      <input type="hidden" value="false" name="blog[tags_attributes][<%= i %>][_destroy]">
      <input type="checkbox" value="true" name="blog[tags_attributes][<%= i %>][_destroy]">
    </div>
  <% end %>
  <label>New tag: <input type="text" value="" name="blog[tags_attributes][<%= @blog.tags.count %>][name]"></label>
  <br><br>
  <div class="form-row">
    <div class="formlable">
         <%= form.label :user_id  %>
    </div>
    <div class="formfield">
       <%= form.select :user_id, User.all.map {|c|[c.name, c.id]}, class: "form-control" %>
    </div>
  </div>  
  <div class="action">
    <%= form.submit  class: "btn-submit" %>
  </div>
<% end %>


 def blog_params
      params.require(:blog).permit(:title, :body, :user_id, :category_id, :tag_list,:tag_id, :image,tags_attributes: [:name, :id, :_destroy])
    end




  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end







 <div class="field">
    <%= form.label :title %>
    <%= form.text_field :title, class: "form-control" %>
  </div>

  <div class="field">
    <%= form.label :body %>
    <%= form.rich_text_area :body, class: "form-control" %>
  </div>
  </br>
  <div class="field">   
     <%= form.select :category_id, Category.all.map {|c|[c.name, c.id]}, class: "form-control" %>
  </div>

  <div class="field">
      <%= form.label :user_id %>
      <%= form.number_field :user_id, class: "form-control" %>
  </div>
  
  <% @blog.tags.each_with_index do |tag, i| %> 
    <div class="field">
      <input type="hidden" value="<%= tag.id %>" name="blog[tags_attributes][<%= i %>][id]">
      <label>Tag#<%= i + 1%>: <input type="text" value="<%= tag.name %>" name="user[tags_attributes][<%= i %>][name]"></label>
      <input type="hidden" value="false" name="blog[tags_attributes][<%= i %>][_destroy]">
      <input type="checkbox" value="true" name="blog[tags_attributes][<%= i %>][_destroy]">
    </div>
    <input type="text" value="" name="blog[tags_attributes][<%= @blog.tags.count %>][name]">
  <% end %>    


  </br>

  <div class="actions">
      <%= form.submit %>
  </div>




<% @blog.tags.each_with_index do |tag, i| %> 
    <div>
      <input type="hidden" value="<%= tag.id %>" name="blog[tags_attributes][<%= i %>][id]">
      <label>Tag#<%= i + 1%>: <%= tag.name %></label>
      <input type="hidden" value="false" name="blog[tags_attributes][<%= i %>][_destroy]">
      <input type="checkbox" value="true" name="blog[tags_attributes][<%= i %>][_destroy]">
    </div>
  <% end %>
  <label>New tag: <input type="text" value="" name="blog[tags_attributes][<%= @blog.tags.count %>][name]"></label>
  <br><br>




  w3villa-blog-talib