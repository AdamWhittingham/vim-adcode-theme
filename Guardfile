require 'guard/plugin'
require 'fileutils'

scheme_name = "adCode"
repo_output = "./colors/#{scheme_name}.vim"
vim_output = "~/.vim/colors/#{scheme_name}.vim"
nvim_output = "~/.config/nvim/colors/#{scheme_name}.vim"

guard :shell do
  watch("theme.rb") do |scheme_files|
    print "#{Time.now}: generating '#{scheme_name}'"

    `./theme.rb > #{repo_output}`
    print "."

    `cp #{repo_output} #{vim_output}`
    print "."
    `cp #{repo_output} #{nvim_output}`
    print "."

    puts "updated"
  end
  nil
end
