Rails.application.routes.draw do

  #----- Devise routes-----
  # This will generate all the routes for the User model through the devise gem
  devise_for :users
  #----- Devise routes -----

  # Defines the root path route ("/")
  root 'blog_posts#index'

  #----- Blog Posts routes -----
  # :id is a dynamic segment, which will be replaced with the ID of the blog post

  ## - "as: new_blog_post" gives the route a name, which can be used in the view helper as 'new_blog_post_path'
  ## - the 'new' route will always be above the 'show' route, otherwise the 'show' route will be used instead of the 'new' route
  # get '/blog_posts/new', to: 'blog_posts#new', as: :new_blog_post

  # ## - "as: blog_post" gives the route a name, which can be used in the view helper as 'blog_post_path'
  # get '/blog_posts/:id', to: 'blog_posts#show', as: :blog_post

  # ## - we need this route to handle the form submission from the 'new' route
  # post '/blog_posts', to: 'blog_posts#create', as: :blog_posts

  # ## - This route will be used to display the edit form
  # get '/blog_posts/:id/edit', to: 'blog_posts#edit', as: :edit_blog_post

  # ## - This route will be used to handle the form submission from the 'edit' route
  # patch '/blog_posts/:id', to: 'blog_posts#update'

  # ## - This route will be used to delete a blog post
  # delete '/blog_posts/:id', to: 'blog_posts#destroy'
  #----- Blog Posts routes -----

  resources :blog_posts
end
