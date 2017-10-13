namespace :scss do
  desc 'Align values in SCSS files to make them look prettier'
  task align: :environment do
    Scss::Aligner.run
  end
end
