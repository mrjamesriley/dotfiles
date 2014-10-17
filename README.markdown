## Installation

        git clone git://github.com/mrjamesriley/dotfiles ~/.dotfiles
        cd ~/.dotfiles
        ruby install.rb

        Add `source ~/.aliases` to your .bashrc file.


## Updating a Vim Bundled Plugin

Updating a plugin is a simple case of switching to its directory and pull from origin/master.  
Then, you want to switch back to root, and commit the updated submodule.

        cd vim/bundle/ack.vim
        git pull origin master
        cd ../../../
        git add vim/bundle/ack.vim
        git commit -m "updated ack.vim vim plugin"
