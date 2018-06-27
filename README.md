<h1 align="center">My Shell Configs</h1>
<p align="center">Easy shell configs for setup</p>

## Usage
### Install
#### Clone Repo
```sh
git clone https://github.com/jerrywdlee/my-shell-configs.git ~/.my-shell-configs
```

#### Configuration
##### Bash on Mac or Linux
```sh
echo -e "\nsource \$HOME/.my-shell-configs/bash/my_shell.bash\n" >> ~/.bash_profile && source ~/.bash_profile
```
On 1st run, it will download [dependency scripts](https://github.com/git/git/tree/master/contrib/completion) from github.

##### MinGW on Windows
```sh
echo -e "\nsource \$HOME/.my-shell-configs/MinGW/my_shell.bash\n" >> ~/.bash_profile && source ~/.bash_profile
```

### [LICENSE](https://github.com/jerrywdlee/my-shell-configs/blob/master/LICENSE)
GNU General Public License v3.0  
Copyright (C) 2018  Jerry Lee
