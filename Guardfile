require 'guard/plugin'
require 'fileutils'

scheme_name = "adCode"
repo_output = "./colors/#{scheme_name}.vim"
vim_output = "~/.vim/colors/#{scheme_name}.vim"
nvim_output = "~/.config/nvim/colors/#{scheme_name}.vim"

guard :shell do
  watch("theme.rb") do |scheme_files|
    puts "#{Time.now}: generating '#{scheme_name}'"

    `./theme.rb > #{repo_output}`

    if Dir["~/.vim"]
      print "  Vim "
      `mkdir -p ~/.vim/colors/`
      `cp #{repo_output} #{vim_output} &>/dev/null`
      puts "✓"
    end

    if Dir["~/.config/nvim"]
      print "  Neovim "
      `mkdir -p ~/.config/nvim/colors/`
      `cp #{repo_output} #{nvim_output}`
      puts "✓"
    end
  end
  nil
end
