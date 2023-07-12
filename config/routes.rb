Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  post 'add-activity', to: 'activities#addActivity'
  delete 'remove-activity/:id', to: 'activities#removeActivity'
  get 'activities', to: 'activities#index'

  get 'itineraries' => 'itinerary#index'
  get 'archived-itineraries' => 'itinerary#archived'
  post 'create-itinerary' => 'itinerary#create'
  delete 'remove-itinerary/:id' => 'itinerary#remove'
  put 'update-itinerary' => 'itinerary#update', as: :update_itinerary

  get 'profile/:id' => 'profile#show'
end
