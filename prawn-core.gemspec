dir = File.expand_path(File.dirname(__FILE__))

Gem::Specification.new do |spec|
  spec.name = 'prawn-core'
  spec.version = File.read(File.expand_path('VERSION', dir)).strip
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'A fast and nimble PDF generator for Ruby'

  spec.authors = [
    'Gregory Brown',
    'Guilherme Cassolato'
  ]
  spec.email = [
    'gregory.t.brown@gmail.com',
    'guicassolato@gmail.com'
  ]
  spec.licenses = %w[Ruby GPL-2.0 GPL-3.0]

  spec.require_path = "lib"

  spec.files =  Dir.glob('{examples,lib,spec,data}/**/**/*') +
                Dir.glob('data/{encodings,images,pdfs}/*') +
                Dir.glob('data/fonts/{MustRead.html,*.afm}') +
                [
                  'data/shift_jis_text.txt',
                  'Rakefile',
                  "prawn-core.gemspec",
                  "COPYING",
                  "LICENSE"
                ]

  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    Dir.chdir(submodule_path) do
      submodule_files = `git ls-files`.split($\).reject { |path| path =~ /\.ttf/ }
      submodule_files_paths = submodule_files.map do |filename|
        "#{submodule_path}/#{filename}".gsub "#{dir}/", ""
      end
      spec.files += submodule_files_paths
    end
  end

  spec.test_files = Dir['spec/*_spec.rb']
  spec.has_rdoc = true
  spec.extra_rdoc_files = %w{README LICENSE COPYING}
  spec.rdoc_options << '--title' << 'Prawn Documentation' <<
    '--main'  << 'README' << '-q'
  spec.rubyforge_project = "prawn"
  spec.homepage = 'http://prawnpdf.org'
  spec.description = <<END_DESC
  Prawn is a fast, tiny, and nimble PDF generator for Ruby
END_DESC
end