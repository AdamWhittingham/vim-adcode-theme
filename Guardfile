require 'guard/plugin'

guard :shell do
  watch(/.+\.palette$/) do |scheme_files|
    Array(scheme_files).each do |palette|
      scheme_name = palette.gsub(/\.palette/, '')
      output = "~/.vim/colors/#{scheme_name}.vim"
      `palette #{palette} | sed -E '/^hi Normal / s/ctermbg=[0-9]+ /ctermbg=NONE/' > #{output}`
      n "Vim colorscheme '#{scheme_name}' updated"
    end
  end
end
