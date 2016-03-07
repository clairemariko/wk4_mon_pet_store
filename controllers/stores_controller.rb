require_relative('../models/store.rb')

#index
get '/stores' do
  @stores = Store.all()
  erb :"stores/index"
end



#new
get '/stores/new' do
  erb :"stores/new"
end



#create
post '/stores' do
  @store=Store.new(params)
  @store.save()
  redirect '/stores'
end


#show
get '/stores/:id' do
  @store = Store.find(params[:id])
  @pets = store.pets()
  erb :"stores/pet"
end


#edit
get '/stores/:id/edit' do
  @store = Store.find(params[:id])
  erb :"stores/edit"
end

#update
post '/stores/:id' do
  @store = Store.new(params)
  @store.update()
  redirect to("/stores/#{params['id']}")

end

#delete
delete '/stores/:id' do
 Store.destory(params[:id])
 redirect to ('/store')
end
