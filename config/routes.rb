Rails.application.routes.draw do
  root 'top#main'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  # error アクションは render で使ってるので明示の route は不要だがあっても良い
  get 'top/error'
end
