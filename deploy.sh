#!/bin/bash

# Deployment script for GitHub Pages
# This script builds the project and updates the docs folder

echo "🚀 Starting deployment process..."

# Step 1: Build the project
echo "📦 Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Step 2: Sync dist to docs
echo "📋 Syncing dist to docs folder..."
rm -rf docs
cp -r dist docs

# Step 3: Create 404.html for SPA routing
echo "📄 Creating 404.html..."
cp docs/index.html docs/404.html

# Step 4: Git operations
echo "📤 Committing and pushing to GitHub..."
git add docs/
git add dist/
git commit -m "Deploy: Update GitHub Pages with latest build"
git push origin main

if [ $? -ne 0 ]; then
    echo "❌ Push failed!"
    exit 1
fi

echo ""
echo "✅ Deployment successful!"
echo ""
echo "🌐 Your site will be live at:"
echo "   https://agelogeo.github.io/codebaseapps/"
echo ""
echo "⏰ Please wait 1-2 minutes for GitHub Pages to update"
echo ""
