rm -R .config/
cp -R ~/.config .

rm -R ./bash
mkdir ./bash
cp ~/.bash_profile ./bash
cp ~/.bash_logout ./bash
cp ~/.bashrc ./bash
