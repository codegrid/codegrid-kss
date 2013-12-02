require 'bundler'
Bundler.require

get '/' do
  @styleguide = Kss::Parser.new('public/css')
  erb :styleguide
end

helpers do
  include Rack::Utils; alias_method :h, :escape_html

  def styleguide_block(section, &block)
    section = @styleguide.section(section)
    modifiers = section.modifiers
    html = capture(&block)
    @_out_buf.concat erb(:_styleguide_block, :locals => {
      section: section,
      modifiers: modifiers,
      html: html
    })
  end
end
