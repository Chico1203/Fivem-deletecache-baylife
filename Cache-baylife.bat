@echo off
title Nettoyage FiveM - Script par Chico
color 0A

:: Affichage des informations sur l'auteur
echo **************************************
echo *            Nettoyage FiveM         *
echo *         Script de Maintenance      *
echo *         Realise par : Chico        *
echo **************************************
echo.

:: Détection automatique du dossier FiveM
set "targetPath=%LocalAppData%\FiveM\FiveM.app"
set "dataPath=%targetPath%\data"

if not exist "%targetPath%" (
    echo [ERROR] Impossible de trouver le dossier FiveM dans %LocalAppData%.
    echo Verifiez que FiveM est installe correctement.
    pause > nul
    exit /b
)

:: Suppression des dossiers principaux
if exist "%targetPath%\logs" (
    echo [INFO] Suppression du dossier logs dans %targetPath%...
    rmdir /s /q "%targetPath%\logs"
    echo [OK] Dossier logs supprime.
) else (
    echo [INFO] Le dossier logs dans %targetPath% n'existe pas.
)

if exist "%targetPath%\crashes" (
    echo [INFO] Suppression du dossier crashes dans %targetPath%...
    rmdir /s /q "%targetPath%\crashes"
    echo [OK] Dossier crashes supprime.
) else (
    echo [INFO] Le dossier crashes dans %targetPath% n'existe pas.
)

echo.

:: Suppression des dossiers dans %dataPath% sans confirmation
echo [INFO] Suppression des dossiers suivants dans %dataPath%...
if exist "%dataPath%\server-cache-priv" (
    echo [INFO] Suppression du dossier server-cache-priv...
    rmdir /s /q "%dataPath%\server-cache-priv"
    echo [OK] Dossier server-cache-priv supprime.
) else (
    echo [INFO] Le dossier server-cache-priv n'existe pas.
)

if exist "%dataPath%\server-cache" (
    echo [INFO] Suppression du dossier server-cache...
    rmdir /s /q "%dataPath%\server-cache"
    echo [OK] Dossier server-cache supprime.
) else (
    echo [INFO] Le dossier server-cache n'existe pas.
)

if exist "%dataPath%\cache" (
    echo [INFO] Suppression du dossier cache...
    rmdir /s /q "%dataPath%\cache"
    echo [OK] Dossier cache supprime.
) else (
    echo [INFO] Le dossier cache n'existe pas.
)

echo.
echo [SUCCESS] Tous les dossiers selectionnes ont ete supprimes.

echo.
echo Avant de continuer, veuillez prendre en compte que la suppression
echo du dossier "nui-storage" supprimera les photos sur votre telephone.
echo Voulez-vous continuer a supprimer le dossier "nui-storage" ? (oui/non)
echo.
set /p confirmationNuiStorage=Votre choix : 

if /i "%confirmationNuiStorage%"=="oui" (
    echo [INFO] Suppression du dossier nui-storage...
    if exist "%dataPath%\nui-storage" (
        rmdir /s /q "%dataPath%\nui-storage"
        echo [OK] Dossier nui-storage supprime.
    ) else (
        echo [INFO] Le dossier nui-storage n'existe pas.
    )
) else (
    echo [INFO] Suppression du dossier nui-storage annulee par l'utilisateur.
)

echo.
echo [FIN] Merci d'avoir utilise ce script. 
echo Appuyez sur une touche pour quitter.
pause > nul
