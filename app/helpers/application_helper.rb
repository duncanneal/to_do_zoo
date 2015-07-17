module ApplicationHelper

  def sidebar_nav_item(label, path, controller_name)
    active_class = controller.controller_name == controller_name ? 'active' : ''
    content_tag :li, :class => active_class do
      link_to label, path
    end
  end
end
