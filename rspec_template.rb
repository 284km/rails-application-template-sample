# rspec_template.rb

### rails newの際にmオプションでテンプレートを指定します。
### rails new myapp -m template/rspec_template.rb

txt = <<-TXT

      ＿人人人人人人人人人人人人人人人＿
      ＞　Rails Application Templates　＜
      ￣Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^YY^Y￣

TXT
puts txt

# Gemfileに追加
gem_group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov' if yes?('use simplecov ?')
end

### yes?メソッドはy（yes）が入力されるとtrueが返るので、
### 「必要な時だけ○○を追加する」といった処理が可能になります。
### （no?メソッドもあります）

# rspec初期設定
run 'bundle install'
run 'rm -rf test'
generate 'rspec:install'

### spec/support ディレクトリはデフォルトではコメントアウトされているので、
### uncomment_linesメソッドでコメントアウトを解除します。
### そして、getメソッドで spec/support/factory_girl.rb を
### templateディレクトリ内の spec/support/factory_girl.rb から取得するようにします。

# factory_girl初期設定
uncomment_lines 'spec/rails_helper.rb', /Dir\[Rails\.root\.join/
get "~/{template へのパスを記述}/template/spec/support/factory_girl.rb", 'spec/support/factory_girl.rb'
