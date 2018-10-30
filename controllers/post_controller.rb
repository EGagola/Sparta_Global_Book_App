class PostController < Sinatra::Base

  configure:development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  $posts = [
    {
      id: 0,
      title: "Auli'i Cravalho - How Far I'll Go",
      body: "Moana finds herself drawn to the ocean despite the protests of her father and makes the decision to run away.",
      src: "https://www.fillmurray.com/500/400",
      embed_code: "cPAbx5kgCJo"
    },
    {
      id: 1,
      title: "Dwayne Johnson - You're Welcome",
      body: "Moana finds herself stranded on an island, only to discover it is the location of Mauri. ",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "79DijItQXMM"
    },
    {
        id: 2,
        title: "Jemaine Clement - Shiny",
        body: "Mauri and Moana go to the land of demons in search of his hook, knowing it to be in the lair of a gaint crab.",
        src: "https://www.fillmurray.com/500/360",
        embed_code: "93lrosBEW-Q"
    },
    {
      id: 3,
      title: "Moana - Song of the Ancestors",
      body: "Moana discovers her true self during a dark moment in her journey.",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "HEiSF8HpyDg"
    },
    {
      id: 4,
      title: "Moana - Where You Are",
      body: "Moana's parents explain the lifestyle of their island tribe and the role she will play as daughter of the chief.",
      src: "https://www.fillmurray.com/500/300",
      embed_code: "pLw2EfOmE7Y"
    }
  ]

  get "/" do
    @posts = $posts
    erb :'posts/index'
  end

  get "/new" do
    "<h1>Hello new page!</h1>"
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @posts = $posts[id]
    erb :'posts/edit'
  end


  get "/:id_from_URL" do
    id = params[:id_from_URL]
    @posts = $posts[id.to_i]
    erb :"posts/show"
  end

  post '/:id/edit' do
    @result = params['orig']
    erb :"posts/edit"
  end
end
