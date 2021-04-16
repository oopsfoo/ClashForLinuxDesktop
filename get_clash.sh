#!/bin/bash
tmp_dir=$(mktemp -d -t clash-dl-XXXX)
pushd $tmp_dir
curl -s https://api.github.com/repos/Dreamacro/clash/releases \
	| grep "browser_download_url.*premium.*linux-amd64" \
	| cut -d ":" -f 2,3 | tr -d \" \
	| wget -O clash.gz -qi - 
		
gunzip clash.gz
chmod +x clash
clash_version=`./clash -v | cut -d " "  -f 2`
clash_arch=`./clash -v | cut -d " "  -f 3,4`
echo $clash_version
echo $clash_arch
rm -r $tmp_dir
#
#tarball="$(find . -name "*Linux-64bit.tar.gz")"
#tar -xzf $tarball
#
#chmod +x hugo
#
#mv hugo /usr/local/bin/
#
#popd
#
#location="$(which hugo)"
#echo "Hugo binary location: $location"
#
#version="$(hugo version)"
#echo "Hugo binary version: $version"
