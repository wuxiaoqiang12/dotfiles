init:
	ln -fs `pwd`/bashrc		~/.bashrc
	ln -fs `pwd`/zshrc		~/.zshrc
	ln -fs `pwd`/gdbinit	~/.gdbinit
	ln -fs `pwd`/gdbinit-gef.py	~/.gdbinit-gef.py
	ln -fs `pwd`/vimrc		~/.vimrc

sync:
	git pull
	git push

config-git:
	git config --global user.name "wuxiaoqiang12"
	git config --global user.email xiaoqiangwu.hit@gmail.com
