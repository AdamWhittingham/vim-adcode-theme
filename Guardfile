require 'guard/plugin'

guard :shell do
  watch(/.+\.palette$/) do |scheme_files|
    Array(scheme_files).each do |palette|
      scheme_name = palette.gsub(/\.palette/, '')
      `palette #{palette} > ~/.vim/colors/#{scheme_name}.vim`
      n "Vim colorscheme '#{scheme_name}' updated"
    end
  end
end
