class Chitter < Sinatra::Base
  before { @user = User.find(id: session[:user_id]) if session[:user_id] }

  configure do
    register Sinatra::Flash, Sinatra::ActiveRecordExtension
    enable :sessions, :method_override
    set :root, File.dirname(File.expand_path('..', __FILE__))
    set :public_folder, Proc.new { File.join(root, '../public') }
    set :session_secret, ENV['SESSION_SECRET']
    set :database, {
      adapter: 'postgresql',
      encoding: 'unicode',
      database: 'chitter',
      pool: 2,
      username: 'adamjonas'
    }
  end

  get '/' do
    redirect '/posts'
  end
end
