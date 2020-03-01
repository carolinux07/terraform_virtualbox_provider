# terraform_virtualbox_provider
Código que estou utilizando para provisionar máquinas CentOS e Debian no VirtualBox, através do Terraform.

É importante ressaltar que o VirtualBox não é um dos vários providers mantidos pela HashiCorp, por isso, utilizei um trabalho experimental desenvolvidas pela comunidade.

### Problemas encontrados:

Ao realizar o comendo terraform destroy, as máquinas virtuais são removidas mas as mídias virtuais não são, isso causará problemas 

#### Materiais utilizados como guia de referência para configuração da minha estação de trabalho:
 
- https://gitter.im/terra-farm/terraform-provider-virtualbox?at=5d31a5c65ea6e644ece06abb
- https://github.com/terra-farm/terraform-provider-virtualbox
- https://terra-farm.github.io/main/installation.html
- https://blog.opennix.ru/posts/use-terraform-with-virtualbox/
- https://github.com/pyToshka/terraform-provider-virtualbox

IMPORTANTE: Mérito total a todos que desenvolveram esses materais, apenas fui adequando as minhas necessidades e corrigindo o que não funcionava no meu ambiente, tendo em vista de que é um projeto que está em constante evolução e possui alguns bugs.

#### Boxes do Vagrant:
- Ubuntu: https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20200229.0.0
- Debian: https://app.vagrantup.com/debian/boxes/buster64/versions/10.3.0
- CentOS: https://app.vagrantup.com/centos/boxes/7/versions/1905.1


### Configuração do ambiente:
Obs.: Minha estação de trabalho é openSUSE.

```
zypper install go
mkdir ~/.terraform.d/plugins
cp go/bin/terraform-provider-virtualbox  ~/.terraform.d/plugins
```
### Iniciando um projeto:

```
mkdir virtualbox-example 
cd virtualbox-example
touch main.tf && vi main.tf
```

### Código para geração de 3 Vms (Ubuntu, CentOS e Debian):

<AQUI>


### Problemas encontrados:

##### Erro 1:

Tentei duas versões diferentes de Ubuntu e em todas o VM não sobe. Mesmo trocando a ordem dos discos no VirtualBox (esse foi o único dos 3 que gerou dois discos), não funciona. Se alguem descobri me fala. hehehe

##### Erro 2:

Ao realizar o comendo terraform destroy, as máquinas virtuais são removidas mas as mídias virtuais não são, isso causará problemas em novas execuções do terraform apply. 

```
Error: exit status 1

  on main.tf line 1, in resource "virtualbox_vm" "ubuntu":
   1: resource "virtualbox_vm" "ubuntu" {
```

Para que esse tipo de erro não ocorra precisei apagar os discos virtuais em: File > Virtual Media Manager...

##### Erro 3:

A cada novo erro e correção do código, o terraform apresentava o seguinte erro:

```
Error: machine already exists

  on main.tf line 1, in resource "virtualbox_vm" "ubuntu":
   1: resource "virtualbox_vm" "ubuntu" {
```

Isso acontace porque uma das primeiras validações que ocorrem é a execução do VBoxManage list vms e VBoxManage showvminfo, como a última execução com erro chegou a gerar, pelo menos, a raferência no VirtualBox será necessaŕio apagar manualmente esse "lixinho".

##### Erro 4:

Bem, esse não é exatamente um erro, mas é importante ter atenção as Boxes do Vangrant, nem todas possuem o VirtualBox como provider. E me tomou um tempo entender a lógica deles.

Para utilizar uma box, escolha o SO, o CentOS por exemplo: 
- https://app.vagrantup.com/centos/

Escolha uma versão com tenha o VirtualBox como provider, essa por exemplo tem 4 (virtualbox, vmware_desktop, libvirt, hyperv):
- https://app.vagrantup.com/centos/boxes/7/versions/1905.1

Para definir o provider utilize o final "providers/virtualbox.box", assim:
- https://app.vagrantup.com/centos/boxes/7/versions/1905.1/providers/virtualbox.box
