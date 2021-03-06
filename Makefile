SHELL=/bin/bash

setting := /mnt/c/users/yuki/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
copy_setting:
	cp ${setting} ./

day := `date +"%Y_%m_%d"`
m := autopush ${day}
branch := origin master
autopush: ## This is auto push module, need commit message(default=autopush)
	make copy_setting
	git add .
	git commit -m "${m}"
	git push ${branch}

pull:
	git pull ${branch}

force_pull:
	git fetch ${branch}
	git reset --hard origin/master
	
u := 
p :=
add_netrc:
	touch ~/.netrc
	echo "machine github.com" > ~/.netrc
	echo "login ${u}" >> ~/.netrc
	echo "password ${p}" >> ~/.netrc

mail :=
add_github_config:
	git config --global user.name ${u}
	git config --global user.email ${mail}
