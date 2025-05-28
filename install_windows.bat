chcp 65001 >nul
@echo off
cls

echo =============================
echo  🎶 Sélection du mode d'installation
echo =============================
echo.
echo 1 - Mode rapide (npm install + start)
echo 2 - Mode complet (init, install, dev tools)
echo 3 - Mode Install
echo.
set /p mode="Entrez le mode (1, 2 ou 3) : "

cd install_windows || (
    echo ❌ Dossier 'install_windows' introuvable.
    pause
    exit /b
)



if "%mode%"=="1" (
    echo 🚀 Lancement du projet en mode rapide...
    npm run start
) else if "%mode%"=="2" (
    rem Initialiser le projet npm si besoin
    if not exist package.json (
        echo 📦 Initialisation du projet npm...
        npm init -y
    )

    rem Installation des dépendances principales
    echo 📥 Installation des dépendances...
    npm i express socket.io yaml fs node-notifier open child_process uuid

    rem Installation des dépendances de développement
    echo 🛠️ Installation des dépendances dev...
    npm i --save-dev typescript nodemon concurrently @types/node @types/yaml @types/node-notifier

    echo ✅ Mode complet terminé. Application prête.
    rem npm run dev
) else if "%mode%"=="3" (
    rem Exécuter npm install dans tous les cas
    echo ⏳ Installation des dépendances de base...
    npm install
) else (
    echo ❌ Mode inconnu : "%mode%"
)

pause
