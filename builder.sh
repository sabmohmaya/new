apt-get update -y
apt-get install curl -y
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
apt-get install python
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-14.1 -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
