1. Add gems to Gemfile after "group :development, :test do"

```
  gem 'htmlbeautifier', require: false # check if this works
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'solargraph-rails', '1.0.0.pre.1', require: false
  # OR: gem 'solargraph-rails', git: 'https://github.com/iftheshoefritz/solargraph-rails.git', branch: 'main', require: false
```

2. install binstubs

```
bundle binstubs --all
```

3. configure solargraph

- step 1: run this:
  ```
  bundle exec solargraph clear
  cat > .solargraph.yml << 'EOF'
  ---
  include:
    - "app/**/*.rb"
    - "lib/**/*.rb"
  plugins:
    - solargraph-rails
  max_files: 5000
  EOF
  bundle exec solargraph download-core
  bundle exec yard gems
  bundle exec solargraph bundle
  ```
- step 2:
  - in terminal run `which bundle`
  - add these lines to settings.json in VSCODE:
    ```
    "solargraph.bundlerPath": "<path-returned-from which-bundler>",
    "solargraph.useBundler": true,
    ```
- step 3: run cmd-shift-p, then type "reload window" and hit enter.

4. configure rubocop

- Add these lines to settings.json in VSCODE:

```
"ruby.useBundler": true,
"ruby.format": "rubocop",
"ruby.rubocop.onSave": true,
"[ruby]": {
  "editor.tabSize": 2,
  "editor.defaultFormatter": "misogi.ruby-rubocop",
  "editor.formatOnSave": true
},
"ruby.lint": {
  "rubocop": true
}
```

4. Install VSCODE plugins:

- Ruby by Peng Lv
- Ruby on Rails by Hirdoy
- Ruby Solargraph
- ruby-rubocop
- Simple Ruby ERB by Victor Ortiz Heredia
