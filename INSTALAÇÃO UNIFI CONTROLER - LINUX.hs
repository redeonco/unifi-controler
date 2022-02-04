#!/bin/bash
# Data de criação: 02/02/2022
# Data de atualização: 04/02/2022
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Testado e homologado para a versão do Ubuntu Server 20.04.x LTS x64
# Testado e homologado para a versão do Unifi Controller 6.5.x, MongoDB 3.6.x, OpenJDK e OpenJRE 8.x

#Porcesso de instalação da controler Unifi

#AS PORTAS 8080 E 8443 PRECISAM ESTAR LIBERADAS PARA REALIZAR A INSTALAÇÃO

#1- Faça login na máquina virtual via SSH
	#Comando
		ssh nomedeusuario@IPdaVM

#2- Habilite o usuário ROOT
	#Comando
		su root
	#digite a senha

#3- Crie uma pasta para armazenar os arquivos
	#Comando
		mkdir nomedapasta (para criar o diretório)
		cd nomedapasta (para acessar o diretório)

#4- Baixe os arquivos do repositório github oncoradium
	#Comando
		git clone https://github.com/redeonco/unifi-controler.git

#5- Instalando a controler
	#acesse a pasta unifi-controler
		cd unifi-controler
		
# Insira o comando para executar o script de acordo com a versão do linux

#	5.1- Ububtu Versão 18.04
        #Comando
			sudo bash unifi-1804.sh
	
#	5.2- Ububtu Versão 20.04
		#Comando
			sudo bash unifi-2004.sh
	
#	5.3- Docker
		#Comando
			sudo bash unifi-docker.sh
		
#6- Durante a instalação será exibido o status atual do procedimento 
	#O mesmo varia de tempo de acordo com a qualidade da conexão e hardware do sistema.

