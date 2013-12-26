require 'bundler'
Bundler.require

get '/styleguide/:category' do
  @styleguide = Kss::Parser.new('public/css')

  category = params[:category]

  categories = [
    'buttons',
    'menus',
  ]

  case category
  when *categories
    render_styleguide category
  else
    404
  end
end

get '/styleguide/' do
  erb :'styleguide/index', :layout => :'styleguide/layout'
end

get '/' do
  erb :index
end

helpers do
  include Rack::Utils; alias_method :h, :escape_html

  def styleguide_block(section, &block)
    section = @styleguide.section(section)
    modifiers = section.modifiers
    html = capture(&block)
    @_out_buf.concat erb(:'styleguide/_styleguide_block', :locals => {
      :section => section,
      :modifiers => modifiers,
      :html => html
    })
  end

  def render_styleguide(template)
    erb :"styleguide/categories/#{template}", :layout => :'styleguide/layout'
  end

  def m(text)
    markdown text, :input => 'GFM'
  end
end
