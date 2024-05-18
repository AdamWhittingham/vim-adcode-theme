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

    if Dir["~/.vim"]
      `cp #{repo_output} #{vim_output}`
      print "."
    end

    if Dir["~/.config/nvim"]
      `cp #{repo_output} #{nvim_output}`
      print "."
    end

    puts "updated"
  end
  nil
end
