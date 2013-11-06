require_relative '../../models/year_2013'

get '/2013' do
  haml 'year_2013/index'.to_sym, layout: 'year_2013/layout'.to_sym
end

get '/2013/speakers' do
  haml 'year_2013/speakers'.to_sym, layout: 'year_2013/layout'.to_sym
end

get '/2013/speakers/:name' do
  if params[:name] == 'mccoy_myers'
    haml 'year_2013/mccoy_myers'.to_sym, layout: 'year_2013/layout'.to_sym
  else
    haml 'year_2013/speaker'.to_sym, locals: { speaker: Year2013::Speakers[params[:name]] }, layout: 'year_2013/layout'.to_sym
  end
end

get '/2013/workshop' do
  haml 'year_2013/workshop'.to_sym, layout: 'year_2013/layout'.to_sym
end
