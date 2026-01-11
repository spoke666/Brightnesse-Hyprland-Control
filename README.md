# Brightness Hyprland

Um utilitário simples para controle de brilho no **Hyprland**, com:

- Limite mínimo de brilho (5%)
- Passo configurável (`+N` / `-N`)
- Funciona no terminal, **bindel** do Hyprland e **Waybar**
- Instalação interativa com backup de arquivos existentes

## ⚠️ Antes da instalação

Este script **depende do `brightnessctl`**, que é usado para ler e alterar o brilho do monitor.

No **Arch Linux / derivados**:

    sudo pacman -S brightnessctl

No Debian / Ubuntu:

    sudo apt install brightnessctl

"O script brightness-hyprland funciona como um wrapper seguro para aumentar/diminuir brilho, garantindo que não caia abaixo de 5% do máximo e permitindo integração com Hyprland (bindel) e Waybar."

🌳 Estrutura de instalação

Após a instalação, os arquivos são colocados no sistema assim:

/usr/bin/brightness               # Wrapper executável
/usr/local/bin/min_Brightness.sh  # Script real com lógica do clamp mínimo

Na árvore do projeto local (antes da instalação):

    brightness-hyprland/
    ├── usr/
    │   └── bin/
    │       └── brightness          # Wrapper
    └── usr/
        └── local/
            └── bin/
                └── min_Brightness.sh  # Script real
                
    ├── install.sh                   # Script de instalação
    └── README.md

⚙️ Tutorial de instalação

Torne o script de instalação executável:

    chmod +x install.sh

Execute o instalador:

    sudo ./install.sh

O instalador vai:

Perguntar se deseja criar backup de arquivos já existentes

Perguntar se deseja prosseguir com a instalação global

Se você cancelar, qualquer arquivo antigo será removido

Instala os arquivos no lugar correto e define permissões executáveis

**Obs.: É necessário usar sudo, pois os arquivos são instalados em /usr/bin e /usr/local/bin.

# 💻 Comandos

Após a instalação, você pode controlar o brilho via terminal:

brightness +10    # aumenta o brilho em 10%
brightness -5     # diminui o brilho em 5%

O script já garante que o brilho não caia abaixo de 5% do máximo.
🔧 Bindel no Hyprland

Adicione os seguintes binds no seu hyprland.conf:

Aumentar/diminuir brilho

    bindel = ,XF86MonBrightnessUp, exec, brightness +10
    bindel = ,XF86MonBrightnessDown, exec, brightness -10

O passo (+10 / -10) pode ser ajustado conforme sua preferência.

🖥️ Uso com Waybar

Se você quiser integrar com Waybar (scroll):

    "brightness": {
        "format": "{volume}%",
        "on-click": "brightness +10",
        "on-scroll-up": "brightness +5",
        "on-scroll-down": "brightness -5",
        "scroll-step": 5
    }

Ajuste +5 / -5 conforme desejar o passo do scroll.

🧹 Removendo o Brightness Hyprland

Se quiser desinstalar o app e remover backups, use os seguintes comandos:


    sudo rm -f /usr/bin/brightness
    sudo rm -f /usr/local/bin/min_Brightness.sh


    sudo rm -f /usr/bin/brightness.bak
    sudo rm -f /usr/local/bin/min_Brightness.sh.bak

Isso remove tanto os arquivos instalados quanto quaisquer backups criados durante a instalação.

📜 Licença

MIT License © 2026 Spoke666

Permissão é concedida, gratuitamente, para qualquer pessoa obter uma cópia deste software e utilizá-lo, modificar ou distribuí-lo.

###Pronto!

Agora você pode controlar o brilho de forma segura, sem estourar o monitor ou danificar o hardware.
Use no terminal, bindel ou Waybar e seja feliz! ;)
