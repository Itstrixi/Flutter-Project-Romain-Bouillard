# Rendu TP Flutter - Gestionnaire de Tâches

**Nom :** Bouillard  
**Prénom :** Romain  
**Date de rendu :** 09 janvier 2026

---

## 📱 Présentation du Projet

J'ai développé une **application de gestion de tâches** (Todo List) complète et fonctionnelle en Flutter. Cette application permet aux utilisateurs de créer, organiser et suivre leurs tâches quotidiennes avec une interface moderne et intuitive. Je tiens à préciser que ce document a été mis en page à l'aide d'un LLM.

### Concept
L'application offre une solution simple mais complète pour gérer ses tâches avec :
- Ajout rapide de nouvelles tâches
- Organisation par priorité (basse, moyenne, haute)
- Filtrage et tri avancés
- Statistiques visuelles de progression
- Interface Material Design 3 moderne

---

## ✅ État d'Avancement

### Fonctionnalités Implémentées

#### 1. Architecture et Structure (✅ Complété)
- ✅ Projet Flutter initialisé et fonctionnel
- ✅ Structure en dossiers organisée (models, providers, screens, widgets)
- ✅ Code propre avec nommage cohérent
- ✅ Commentaires et documentation

#### 2. Navigation Multi-Pages (✅ Complété)
- ✅ **HomeScreen** : Page principale avec liste des tâches
- ✅ **AddTaskScreen** : Page d'ajout de nouvelle tâche
- ✅ **TaskDetailScreen** : Page de détail et modification
- ✅ Navigation avec MaterialPageRoute
- ✅ Transitions fluides entre les écrans

#### 3. Gestion d'État avec Provider (✅ Complété)
- ✅ **TaskProvider** implémenté avec ChangeNotifier
- ✅ Partage de données entre tous les widgets
- ✅ Mise à jour réactive de l'interface
- ✅ Gestion centralisée de l'état de l'application

#### 4. Interface Utilisateur (✅ Complété)
- ✅ Widgets structurés : Column, Row, Padding, Center, Container
- ✅ ListView avec items personnalisés
- ✅ Card avec elevation et forme arrondie
- ✅ TextField avec validation de formulaire
- ✅ Buttons : ElevatedButton, TextButton, IconButton
- ✅ Dialogs de confirmation
- ✅ SnackBar pour les notifications
- ✅ Chips pour les filtres et priorités
- ✅ CircularProgressIndicator et LinearProgressIndicator

#### 5. Fonctionnalités Métier (✅ Complété)
- ✅ Création de tâches avec validation
- ✅ Modification de tâches existantes
- ✅ Suppression avec confirmation
- ✅ Marquage terminé/non terminé
- ✅ Filtrage (Toutes, Actives, Terminées)
- ✅ Tri (Date, Priorité, Titre)
- ✅ Statistiques en temps réel
- ✅ Données d'exemple pré-chargées

### Widgets Personnalisés Créés
- **TaskItem** : Composant réutilisable pour afficher une tâche
- **StatsCard** : Carte de statistiques avec graphiques

---

## 🎯 Respect des Critères du TP

| Critère | Points | État | Détails |
|---------|--------|------|---------|
| Projet fonctionnel | 2 | ✅ | Application clonable et exécutable |
| Minimum 2 pages + router | 2 | ✅ | 3 pages avec navigation MaterialPageRoute |
| Structure avec Widgets | 5 | ✅ | Utilisation complète des widgets natifs |
| Provider/Notifiers | 4 | ✅ | TaskProvider avec ChangeNotifier |
| Code soigné | 2 | ✅ | Architecture propre, code documenté |
| Fonctionnalités | 2 | ✅ | Toutes les fonctions opérationnelles |
| **Total** | **17/17** | ✅ | **Tous les critères remplis** |

---

## 🛠️ Technologies et Packages

- **Flutter** 3.0+
- **Dart** 3.0+
- **provider** ^6.1.1 : Gestion d'état
- **Material Design 3** : Design system

---

## 📁 Structure du Projet

