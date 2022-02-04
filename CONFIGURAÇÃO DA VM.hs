#Criação da VM
# Data de criação: 02/02/2022
# Data de atualização: 04/02/2022
# Testado e homologado para a versão do Ubuntu Server 18.04.x LTS x64
# Testado e homologado para a versão do Ubuntu Server 20.04.x LTS x64

#Download da imagem iso Ubuntu
	Versão 20.04 - https://mirror.uepg.br/ubuntu-releases/20.04.3/ubuntu-20.04.3-live-server-amd64.iso
	Versão 18.04 - https://ubuntu.itsbrasil.net/ubuntu-releases/18.04.6/ubuntu-18.04.6-live-server-amd64.iso

#Criando Comutador Virtual 
	Abra o gerenciador de HyperV
		Na lateral direita clique em "Gerenciador de Comutador Virtual" 
			(CASO NÃO TENHA UM COMUTADOR PARA CONEXÃO EXTERNA)
				Clique em "Externo" depois em "Criar Comutador Virtual"
					Insira um nome e clique em "OK"
		


#Criando uma máquina virtual
	Clique com botão direito no servidor
		"Novo"
			"Máquina Virtual"

#No assistente virtual
	Insira o nome da máquina virtual de acordo com os padrões da sua instituição
		Marque a caixa de texto a baixo caso queira armazenar a VM em outra pasta
			Clique em "Avançar"

#Especificar geração
	Marque a primeira opção: Geração 1
		Clique em "Avançar"

#Atribuir Memória
	Utilize no mínimo 2048 MB (2 gigas) de memória ram. Recomendável 4196 MB (4 gigas )
		Caso queira usar memória dinâmica marque a caixa de texto a baixo
			Clique em "Avançar"

#Configurar rede
	Utilize o comutador virtual criado anteriormente para acesso a rede de internet
		Clique em "Avançar"

#Conectar Disco Virtual 
	Não faça alterações em nome e local. Caso essa VM seja apenas para instalar a controler 100 GB é suficiente
		Clique em "Avançar"

#Opções de Instalação
	Marque a segunda caixa de texto
		
		Caso for usar uma imagem montada em um dvd marque a primeira opção na área "MÍDIA"
			Escolha a unidade onde o DVD está inserido
			
		Caso for usar um arquivo .iso marque a segunda opção na área "MÍDIA"
			Clique em procurar e selecione o arquivo .iso
				Clique em "Avançar"

#Concluindo assistente de máquina virtual
	Nessa tela você confere todas as informações de configuração da sua VM
		Clique em "Concluir"

#Finalizando a Configuração
	Clique com o botão direito do mouse na VM e depois em "Configuração"
		Vá em "Processador" e se possível coloque 2 núcleos ou mais para melhorar a performance da instalação
			Clique em "OK"
		
	
#Iniciando a Máquina Virtual
	Clique com o botão direito do mouse na VM e depois em "Iniciar"
		Clique duas vezes na VM para abrir a tela de conexão

#Realizando as configurações do Linux
	Escolha o idioma de sua preferência e clique em "ENTER"
	Caso apareça uma tela de atualização da versão do sistema selecione na segunda opção "Continue without updating" e clique em "ENTER"
	Escolha a configuração do teclado em Portuguese (Brazil), marque a opção "DONE" e aperte "ENTER"
	Nas opções de rede deixe dhcp, faremos alterações posteriormente. Marque a opção "DONE" e aperte "ENTER"
	Nas configurações de proxy não faça nada. Marque a opção "DONE" e aperte "ENTER"
	Nas configurações de arquivo mirror não faça nada. Marque a opção "DONE" e aperte "ENTER"
	Na configuração de armazenamento marque as opções "Use an entire disk" e "Set up this disk as an LVM group". Marque a opção "DONE" e aperte "ENTER"
	Na segunda tela de configuração de armazenamento não faça nada. Marque a opção "DONE" e aperte "ENTER" depois marque a opção em "Continue" e aperte "ENTER"
	Na configuração de perfil insira o nome do servidor, nome de usuário senha e confirmação de senha. Marque a opção "DONE" e aperte "ENTER"
	Na configuração de SSH marque a opção de instalação. Marque a opção "DONE" e aperte "ENTER"
	Nas opções de recursos do servidor nao marque nada. Marque a opção "DONE" e aperte "ENTER"
	
	Agora o sistema dará inicio a instalação

	Marque a opção "REBOOT NOW" e aperte "ENTER"

