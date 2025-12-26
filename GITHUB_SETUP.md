# GitHub Setup & Web Deployment Guide

## Step 1: Configure Git (if not already done)

Run these commands with your GitHub email and name:

```bash
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"
```

Or for this repository only:
```bash
git config user.email "your-email@example.com"
git config user.name "Your Name"
```

## Step 2: Create Initial Commit

After configuring Git, run:
```bash
git add .
git commit -m "Initial commit: Smith EMS Flutter app with all screens implemented"
```

## Step 3: Create GitHub Repository

1. Go to https://github.com/new
2. Create a new repository (e.g., `smithems`)
3. **DO NOT** initialize with README, .gitignore, or license (we already have these)

## Step 4: Push to GitHub

After creating the repository, GitHub will show you commands. Use these:

```bash
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/smithems.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username.

## Step 5: Test as Web App Locally

Run the web app locally:
```bash
flutter run -d chrome
```

Or build for web:
```bash
flutter build web
```

Then serve it:
```bash
cd build/web
python3 -m http.server 8000
```

Visit: http://localhost:8000

## Step 6: Deploy to Web (Optional)

### Option A: GitHub Pages
1. Build for web: `flutter build web --base-href "/smithems/"`
2. Push the `build/web` folder to `gh-pages` branch
3. Enable GitHub Pages in repository settings

### Option B: Netlify/Vercel
1. Build for web: `flutter build web`
2. Deploy the `build/web` folder to Netlify or Vercel

### Option C: Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize: `firebase init hosting`
3. Build: `flutter build web`
4. Deploy: `firebase deploy`

