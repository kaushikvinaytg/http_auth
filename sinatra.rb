require "sinatra"

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == [params[:username], params[:password]]
  end
end

get '/download/*' do |filename|
  protected!
  send_file "#{__dir__}/files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end