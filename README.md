rna_summer_school
=================

For production:
bundle exec unicorn -E production -p 6969 -c ./config/unicorn.rb

For development:
foreman start
