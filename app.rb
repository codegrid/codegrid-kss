require 'bundler'
Bundler.require

get '/' do
  erb :styleguide
end

get '/:category' do
  @styleguide = Kss::Parser.new('public/css')

  case params[:category]
  when 'buttons'
    erb :'buttons'
  else
    404
  end
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
end
