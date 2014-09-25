# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'ctags-bundler', :src_path => ["app", "lib"] do
  watch(/^(app|lib)\/.*\.rb$/)
  watch('Gemfile.lock')
end
