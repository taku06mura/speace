Rails.application.routes.draw do
  root to: "posts#index"
  root "posts#index"
end
