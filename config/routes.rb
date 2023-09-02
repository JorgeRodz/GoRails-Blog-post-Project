Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'blog_posts#index'

  #----- Blog Posts routes -----
  # :id is a dynamic segment, which will be replaced with the ID of the blog post

  # "as: new_blog_post" gives the route a name, which can be used in the view helper as 'new_blog_post_path'
  # the 'new' route will always be above the 'show' route, otherwise the 'show' route will be used instead of the 'new' route
  get '/blog_posts/new', to: 'blog_posts#new', as: :new_blog_post

  # "as: blog_post" gives the route a name, which can be used in the view helper as 'blog_post_path'
  get '/blog_posts/:id', to: 'blog_posts#show', as: :blog_post

  # we need this route to handle the form submission from the 'new' route
  post '/blog_posts', to: 'blog_posts#create', as: :blog_posts
  #----- Blog Posts routes -----
end
