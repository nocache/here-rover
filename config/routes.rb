Rails.application.routes.draw do
  root :to => redirect('locations#index')
  get 'locations' => 'locations#index'
  get 'locations/rover/:vehicle_id' => 'locations#show', :as => :rover
end
