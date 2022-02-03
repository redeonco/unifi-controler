#!/bin/bash
# Data de criação: 02/02/2022
# Data de atualização: 03/02/2022
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Testado e homologado para a versão do Ubuntu Server 20.04.x LTS x64
# Testado e homologado para a versão do Unifi Controller 6.5.x, MongoDB 3.6.x, OpenJDK e OpenJRE 8.x

#Porcesso de instalação da controler Unifi

#1- Faça login na máquina virtual

#2- Habilite o usuário ROOT
	#Comando
	su root
	#digite a senha

#3- Insira o comando para executar o script de acordo com a versão do linux

#	3.1- Ububtu Versão 18.04
        #Comando
		sudo bash unifi-1804.sh
	
#	3.2- Ububtu Versão 20.04
		#Comando
		sudo bash unifi-2004.sh
	
#	3.3- Docker
		#Comando
		sudo bash unifi-docker.sh
		
#4- Durante a instalação será exibido o status atual do procedimento o mesmo varia de tempo de acordo com a qualidade da conexão e hardware do sistema.

