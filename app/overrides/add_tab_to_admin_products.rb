Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_rodaben_specs",
                     :insert_bottom => "[data-hook='admin_product_tabs']",
                     :text => %q{
         <li<%== ' class="active"' if current == 'Product Tires Info' %>>
        <%= link_to_with_icon 'icon-tasks', t(:product_tires_info), tires_info_admin_product_url(@product) %>
      </li>})