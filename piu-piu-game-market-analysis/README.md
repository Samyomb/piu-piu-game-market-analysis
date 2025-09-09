# Piu Piu — Analyse de marché jeu vidéo (code)

Ce dépôt contient le **code** (SQL/Python) et la documentation pour l'analyse **plateforme × genre × localisation × monétisation**.

> Sauf mention « Marché 2024 », les résultats sont **internes à l’échantillon** décrit ci-dessous.

---

## 🔗 Liens
- **Dashboard (Looker Studio)** : https://lookerstudio.google.com/embed/reporting/64f4f0d0-0df3-46b7-8be9-b57a98db3213/page/p_x405yj6vvd
- **Portfolio** : https://samyomb.github.io

---

## 🧭 Périmètres & chiffres utilisés

### Marché 2024 (global)
- **CA mondial** : **184 Md $**
- **Répartition CA** : **Mobile 51 %**, **Console 28,6 %**, **PC 20,4 %**

### Dataset (1993–2023)
- **Jeux référencés** : **97 831**
- **Genres (analyse dédiée)** : **140 000 joueurs**, **68 000 jeux** (PlayStation, Steam/PC, Xbox)
- **Localisation / achats** : ~**15 667 000** jeux **achetés** (genres : Aventure, RPG, Shooter)
- **Plateformes** : **PC/Steam** largement devant en **volume de sorties**

### Choix & métriques clés
- **Genres retenus** : **Aventure**, **RPG**, **Shooter**
- **Localisation — répartition (3 genres)** : **Europe 45,9 %**, **Amérique 36,9 %**, **Asie 14,2 %**
- **Pays ciblés** : Europe (UK, DE, RU, ES, FR) · Amérique (US, CA, BR, AR)
- **Langues** : 6 (DE, RU, ES, FR, EN, PT)

### Pricing & modes (Top 100 / Top 30 PS+Steam, 2003–2024)
- **Objectif** : s’inscrire dans le **Top 30**
- **Jeux par mode** : **Multijoueur 57,1 %** · **Solo 42,9 %**
- **Répartition du CA par mode** : **Multijoueur 67,2 %** · **Solo 32,8 %**
- **Prix moyen par plateforme** : **PlayStation ~65 €**, **Steam ~40 €** (≈ **+62,5 %**)
- **Prix moyen par genre** : **RPG 69,99 €**, **Aventure 63 €**, **Shooter 53 €**
- **Prix cible Piu Piu** : **64,99 €**
- **Plateformes cible** : **Steam** (lancement) + **portage PlayStation**

### Indices de contenu (profil rating)
- **Sang 0,28** · **Violence 0,27** · **Alcool ~0,05** · **Sexe ~0,05** · **Drogue ~0,05** · **Humour ~0,05**

---

## 🚀 Démarrage rapide (A → Z)

### 1) Cloner & créer l’environnement
```bash
# Cloner
git clone https://github.com/VOTRE-PSEUDO/piu-piu-game-market-analysis.git
cd piu-piu-game-market-analysis

# Créer un environnement virtuel
python -m venv .venv
# macOS/Linux
source .venv/bin/activate
# Windows PowerShell
# .venv\Scripts\Activate.ps1

# Installer les dépendances
pip install -r requirements.txt
```

### 2) Placer les données
- Ne poussez pas les fichiers sources dans Git (voir `.gitignore`).
- Déposez vos fichiers dans `data/raw/` (CSV/Parquet…) et mettez un **README** de provenance si besoin.

### 3) Lancer l’exploration
```bash
jupyter notebook
# Ouvrir notebooks/01_exploration.ipynb
```
ou exécuter :
```bash
python scripts/make_dataset.py
```

### 4) Reproduire les agrégations
- SQL : exécuter `sql/01_normalize_genres.sql` puis `sql/02_aggregations.sql` sur votre base (ou via notebook).
- Python : `src/compute_metrics.py` pour calculs de prix moyens, paniers et **CA estimé**.

### 5) Générer des visuels
- `src/plotting.py` (matplotlib) crée des PNG dans `reports/figures/` pour votre README.

---

## 📚 Sources & licences
- **Gaming profiles (multi-plateformes)** — Kaggle  
  https://www.kaggle.com/datasets/artyomkruglov/gaming-profiles-2025-steam-playstation-xbox
- **Best-selling game consoles (all-time)** — Kaggle  
  https://www.kaggle.com/datasets/tayyarhussain/best-selling-game-consoles-of-all-time
- **Game metrics (divers)** — Zenodo  
  https://zenodo.org/records/10797761

*Je ne redistribue pas les fichiers sources. Téléchargez-les via les liens ci-dessus.*

---

## 🗂️ Arborescence
```
notebooks/            # analyses interactives
sql/                  # requêtes SQL (normalisation + agrégations)
src/                  # fonctions Python (chargement, métriques, plots)
scripts/              # scripts CLI
data/raw/             # données brutes (non versionnées)
data/processed/       # sorties intermédiaires (non versionnées)
lookerstudio/         # captures & notes champs calculés
reports/figures/      # images auto-générées pour le README
```

## 📝 Licence
MIT (à adapter si nécessaire).