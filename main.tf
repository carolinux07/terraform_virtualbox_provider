resource "virtualbox_vm" "ubuntu" {
    count = 1
    name = "${format("node_ubuntu-%02d", count.index+1)}"
    url = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20200229.0.0/providers/virtualbox.box"
    image = "./ubuntu.box"
    cpus = 1
    memory = "512 mib"

    network_adapter {
      type = "nat"
    }
}

resource "virtualbox_vm" "centos" {
    count = 1
    name = "${format("node_centos-%02d", count.index+1)}"
    url = "https://app.vagrantup.com/centos/boxes/7/versions/1905.1/providers/virtualbox.box"
    image = "./centos.box"
    cpus = 1
    memory = "512 mib"

    network_adapter {
      type = "nat"
    }
}


resource "virtualbox_vm" "debian" {
    count = 1
    name = "${format("node_debian-%02d", count.index+1)}"
    url = "https://app.vagrantup.com/debian/boxes/buster64/versions/10.3.0/providers/virtualbox.box"
    image = "./debian.box"
    cpus = 1
    memory = "512 mib"

    network_adapter {
      type = "nat"
    }
}
