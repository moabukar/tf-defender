resource "azurerm_security_center_subscription_pricing" "example" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}

resource "null_resource" "arc_installation" {
  provisioner "local-exec" {
    command = <<EOF
      az connectedk8s connect --name cluster_name --resource-group resource_group
    EOF
  }
}

resource "null_resource" "run_ps_script" {
  provisioner "local-exec" {
    command = "powershell.exe -File ./script.ps1"
  }
}
