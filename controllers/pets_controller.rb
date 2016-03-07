require_relative('../models/pet.rb')
require_relative('../models/store.rb')


#create
post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  redirect to("/stores#{params['store_id']}")

end


#show

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  @store = @pet.team()
  erb :"pets/show"
end


#edit

get '/pets/:id/edit' do
  @pet = Pet.find(params[:id])
  @stores = Store.all()
  erb :"pets/edit"
end


#update
post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update()
  redirect to ("/stores/#{params['store_id']}")
end

delete '/pets/:id' do
  Pet.destory(params[:id])
  redirect to ('/store')
end




#delete