Vagrant.configure("2") do |config|
  # Windows Server 2019 VM
  config.vm.define "windows_server" do |windows|
    windows.vm.box = "StefanScherer/windows_2019"
    windows.vm.box_version = "2021.05.15"
    windows.vm.provider "virtualbox" do |vb|
      vb.name = "WindowsServer2019"
      vb.memory = 16384
      vb.cpus = 3
    end
    windows.vm.provision "shell", inline: <<-SHELL
      # Ensure Windows Server is up to date
      Write-Output "Starting Windows Update..."
      Install-Module PSWindowsUpdate -Force -Scope CurrentUser
      Set-ExecutionPolicy Bypass -Scope Process -Force
      Import-Module PSWindowsUpdate
      Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot
      Write-Output "Windows Update Completed."
    SHELL
  end

  # Linux Desktop VM (GUI version)
  config.vm.define "linux_server" do |linux|
    linux.vm.box = "bento/ubuntu-22.04" # Updated to Ubuntu Desktop
    linux.vm.provider "virtualbox" do |vb|
      vb.name = "UbuntuDesktop"
      vb.memory = 8192
      vb.cpus = 2
      vb.gui = true
    end
    linux.vm.provision "shell", inline: <<-SHELL
      # Update and upgrade Linux packages
      echo "Updating and upgrading Linux packages..."
      sudo apt update && sudo apt upgrade -y

      # Install GUI environment
      echo "Installing Ubuntu Desktop..."
      sudo apt install -y ubuntu-desktop

      # Clean up unnecessary packages
      echo "Cleaning up..."
      sudo apt autoremove -y
    SHELL
  end
end
