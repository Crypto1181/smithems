#!/bin/bash
echo "Git Setup Script for Smith EMS"
echo "================================"
echo ""
echo "Please enter your Git configuration:"
read -p "Your name: " git_name
read -p "Your email: " git_email

git config user.name "$git_name"
git config user.email "$git_email"

echo ""
echo "Git configured successfully!"
echo "Name: $git_name"
echo "Email: $git_email"
echo ""
echo "Now you can commit:"
echo "  git add ."
echo "  git commit -m 'Initial commit: Smith EMS Flutter app'"
