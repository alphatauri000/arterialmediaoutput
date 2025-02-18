# Makefile for deploying the Flutter web projects to GitHub

BASE_HREF = /$(arterialmediaoutput)/
# Replace this with your GitHub username
GITHUB_USER = alphatauri000
GITHUB_REPO = https://github.com/alphatauri000/arterialmedia
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

# Deploy the Flutter web project to GitHub
deploy:
ifndef OUTPUT
  $(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif

  @echo "Clean existing repository"
  flutter clean

  @echo "Getting packages..."
  flutter pub get

  @echo "Generating the web folder..."
  flutter create . --platform web

  @echo "Building for web..."
  flutter build web --base-href $(BASE_HREF) --release

  @echo "Deploying to git repository"
  cd build/web && \
  git init && \
  git add . && \
  git commit -m "Deploy Version $(1.0)" && \
  git branch -M main && \
  git remote add origin $(arterialmedia) && \
  git push -u -f origin main

  @echo "✅ Finished deploy: $(arterialmediaoutput)"
  @echo "🚀 Flutter web URL: https://$(alphatauri000).github.io/$(arterialmediaoutput)/"

.PHONY: deploy