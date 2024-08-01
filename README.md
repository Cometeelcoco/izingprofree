# FREE INSTALLER FOR SAAS IZING VERSION
Para evitar erros recomendados atualizar sistema e apos atualizar reniciar para evitar erros

apt -y update && apt -y upgrade
reboot
Depois reniciar seguir com a instalacao

apt install git
cd /root
git clone https://github.com/Cometeelcoco/izingprofree.git izinginstalador
sudo chmod +x ./izinginstalador/zpro
cd ./izinginstalador
sudo ./zpro
