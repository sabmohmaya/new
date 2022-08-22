df -h
export DEBIAN_FRONTEND=noninteractive
TZ=Etc/UTC
apt-get update -y
apt-get install libssl-dev wget virtualenv rsync python python3.8 imagemagick bc git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
mv /usr/bin/python $HOME
ln -s /usr/bin/python3.8 /usr/bin/python
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
python --version
git clone https://github.com/fabianonline/telegram.sh --depth=1 $HOME/telegram.sh
wget https://raw.githubusercontent.com/sabmohmaya/mido/staging/slmk-4.4/lineage-15.1/.telegram.sh
mv .telegram.sh $HOME/.telegram.sh
TG=$HOME/telegram.sh/telegram
repo init --no-repo-verify -u git://git.osdn.net/gitroot/android-x86/manifest.git -b pie-x86 --depth=1
virtualenv -p python2 ~/python
. ~/python/bin/activate
python --version
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j12
#rm -rf kernel
#git clone https://github.com/RahifM/android-x86-kernel -b staging/android-x86-9.0-r2/slmk --depth=1 kernel 
#repo sync kernel/configs
. build/env*
lunch android_x86_64-userdebug
make -j$(nproc --all) kernel
cd out/target/product/x86_64
du -hs kernel
ls system/lib/modules
du -hs system/lib/modules
mkdir newkermel
cp kernel newkermel
cp -r system/lib/modules newkermel
zip -r newkermel.zip newkermel
du -hs newkermel
curl --upload-file newkermel.zip https://transfer.sh/newkermel.zip > tup.txt
$TG -f tup.txt
