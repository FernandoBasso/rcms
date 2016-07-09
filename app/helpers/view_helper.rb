module ViewHelper

  # Used to add an 'active' class to links that match the current url.
  # It works even if the user is editing a resource.
  #
  # 'ctrl' is something like 'posts' or 'admin/posts' that match the
  # controller when invoking one of the CRUD actions for a model.
  #
  # Examples:
  #
  #   <li class='nav-item'>
  #     <%= link_to 'Post Categories', admin_post_categories_path,
  #       class: "nav-link #{active_css_class('admin/post_categories')}" %>
  #   </li>
  #   <li class='nav-item'>
  #     <%= link_to 'Posts', admin_posts_path,
  #       class: "nav-link #{active_css_class('admin/posts')}" %>
  #   </li>
  def active_css_class(ctrl)
    controller_path == ctrl ? 'active' : ''
  end

end
