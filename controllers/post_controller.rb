class PostController < Sinatra::Base

  configure:development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  get "/" do
    @book = Book.all
    erb :'posts/index'
  end

  get "/new" do
    @book = Book.new
    erb :'posts/new'
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @book = Book.find id
    erb :'posts/edit'
  end

  get "/:id" do
    id = params[:id].to_i
    @book = Book.find id
    erb :"posts/show"
  end

  put '/:id' do
    id = params[:id].to_i
    book = Book.find id
    book.title = params[:title]
    book.author = params[:author]
    book.description = params[:description]
    book.save
    redirect '/'
  end

  post '/' do
    book = Book.new
    book.title = params[:title]
    book.author = params[:author]
    book.description = params[:description]
    book.save
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    Book.rip id
    redirect '/'
  end
end
