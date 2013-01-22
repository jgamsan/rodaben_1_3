Deface::Override.new(:virtual_path => %q{spree/admin/orders/index},
                          :name => %q{replace_time_format_in_order_index},
                          :replace => %q{[data-hook="admin_orders_index_rows"]},
                          :text => %q{
            <tr data-hook="admin_orders_index_rows" class="state-<%= order.state.downcase %> <%= cycle('odd', 'even') %>">
      <td class="align-center"><%= l (@show_only_completed ? order.completed_at : order.created_at).to_time %></td>
      <td><%= link_to order.number, admin_order_path(order) %></td>
      <td class="align-center"><span class="state <%= order.state.downcase %>"><%= t("order_state.#{order.state.downcase}") %></span></td>
      <td class="align-center"><span class="state <%= order.payment_state %>"><%= link_to t("payment_states.#{order.payment_state}"), admin_order_payments_path(order) if order.payment_state %></span></td>
      <td class="align-center"><span class="state <%= order.shipment_state %>"><%= link_to t("shipment_states.#{order.shipment_state}"), admin_order_shipments_path(order) if order.shipment_state %></span></td>
      <td><%= mail_to order.email %></td>
      <td class="align-center"><%= order.display_total %></td>
      <td class='actions align-center' data-hook="admin_orders_index_row_actions">
        <%= link_to_edit_url edit_admin_order_path(order), :title => "admin_edit_#{dom_id(order)}", :no_text => true %>
      </td>
    </tr>})