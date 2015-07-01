Pod::Spec.new do |s|

  s.name             = "KMAccordionTableViewController"
  s.version          = "0.2"
  s.summary          = "Accordion UITableViewController"
  s.description      = <<-DESC
                       Accordion UITableViewController component based on Apples's example.
                       DESC
  s.homepage         = "https://github.com/klevison/KMAccordionTableViewController"
  s.screenshots      = "http://dl.dropbox.com/u/378729/MBProgressHUD/1.png"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Klevison Matias" => "klevison@gmail.com" }
  s.source           = { :git => "https://github.com/klevison/KMAccordionTableViewController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/klevison'

  s.platform         = :ios, '6.0'
  s.requires_arc     = true

  s.source_files     = "Classes", "Classes/**/*.{h,m}"
  s.resource_bundles = {
    'KMAccordionTableViewController' => ['Classes/**/*.{xib,png,nib}']
  }

end
