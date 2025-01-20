terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

# Windows Server 2019
resource "virtualbox_vm" "windows_server" {
  name   = "WindowsServer2019"
  cpus   = 3
  memory = 16384

  disk {
    size = 50 # Disk size in GB
  }

  attach_dvd {
    path = "C:/Users/John/Desktop/Project/ISO/17763.3650.221105-1748.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us (1).iso"
  }

  network_adapter {
    type   = "nat"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

resource "virtualbox_vm" "linux_server" {
  name   = "UbuntuServer"
  cpus   = 2
  memory = 4096

  disk {
    size = 20 # Disk size in GB
  }

  attach_dvd {
    path = "C:/Users/John/Desktop/Project/ISO/ubuntu-24.04.1-live-server-amd64 (1).iso"
  }

  network_adapter {
    type   = "nat"
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}
