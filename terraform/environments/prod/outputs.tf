output "acr_login_server" {
  value = module.acr.acr_login_server
}
 
output "acr_admin_username" {
  value = module.acr.acr_admin_username
}
 
output "acr_admin_password" {
  value = module.acr.acr_admin_password
  sensitive = true
}