#Primeiro Login
	Após o reboot da VM insira seus dados de acesso (login e senha) que foram cadastrados
	
#Cadastro de senha root
	Após logar na VM insira o comando "sudo passwd root" sem aspas e aperte "ENTER"
		Insira a senha do usuário que já está logado e aperte "ENTER"
			Insira a senha para o usuário root e aperte "ENTER"
				Confirme a senha para o usuário root e aperte "ENTER"
					Caso tudo tenha dado certo vai aparecer a mensagem "passwd: password updated sucessfuly"

#Fazendo login com usuário root
						Após logar com usuário comum insira o comando "su root" sem aspas e aperte "ENTER"
							Insira a senha do usuário root cadastrada anteriormente e aperte "ENTER"

#Acessando a VM via ssh
	Insira o comando "lshw -C network" sem aspas para descobrir o ip da VM já que a mesma estava para pegar IP via dhcp 
		Esse comando vai exibir suas interfaces de rede habilitadas e o IP da VM 
			Caso queira definir um IP estático insira o comando "cd /etc/netplan" sem aspas e aperte "ENTER"
				Use o comando "ls" sem aspas e aperte "ENTER" para verificar o nome do arquivo na pasta
					Antes de editar o arquivo faça uma cópia de segurança com o comando "cp nomedoarquivo /root" sem aspas e aperte "ENTER" uma cópia de segurança foi enviada para o diretório root
						Para editar o arquivo digite o comando "vi nomedoarquivo" sem aspas e aperte "ENTER"
							Ao abrir o arquivo aperte a tecla "i" sem aspas para poder editar e insira as informações a baixo:
								network:
								version: 2
								renderer: networkd
								ethernets:
								eth0:
								dhcp4: true
								addresses: [10.80.0.99/23] - (IP a ser usado e a classe da subrede)
								gateway4: 10.80.0.1 - (Gateway a ser usado)
								nameservers:
								addresses: [8.8.8.8, 8.8.4.4] - (DNS a ser usado)
								
							Após realizar a alteração aperte "esc" depois ":wq" sem aspas e aperte "ENTER" para salvar
								Insira o comando "reboot" para reiniciar a VM
									Após reiniciar faça login na vm insira o comando "lshw -C network" sem aspas para verificar se o novo ip já está ativo
										Após validar o IP já será possível acessar via SSH
											Abra o powershell e insira o comando "ssh nomedeusuario@IPdaVM" e aperte "ENTER" caso peça uma confirmação da conexão digite "yes" e aperte "ENTER" digite a senha e aperte "ENTER"
												Após isso já terá acesso a VM, faça login com usuário root para continuar
								
#Instalando dependências
	Antes de instalar a controler precisamos atualizar a VM e instalar algumas dependências
		Após logar com usuário root insira os comandos:
		"apt-get install wget git -y" sem aspas e aperte "ENTER"
		"apt-get install net-tools -y" sem aspas e aperte "ENTER"
		"apt-get update -y" sem aspas e aperte "ENTER"
	
	Agora a VM está pronta para iniciar a instalação da controler

#Criando Ponto de Verificação
	Vá até o Gerenciador de HyperV
		Clique com o botão direito na VM e depois em "Ponto de Verificação"
			Após isso na parte de baixo do gerenciador vai aparecer o ponto de verificação que foi criado
				Ele pode ser renomeado para facilitar o motivo da criação, nesse caso é para caso aconteça algum erro no restante do processo. Assim vamos evitar de perder tudo que já fizemos.
				
	
	
	
	
		
			