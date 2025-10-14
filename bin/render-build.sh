#!/usr/bin/env bash
# Render のビルド時に実行されるスクリプト

# 1. 依存ライブラリをインストール
bundle install

# 2. データベースのマイグレーションを実行
bundle exec rails db:migrate

# 3. （必要に応じてassets precompile、今回は不要）
# bundle exec rails assets:precompile

