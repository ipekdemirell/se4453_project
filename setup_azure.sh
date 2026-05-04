#!/bin/bash

# 1. Önce Azure hesabınıza giriş yapın
az login

# 2. Değişkenleri tanımlayalım
RG="SE-4453"
LOCATION="swedencentral"
KV_NAME="se4453kv-ipek"
ACR_NAME="se4453acripek"
IDENTITY_NAME="se4453-identity"
APP_NAME="se4453-app"

# 3. KeyVault Oluşturma (Çıktısı keyvault_output.json dosyasına kaydedilecek)
echo "KeyVault oluşturuluyor..."
az keyvault create --name $KV_NAME --resource-group $RG --location $LOCATION --public-network-access Enabled > keyvault_output.json

# 4. Container Registry (ACR) Oluşturma
echo "ACR oluşturuluyor..."
az acr create --resource-group $RG --name $ACR_NAME --sku Basic --admin-enabled true > acr_output.json

# 5. User Assigned Identity Oluşturma
echo "Kimlik (Identity) oluşturuluyor..."
az identity create --name $IDENTITY_NAME --resource-group $RG > identity_output.json

# ID'leri otomatik çekelim
IDENTITY_ID=$(az identity show --name $IDENTITY_NAME --resource-group $RG --query id -o tsv)
CLIENT_ID=$(az identity show --name $IDENTITY_NAME --resource-group $RG --query clientId -o tsv)
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $RG --query id -o tsv)

# 6. Kimliği App Service'e Atama
echo "Kimlik App Service'e atanıyor..."
az webapp identity assign --resource-group $RG --name $APP_NAME --identities $IDENTITY_ID > webapp_identity_output.json

# 7. ACR'den Pull Etme Yetkisi (Role) Verme
echo "Yetkilendirme yapılıyor..."
az role assignment create --assignee $CLIENT_ID --scope $ACR_ID --role AcrPull > role_assignment_output.json

echo "TÜM İŞLEMLER TAMAMLANDI! JSON ÇIKTILARI PROJE KLASÖRÜNÜZE KAYDEDİLDİ."
