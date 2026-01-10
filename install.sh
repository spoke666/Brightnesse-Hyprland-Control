#!/bin/sh
# Script de instalação para Brightness Hyprland
# Funciona com duas confirmações:
# 1) Criar backup de arquivos existentes
# 2) Confirmar instalação global (prosseguir ou cancelar toda a instalação)
# Se o usuário cancelar, remove todos os arquivos antigos já existentes

# Caminhos locais do projeto
WRAPPER_SRC="$(pwd)/usr/bin/brightness"
SCRIPT_SRC="$(pwd)/usr/local/bin/min_Brightness.sh"

# Caminhos de destino no sistema
WRAPPER_DEST="/usr/bin/brightness"
SCRIPT_DEST="/usr/local/bin/min_Brightness.sh"

# Lista de arquivos para instalação
FILES="$WRAPPER_DEST $SCRIPT_DEST"
SRC_FILES="$WRAPPER_SRC $SCRIPT_SRC"
DESC_FILES="Wrapper brightness Script real min_Brightness.sh"

# 1ª confirmação: criar backups
i=1
for DEST in $FILES; do
    SRC=$(echo $SRC_FILES | cut -d' ' -f $i)
    DESC=$(echo $DESC_FILES | cut -d' ' -f $i)
    i=$((i+1))

    if [ -f "$DEST" ]; then
        echo "$DESC já existe em $DEST."
        echo "Deseja criar backup antes de sobrescrever? (y/N)"
        read -r backup_ans
        if [ "$backup_ans" = "y" ] || [ "$backup_ans" = "Y" ]; then
            echo "Criando backup de $DEST -> ${DEST}.bak"
            sudo cp "$DEST" "${DEST}.bak"
            echo "Backup concluído..."
        fi
    fi
done

# 2ª confirmação global: prosseguir ou cancelar toda a instalação
echo "Deseja prosseguir com a instalação de todos os arquivos? (y/N)"
read -r install_ans
if [ "$install_ans" != "y" ] && [ "$install_ans" != "Y" ]; then
    echo "Instalação cancelada! Removendo arquivos antigos já existentes..."
    for DEST in $FILES; do
        [ -f "$DEST" ] && sudo rm -f "$DEST"
        echo "Remoção concluída!!!"
    done
    exit 0
fi

# Instalação real
i=1
for DEST in $FILES; do
    SRC=$(echo $SRC_FILES | cut -d' ' -f $i)
    DESC=$(echo $DESC_FILES | cut -d' ' -f $i)
    i=$((i+1))

    echo "Instalando $DESC..."
    sudo cp "$SRC" "$DEST"
    sudo chmod +x "$DEST"
    echo "$DESC instalado com sucesso!"
done

echo "Instalação concluída!"
echo "Você pode usar 'brightness +10' ou 'brightness -10' no terminal e no Hyprland."
echo "adcione nas binds os comandos anteriores e seja feliz! ;)"
