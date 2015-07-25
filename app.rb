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

get '/api/faker' do
  cross_origin
  if rand > 0.4
    title = Faker::Name.first_name
  else
    title = Faker::Lorem.word.capitalize
  end
  if rand > 0.5
    title += " " + Faker::Lorem.word.capitalize
  end
  if rand > 0.5
    if rand > 0.5
      title += " the"
    end
    title += " " + Faker::Lorem.word.capitalize
  end
  release_year =Faker::Number.between(1955,2012)
  description = Faker::Lorem.paragraph(2)
  fake_movie(title,release_year,description)
end

get '/api/aliens' do
  cross_origin
  fake_movie('Aliens',1986,'The planet from Alien (1979) has been colonized,' \
    ' but contact is lost. This time, the rescue team has impressive' \
    ' firepower, but will it be enough?')
end

get '/api/terminator' do
  cross_origin
  fake_movie('The Terminator',1984,'A human-looking indestructible cyborg is' \
    ' sent from 2029 to 1984 to assassinate a waitress, whose unborn son will' \
    ' lead humanity in a war against the machines, while a soldier from that' \
    ' war is sent to protect her at all costs.')
end

get '/api/oklahoma' do
  cross_origin
  fake_movie('Oklahoma!',1955,'In the Oklahoma territory at the turn of the' \
    ' twentieth century, two young cowboys vie with an evil ranch hand and' \
    ' a traveling peddler for the hearts of the women they love.')
end
