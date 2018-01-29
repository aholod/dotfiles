install_all:
	ansible-playbook all.yml -i local -vv -e curdir=$(CURDIR)

install_vim:
	ansible-playbook vim.yml -i local -vv -e curdir=$(CURDIR)

prepare_rh:
	sudo yum install -y git ansible python34 python34-devel python-devel python-pip pytho34-pip

prepare_ub:
	sudo apt install git ansible python3 python3-dev


home:
	ansible-playbook ansible/home_init.yml -i ansible/local -vv
	ansible-playbook ansible/km_dotfiles/vim.yml -i ansible/local -vv -e curdir=~/vrac/ansible/km_dotfiles

master:
	sudo yum -y install ansible
	sudo yum -y install git

instance:
	ansible-playbook ansible/instance_init.yml -i ansible/$(inventory) -vv
	ansible-playbook ansible/km_dotfiles/nvim.yml -i ansible/$(inventory) -vv -e curdir=~/vrac/ansible/km_dotfiles

