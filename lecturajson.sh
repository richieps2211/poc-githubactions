# Leer el archivo JSON y asignar los valores a variables
workingdirectory=$(jq -r '.working-directory' delivery.json)
secret=$(jq -r '.secret' delivery.json)
        
# Mostrar los valores para verificar
echo "working-directory: $workingdirectory"
echo "secret: $secret"
