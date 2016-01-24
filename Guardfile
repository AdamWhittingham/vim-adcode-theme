require 'guard/plugin'

guard :shell do
  watch(/.+\.palette$/) do |scheme_files|
    Array(scheme_files).each do |palette|
      scheme_name = palette.gsub(/\.palette/, '')
      output = "~/.vim/colors/#{scheme_name}.vim"
      sed_normal       = '/^hi Normal / s/ctermbg=[0-9]+ /ctermbg=NONE/'
      sed_statusbar_bg = '/^hi StatusLine / s/ctermbg=[0-9]+ /ctermbg=231 /'
      sed_statusbar_fg = '/^hi StatusLine / s/ctermfg=[0-9]+ /ctermfg=238 /'
      sed = "sed -E '#{sed_normal}' | sed -E '#{sed_statusbar_bg}' | sed -E '#{sed_statusbar_fg}'"
      `palette #{palette} | #{sed} > #{output}`
      puts "#{Time.now}: colorscheme '#{scheme_name}' updated"
    end
  end
end
