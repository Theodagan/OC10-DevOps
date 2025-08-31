# 🃏 BobApp - L'application de blagues par excellence !

[![Build Status](https://github.com/theodagan/bobapp/workflows/FullStack%20tests%20(Angular%20+%20Spring)/badge.svg)](https://github.com/theodagan/bobapp/actions)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Images-blue)](https://hub.docker.com/u/theodagan)
[![Quality Gate Status](https://img.shields.io/badge/Quality%20Gate-Passed-brightgreen)](https://sonarqube.com)

## 📋 Description

BobApp est une application web full-stack qui affiche des blagues françaises aléatoirement. Elle combine une interface Angular moderne avec une API Spring Boot robuste, le tout containerisé avec Docker et équipé d'un pipeline CI/CD complet.

### ✨ Fonctionnalités

- 🎲 **Blagues aléatoires** : Plus de 45 blagues françaises soigneusement sélectionnées
- 🎨 **Interface moderne** : UI Material Design avec Angular
- ⚡ **API REST performante** : Backend Spring Boot réactif
- 🐳 **Containerisation complète** : Images Docker optimisées
- 🔄 **CI/CD automatisé** : Tests, qualité et déploiement automatiques
- 📊 **Monitoring qualité** : Intégration SonarQube et rapports de couverture

## 🏗️ Architecture

```
BobApp/
├── 📁 front/          # Application Angular
│   ├── src/
│   │   ├── app/       # Composants et services
│   │   └── assets/    # Ressources statiques
│   ├── package.json
│   └── Dockerfile
├── 📁 back/           # API Spring Boot
│   ├── src/
│   │   ├── main/      # Code source
│   │   └── test/      # Tests unitaires
│   ├── pom.xml
│   └── Dockerfile
└── 📁 .github/        # Workflows CI/CD
    └── workflows/
```

### 🔧 Stack Technique

**Frontend**
- **Angular** 15+ avec TypeScript
- **Angular Material** pour l'interface utilisateur
- **RxJS** pour la programmation réactive
- **Karma + Jasmine** pour les tests

**Backend**
- **Spring Boot** 2.6.1 avec Java 11
- **Spring WebFlux** pour la programmation réactive
- **JUnit 5** pour les tests
- **JaCoCo** pour la couverture de code

**DevOps**
- **Docker** pour la containerisation
- **GitHub Actions** pour CI/CD
- **SonarQube** pour l'analyse de qualité
- **Docker Hub** pour le registry d'images

## 🚀 Démarrage Rapide

### Prérequis

- **Java 11+** (pour le développement local)
- **Node.js 16+** et npm
- **Docker** et Docker Compose (optionnel)
- **Git**

### Installation Locale

#### 1. Cloner le repository
```bash
git clone https://github.com/theodagan/bobapp.git
cd bobapp
```

#### 2. Démarrer le Backend
```bash
cd back
./mvnw spring-boot:run
# L'API sera accessible sur http://localhost:8080
```

#### 3. Démarrer le Frontend
```bash
cd front
npm install
npm start
# L'application sera accessible sur http://localhost:4200
```

### 🐳 Avec Docker

#### Option 1 : Images pré-construites
```bash
# Frontend
docker run -p 4200:80 theodagan/bobapp-front:latest

# Backend
docker run -p 8080:8080 theodagan/bobapp-back:latest
```

#### Option 2 : Build local
```bash
# Frontend
cd front
docker build -t bobapp-front .
docker run -p 4200:80 bobapp-front

# Backend
cd back
docker build -t bobapp-back .
docker run -p 8080:8080 bobapp-back
```

## 🧪 Tests

### Tests Frontend
```bash
cd front
npm test                    # Tests unitaires
npm run test:coverage      # Tests avec couverture
npm run e2e               # Tests end-to-end (si configurés)
```

### Tests Backend
```bash
cd back
./mvnw test                    # Tests unitaires
./mvnw test jacoco:report     # Tests avec couverture JaCoCo
./mvnw verify                 # Tests d'intégration
```

### Tests Full-Stack
```bash
# Via GitHub Actions (local act)
act -W .github/workflows/full-stack-test.yml
```

## 📊 Qualité du Code

### Métriques Actuelles

| Métrique | Frontend | Backend | Global |
|----------|----------|---------|--------|
| **Couverture de Code** | 🟡 76.92% | 🔴 32% | 🔴 54.46% |
| **Lignes de Code** | ~400 | ~150 | ~550 |
| **Complexité Cyclomatique** | Faible | Faible | Faible |
| **Duplication** | < 1% | < 1% | < 1% |

### SonarQube

L'analyse SonarQube est déclenchée manuellement via GitHub Actions :

```bash
# Via GitHub Actions
gh workflow run sonar.yml
```

**Quality Gates configurés :**
- ✅ Bugs : 0 toléré
- ✅ Vulnérabilités : 0 toléré
- ✅ Code Smells : < 50
- ✅ Duplication : < 5%
- 🔴 Couverture : > 80% (objectif non atteint)

## 🔄 CI/CD Pipeline

### Workflows Disponibles

| Workflow | Déclencheur | Durée | Description |
|----------|-------------|-------|-------------|
| **Build & Push** | Push `main`, Tags `v*` | ~5 min | Construction et publication des images Docker |
| **Full-Stack Tests** | Push, PR, Manuel | ~4 min | Tests complets avec couverture |
| **SonarQube Scan** | Manuel uniquement | ~8 min | Analyse de qualité du code |

### Stratégie de Branches

- **`main`** : Branche de production, déclenche les builds automatiques
- **`develop`** : Branche de développement, déclenche les tests
- **Feature branches** : Tests automatiques sur les PR

### Artefacts Générés

- 📦 **Images Docker** : `theodagan/bobapp-front:latest` et `theodagan/bobapp-back:latest`
- 📊 **Rapports de couverture** : HTML navigables téléchargeables
- 📋 **Rapports SonarQube** : Analyse détaillée de la qualité

## 📖 API Documentation

### Endpoints Disponibles

#### `GET /api/joke`
Récupère une blague aléatoire du catalogue.

**Réponse :**
```json
{
  "joke": "C'est l'histoire du ptit dej, tu la connais ?",
  "response": "Pas de bol."
}
```

**Codes de retour :**
- `200 OK` : Blague récupérée avec succès
- `500 Internal Server Error` : Erreur serveur

## 🛠️ Développement

### Structure du Projet

#### Frontend (`/front`)
```
src/
├── app/
│   ├── components/     # Composants Angular
│   ├── services/      # Services et logique métier
│   ├── model/         # Interfaces TypeScript
│   └── app.module.ts  # Module principal
├── assets/            # Ressources statiques
└── environments/      # Configuration par environnement
```

#### Backend (`/back`)
```
src/
├── main/java/com/openclassrooms/bobapp/
│   ├── controller/    # Contrôleurs REST
│   ├── service/       # Logique métier
│   ├── model/         # Entités et DTOs
│   └── data/          # Accès aux données
└── resources/
    ├── json/          # Données des blagues
    └── application.properties
```

### Configuration Proxy

Le frontend utilise un proxy pour communiquer avec le backend en développement :

```json
{
  "/api/*": {
    "target": "http://127.0.0.1:8080/",
    "secure": false,
    "changeOrigin": true
  }
}
```

### Scripts Utiles

#### Frontend
```bash
npm start              # Démarrage en mode développement
npm run build          # Build de production
npm run build:prod     # Build optimisé
npm test               # Tests unitaires
npm run lint           # Analyse statique
```

#### Backend
```bash
./mvnw spring-boot:run        # Démarrage en mode développement
./mvnw clean install          # Build et installation
./mvnw test                   # Tests unitaires
./mvnw spring-boot:build-image # Build image Docker
```

## 🐛 Dépannage

### Problèmes Fréquents

#### "Port 8080 already in use"
```bash
# Trouver le processus utilisant le port
lsof -i :8080
# Tuer le processus
kill -9 <PID>
```

#### Tests Angular échouent
```bash
# Nettoyer le cache npm
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

#### Erreur Maven "Cannot resolve dependencies"
```bash
# Nettoyer le cache Maven
./mvnw dependency:purge-local-repository
./mvnw clean install
```

### Logs et Debugging

#### Backend
```bash
# Logs Spring Boot avec niveau DEBUG
./mvnw spring-boot:run -Dspring-boot.run.arguments=--logging.level.com.openclassrooms=DEBUG
```

#### Frontend
```bash
# Build avec source maps
ng build --source-map=true
```

## 📈 Monitoring et Métriques

### KPIs de Performance

| KPI | Objectif | Statut Actuel |
|-----|----------|---------------|
| Build Time | < 10 min | ✅ 3-5 min |
| Test Coverage | > 80% | 🔴 54.46% |
| Success Rate | > 95% | 🟡 ~85% |
| Quality Gate | PASSED | ✅ PASSED |

### Améliorations Prévues

- 🎯 **Augmenter la couverture de tests** : Objectif 80%
- ⚡ **Optimiser les temps de build** : Cache Docker amélioré
- 🔄 **Automatiser SonarQube** : Intégration dans le pipeline principal
- 📱 **Responsive design** : Amélioration mobile
- 🌐 **Internationalisation** : Support multi-langues

## 🤝 Contribution

### Workflow de Contribution

1. **Fork** le repository
2. **Créer** une branche feature (`git checkout -b feature/ma-fonctionnalite`)
3. **Développer** avec tests
4. **Commiter** (`git commit -m 'Add: Ma fonctionnalité'`)
5. **Push** (`git push origin feature/ma-fonctionnalite`)
6. **Créer** une Pull Request

### Standards de Code

#### Conventions de Nommage
- **Java** : CamelCase pour les classes, camelCase pour les méthodes
- **TypeScript** : camelCase pour les variables, PascalCase pour les classes
- **CSS** : kebab-case pour les classes CSS

#### Règles de Qualité
- ✅ Tests unitaires obligatoires pour nouveau code
- ✅ Couverture > 70% sur les nouveaux fichiers
- ✅ Pas de code smells bloquants
- ✅ Documentation des APIs publiques

## 📝 Changelog

### Version 0.0.1-SNAPSHOT (Actuelle)
- ✨ Interface Angular avec Material Design
- ✨ API REST Spring Boot
- ✨ 45+ blagues françaises
- ✨ Pipeline CI/CD complet
- ✨ Images Docker automatisées
- ✨ Tests unitaires et couverture
- ✨ Analyse SonarQube

## 👥 Auteurs

- **Équipe OpenClassrooms** - *Développement initial*
