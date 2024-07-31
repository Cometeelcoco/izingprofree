#!/bin/bash

get_frontend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio da interface web (Frontend):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_url
}

get_backend_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio da sua API (Backend):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_url
}

get_urls() {
  get_frontend_url
  get_backend_url
}

get_tenant_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio da interface web da página de criação de empresas:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " tenant_url
}

get_api_url() {
  print_banner
  printf "${WHITE} 💻 Digite o domínio da sua API gerada pelo superadmin:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " api_url
}

get_tenant_token() {
  print_banner
  printf "${WHITE} 💻 Digite o token de acesso gerado pelo superadmin:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " tenant_token
}

get_tenant_data() {
  get_tenant_url
  get_api_url
  get_tenant_token
}

software_update() {
  update_node_install
  update_bd_update
  update_stop_pm2
  update_mv_zpro
  update_delete_backend
  update_delete_frontend
  update_unzip_zpro
  update_delete_zip
  update_backend_node_dependencies
  update_backend_db_migrate
  update_backend_db_seed
  update_frontend_node_dependencies
  update_frontend_node_build
  update_start_pm2
  update_success
}

software_migration() {
  migration_node_install
  migration_bd_update
  migration_stop_pm2
  migration_mv_zpro
  migration_delete_backend
  migration_delete_frontend
  migration_unzip_zpro
  migration_delete_zip
  migration_backend_node_dependencies
  migration_backend_db_migrate
  migration_backend_db_seed
  migration_backend_start_pm2
  migration_frontend_node_dependencies
  migration_frontend_node_build
  migration_frontend_start_pm2
  migration_success
}

wweb_js() {
  wwebjs_node_install
  wwebjs_stop_pm2
  wwebjs_delete_backend
  wwebjs_update_api
  wwebjs_reboot
}

pending_fix() {
  pending_node_install
  pending_stop_pm2
  pending_mv_fix
  pending_delete_service
  pending_unzip_fix
  pending_delete_zip
  pending_restart_pm2
}

tenant() {
  get_tenant_data
  tenant_copy_zip
  tenant_unzip
  tenant_set_env
  tenant_install
  tenant_start_pm2
  tenant_nginx_setup  
  tenant_delete_zip
  tenant_certbot_setup
  tenant_success
}

inquiry_options() {
  
  print_banner
  printf "${WHITE} 💻 O que você precisa fazer?${GRAY_LIGHT}"
  printf "\n\n"
  printf "${GREEN} Antes de atualizar ou migrar, é obrigatório criar um snapshot (ponto de restauração) da sua VPS${NC}"
  printf "\n\n"
  printf "  [1] Instalar o PowerTech Pro+\n"
  printf "  [2] Atualizar o PowerTech Pro+ para última versão\n"
#  printf "  [3] Migrar do IzingPro para o ZPro\n"
#  printf "  [4] Migrar do WhaticketPro para o ZPro\n"
#  printf "  [5] Migrar do GroupsPro para o ZPro\n"
  printf "  [6] Atualizar API Não Oficial\n"
  # printf "  [7] FIX: Só recebo mensagens, mas não consigo enviar\n"
  printf "  [0] Instalar interface para criação de empresa\n"
  printf "\n"
  #printf "${GREEN} 👉 A migração funciona para VPS que contém apenas uma instalação realizada de forma automática${NC}"
  #printf "${GREEN} 👉 A migração para WhaticketPRO e GroupsPRO gera novos bancos de dados sem informações${NC}"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    1) get_urls ;;

    2) software_update 
    exit ;;

    3) software_migration 
    exit ;;

    4) get_urls ;;

    5) get_urls ;;

    6) wweb_js
    exit ;;

    # 7) pending_fix
    # exit ;;

    0) tenant
    exit ;;

    *) exit ;;
  esac
}

