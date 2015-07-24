require 'bundler'
Bundler.require()

def fake_movie(name, release_year, description)
  {:name => name.to_s, :release_year => release_year.to_s,
     :description => description.to_s}.to_json
end

get '/' do
  cross_origin
  fake_movie('Sample Movie',2000,'This is just a sample')
end

get '/api/aliens' do
  cross_origin
  fake_movie('Aliens',1986,'Sigourney Weaver as Ellen Ripley')
end

get '/api/terminator' do
  cross_origin
  fake_movie('Terminator',1984,'Arnold is the Terminator')
end

get '/api/oklahoma' do
  cross_origin
  fake_movie('Oklahoma',1955,'A brand new state. People will say we\'re in love.')
end
