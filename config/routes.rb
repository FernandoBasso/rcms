Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Let's make locale on the url optional. This way, if the user
  # goes to /admin/posts and the default locale is pt-BR, it is
  # the same as /pt-BR/admin/posts but withoug pt-BR in the url.
  scope '(:locale)', locale: /en|pt-BR/ do
    namespace 'admin' do
      resources :post_categories
      resources :posts
    end
  end
end
