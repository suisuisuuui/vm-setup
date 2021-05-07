# vm-setup

VM のセットアップを行うためのリポジトリとなります。

## 対象 OS

- CentOS 8 Stream

## 注意事項

- 本セットアップの手順は、個人 PC の検証用仮想環境等で使うことを想定しています。
- 外部からアクセスできるサーバ等では使用しないでください
- 本スクリプトを実施したことで不具合が起きても責任は取れません

## 前提事項

- VirtualBox にて、CentOS 8 Stream がインストールされていること
- ネットワークアダプタの設定で、以下が設定されていること
	- アダプター1 : NAT
	- アダプター2 : ホストオンリーアダプタ
- ネットワークにつながっていること

繋がっていない場合は、下記コマンドで接続をアクティベートするとよい

	# ifup enp0s3

## このスクリプトで行うこと

- firewall の停止及び無効化
- VirtualBox における、以下のネットワークアダプタの設定
	- アダプター1 : NAT
		- 自動起動の有効化
	- アダプター2 : ホストオンリーアダプタ
		- 自動起動の有効化
		- IP アドレスの設定
- SELinux の無効化

## 使い方

Git がインストールされていない場合は、インストールします

	# dnf -y install git

本リポジトリを clone します

	# git clone https://github.com/suisuisuuui/vm-setup.git

対象ディレクトリに移動します

	# cd vm-setup/centos8_stream

設定用 IP アドレスを変更したい場合は、変更します（変更しない場合は、下記コマンドは実施不要です）  
XX.XX.XX.XX の部分は実際に設定したい IP アドレスに書き換えてください

	# sed -i -e "s/IPADDR=192.168.56.11/IPADDR=XX.XX.XX.XX/g" setup.sh

スクリプトに実行権限を与えます

	# chmod 755 setup.sh

スクリプトを実行します

	# ./setup.sh


