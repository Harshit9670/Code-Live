#!/usr/bin/env bash

# Exit if any command fails
set -e

echo "🔧 Setting up Code-Live on macOS..."

# Check Node.js
if ! command -v node &> /dev/null
then
  echo " Node.js not found. Installing via Homebrew..."
  if ! command -v brew &> /dev/null
  then
    echo " Homebrew not found. Install Homebrew first: https://brew.sh"
    exit 1
  fi
  brew install node
else
  echo " Node.js found: $(node -v)"
fi

# Install MongoDB (optional)
if ! command -v mongod &> /dev/null
then
  echo "📦 Installing MongoDB Community..."
  brew tap mongodb/brew
  brew install mongodb-community
  brew services start mongodb-community
else
  echo " MongoDB found"
fi

# Install project dependencies
echo "📦 Installing npm dependencies..."
npm install

echo "🚀 Setup complete! Start the app with: npm start"