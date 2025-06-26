# 📦 Génération et publication d’un fichier `.aab` signé pour une application Flutter

Ce guide explique étape par étape comment générer un Android App Bundle (`.aab`) signé et publier votre application sur le Google Play Store.

---

## ✅ 1. Générer la clé de signature

Dans ton terminal, tape cette commande (remplace les valeurs par les tiennes) :

```bash
keytool -genkey -v -keystore ~/chemin/vers/ma-cle.jks -keyalg RSA -keysize 2048 -validity 10000 -alias mon_alias
🔒 Tu vas devoir renseigner :

Mot de passe du keystore

Nom complet, entreprise, ville, pays

📁 Le fichier ma-cle.jks est très important : conserve-le précieusement (ainsi que son mot de passe).

✅ 2. Enregistrer la clé dans Flutter
Crée (ou édite) le fichier suivant :

📄 android/key.properties :

properties
Copier
Modifier
storePassword=mot_de_passe_du_keystore
keyPassword=mot_de_passe_de_la_cle
keyAlias=mon_alias
storeFile=../chemin/vers/ma-cle.jks
✅ 3. Modifier android/app/build.gradle
➤ a. Ajouter en haut du fichier :
gradle
Copier
Modifier
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file("key.properties")
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
➤ b. Ajouter dans signingConfigs :
gradle
Copier
Modifier
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile file(keystoreProperties['storeFile'])
        storePassword keystoreProperties['storePassword']
    }
}
➤ c. Ajouter dans buildTypes :
gradle
Copier
Modifier
buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled false
        shrinkResources false
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}
✅ 4. Générer le .aab
Dans le terminal, à la racine du projet Flutter :

bash
Copier
Modifier
flutter build appbundle
📄 Le fichier généré se trouve ici :
build/app/outputs/bundle/release/app-release.aab

✅ 5. Préparer le compte développeur Google Play
Connecte-toi sur https://play.google.com/console

Paie les 25 $ (frais unique)

Crée un nouveau projet d’application

Fournis toutes les informations obligatoires :

Nom de l’application

Langue principale

Politique de confidentialité

Catégorie

✅ 6. Télécharger l’AAB sur la Play Console
Va dans le menu "Production" > "Créer une nouvelle version"

Téléverse ton fichier .aab

Fournis :

Description

Captures d’écran

Icône

Nom de l’application

Crée une fiche Play Store complète

Clique sur "Envoyer pour révision"

✅ 7. Google vérifie et publie
⏳ Le délai de validation peut varier :

De quelques heures à 2–3 jours

Tu recevras un e-mail de confirmation lorsque ton app sera publiée

