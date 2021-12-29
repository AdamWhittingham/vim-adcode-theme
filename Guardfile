require 'guard/plugin'
require 'fileutils'

italic_sed = "sed -E 's/gui=ITALIC/& cterm=ITALIC/g'"
bold_sed = "sed -E 's/gui=BOLD/& cterm=BOLD/g'"

guard :shell do
  watch(/\.palette$/) do |scheme_files|
    Array(scheme_files).each do |palette_file|
      palette = palette_file[0]
      scheme_name = palette.to_s.gsub(/\.palette/, '')
      print "#{Time.now}: colorscheme '#{scheme_name}'"

      repo_output = "./colors/#{scheme_name}.vim"
      vim_output = "~/.vim/colors/#{scheme_name}.vim"
      nvim_output = "~/.config/nvim/colors/#{scheme_name}.vim"

      `palette #{palette} | #{italic_sed} | #{bold_sed} > #{repo_output}`
			print "."

      `cp #{repo_output} #{vim_output}`
			print "."
      `cp #{repo_output} #{nvim_output}`
			print "."
      puts "updated"
    end
    nil
  end
end
