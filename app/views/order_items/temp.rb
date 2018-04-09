<%= simple_form_for @order_item, :html => { :class => 'form-horizontal' } do |f| %>
  <fieldset>
    <legend><%= controller.action_name.capitalize %> OrderItem</legend>

    <%= f.input :order_id, collection: Order.all %>
		<%= f.input :item_id, collection: Item.active.alphabetical %>
    <%= f.input :quantity, label: "Quantity", as: :integer%>
	
    <p>&nbsp;</p>
    <div class="form-actions">
      <%= f.submit nil, class: 'button radius' %>
      <%= link_to 'Cancel', orders_path, class: 'button radius alert' %>
    </div>
  </fieldset>
<% end %>