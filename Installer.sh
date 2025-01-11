#!/data/data/com.termux/files/usr/bin/bash
clear
echo "
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |B|e|e|f| |i|n| |T|e|r|m|u|x|
    
    follow us https://github.com/edunoluwadarasimidavid/Beef-in-termux-.git
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"
center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ={1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}
echo " Loading..."
source <(echo "c3Bpbm5lcj0oICd8JyAnLycgJy0nICdcJyApOwoKY291bnQoKXsKICBzcGluICYKICBwaWQ9JCEKICBmb3IgaSBpbiBgc2VxIDEgMTBgCiAgZG8KICAgIHNsZWVwIDE7CiAgZG9uZQoKICBraWxsICRwaWQgIAp9CgpzcGluKCl7CiAgd2hpbGUgWyAxIF0KICBkbyAKICAgIGZvciBpIGluICR7c3Bpbm5lcltAXX07IAogICAgZG8gCiAgICAgIGVjaG8gLW5lICJcciRpIjsKICAgICAgc2xlZXAgMC4yOwogICAgZG9uZTsKICBkb25lCn0KCmNvdW50" | base64 -d)

echo
center "*** Dependencies installation***"

pkg upgrade -y -o Dpkg::Options::="--force-confnew"

pkg install -y curl git libyaml libxslt bison espeak wget ruby python nodejs nano binutils -o Dpkg::Options::="--force-confnew"

echo
echo "*** Downloading***"
cd /data/data/com.termux/files/home
git clone --depth 1 https://github.com/edunoluwadarasimidavid/Beef-in-termux-.git
echo
echo "*** Installation***"
cd /data/data/com.termux/files/home/Beef-in-termux-
gem install bundler
gem install nokogiri -- --use-system-libraries
sed -i 's/nio4r (2.5.8)/nio4r (2.5.9)/' Gemfile.lock
sed -i '268,274d' install
sed -i '26,181d' install
sed -i 's/sudo//' install
bash install

#ln -s /data/data/com.termux/files/home/Beef-in-termux-/beef $PREFIX/bin/

echo
center "*"
echo -e "\033[32m Now you can launch beef just by executing 'beef' and make sure to change your login id and password in '/beef/config.yaml' file\033[0m"
center "*"
cd /data/data/com.termux/files/
new="beef"
touch $new
echo "#!/bin/bash" >> $new
echo "cd /data/data/com.termux/files/home/Beef-in-termux-/" >> $new
echo "exec ruby beef" >> $new
chmod a+x $new
mv /data/data/com.termux/files/beef $PREFIX/bin/

am start -a android.intent.action.VIEW -d "https://github.com/edunoluwadarasimidavid"