```
lib/
├── main.dart                    # Point d'entrée
├── models/
│   └── task.dart               # Modèle Task avec méthodes
├── providers/
│   └── task_provider.dart      # Provider principal
├── screens/
│   ├── home_screen.dart        # Page principale
│   ├── add_task_screen.dart    # Page d'ajout
│   └── task_detail_screen.dart # Page de détail
└── widgets/
    ├── task_item.dart          # Widget de tâche
    └── stats_card.dart         # Widget statistiques
```

---

## 🚀 Installation et Lancement

### Méthode 1 : Depuis le dépôt Git

```bash
# Cloner le projet
git clone [LIEN_VOTRE_DEPOT]
cd flutter_tp_projet

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

### Méthode 2 : Sur Ubuntu avec Waydroid

```bash
# Démarrer Waydroid
waydroid session start

# Dans le dossier du projet
flutter run
```

---

## 📸 Captures d'Écran

### Page Principale (HomeScreen)
- Liste des tâches avec statistiques en haut
- Filtres pour organiser les tâches
- Progression visuelle avec graphique circulaire
- Bouton flottant pour ajouter une tâche

### Page d'Ajout (AddTaskScreen)
- Formulaire avec validation
- Champs : Titre, Description, Priorité
- Interface claire et intuitive

### Page de Détail (TaskDetailScreen)
- Affichage complet de la tâche
- Mode édition pour modification
- Actions : Marquer terminé, Supprimer
- Design cohérent avec le reste de l'app

---

## 💡 Points Techniques Intéressants

### 1. Gestion d'État Avancée
Le **TaskProvider** utilise `ChangeNotifier` pour notifier automatiquement tous les widgets écouteurs lors d'un changement. Cela permet une mise à jour réactive de l'interface sans avoir à gérer manuellement les états.

### 2. Validation de Formulaires
Utilisation du widget `Form` avec `GlobalKey<FormState>` pour valider les champs avant la sauvegarde, assurant l'intégrité des données.

### 3. Widgets Réutilisables
Création de composants modulaires (`TaskItem`, `StatsCard`) qui peuvent être réutilisés et testés indépendamment.

### 4. Material Design 3
Application des dernières guidelines Material Design pour une interface moderne et accessible.

---

## 🔗 Lien vers le Dépôt Git

**URL du dépôt :** https://github.com/Itstrixi/Flutter-Project-Romain-Bouillard

> ⚠️ **Note importante** : Le dépôt est configuré en public et l'utilisateur @Glandalf a été invité comme collaborateur pour l'accès.

---

## 📝 Difficultés Rencontrées et Solutions

### Problème 1 : Configuration Waydroid sur Ubuntu Wayland
**Solution :** Documentation officielle Waydroid + configuration du bridge réseau

### Problème 2 : Gestion du state avec Provider
**Solution :** Étude approfondie de la documentation Provider et des exemples officiels

### Problème 3 : Layout responsive pour différentes tailles d'écran
**Solution :** Utilisation de Expanded, Flexible et MediaQuery

---

## 🎓 Apprentissages

Ce projet m'a permis de :
- ✅ Maîtriser les bases de Flutter et Dart
- ✅ Comprendre la gestion d'état avec Provider
- ✅ Créer des interfaces Material Design professionnelles
- ✅ Organiser un projet Flutter de manière propre
- ✅ Utiliser Git pour le versioning
- ✅ Développer une application mobile complète et fonctionnelle

---

## 🚀 Évolutions Possibles

Si je devais continuer ce projet, j'aimerais ajouter :
- 💾 Persistance des données (SQLite / SharedPreferences)
- 🔔 Notifications pour les rappels
- 📅 Dates d'échéance pour les tâches
- 🏷️ Système de tags/catégories
- 🌙 Mode sombre
- 🔄 Synchronisation cloud
- 📊 Graphiques de productivité

---

## 👤 Contact

**Romain Bouillard**  
Email : r.bouillard@myskolae.fr  
GitHub : https://github.com/Itstrixi

---

**Date de soumission :** 09 janvier 2026  
**Fichier :** romain-bouillard.md
