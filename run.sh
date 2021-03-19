for file in `ls files -a`; do
  if [[ ! -d $file ]] then
    case $file in
      init.vim)
        loc=~/.config/nvim/init.vim
        location_of_file=`pwd`/files/$file
        ;;
      .tmux.conf)
        loc=~/.tmux.conf
        location_of_file=`pwd`/files/$file
        ;;
      .zshrc)
        loc=~/.zshrc
        location_of_file=`pwd`/files/$file
        ;;
      alacritty.yml)
        loc=~/.config/alacritty/alacritty.yml
        location_of_file=`pwd`/files/$file
        ;;
      TalentBridge_vahid1_TalentBridge.ovpn)
        loc=~/Documents/TalentBridge_vahid1_TalentBridge.ovpn
        location_of_file=`pwd`/files/$file
        ;;
      config.fish)
        loc=~/.tmux.conf
        location_of_file=`pwd`/files/$file
        ;;
    esac
    backup_loc=$loc.backup
    if [[ -e $loc ]] then
      `cp -f $loc $backup_loc`
    fi
    `cp -f $location_of_file $loc`
  fi
done
