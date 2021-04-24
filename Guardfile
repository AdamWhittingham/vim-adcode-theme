require 'guard/plugin'
require 'fileutils'


guard :shell do
  watch(/\.palette$/) do |scheme_files|
    Array(scheme_files).each do |palette_file|
      palette = palette_file[0]
      scheme_name = palette.to_s.gsub(/\.palette/, '')
      local_output = "./#{scheme_name}.vim"
      vim_output = "~/.vim/colors/#{scheme_name}.vim"

      italic_sed = "sed -E 's/gui=ITALIC/& cterm=ITALIC/g'"
      bold_sed = "sed -E 's/gui=BOLD/& cterm=BOLD/g'"
      `palette #{palette} | #{italic_sed} | #{bold_sed} > #{vim_output}`
      puts "#{Time.now}: colorscheme '#{scheme_name}' updated"
    end
    nil
  end
end
