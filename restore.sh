for file in `ls files -a`; do
  if [[ ! -d $file ]] then
    case $file in
      init.vim)
        loc=~/.config/nvim/init.vim
        ;;
      .tmux.conf)
        loc=~/.tmux.conf
        ;;
      .zshrc)
        loc=~/.zshrc
        ;;
      alacritty.yml)
        loc=~/.config/alacritty/alacritty.yml
        ;;
      TalentBridge_vahid1_TalentBridge.ovpn)
        loc=~/Documents/TalentBridge_vahid1_TalentBridge.ovpn
        ;;
    esac
    backup_loc=$loc.backup
    `cp $backup_loc $loc`
    `rm $backup_loc`
  fi
done
