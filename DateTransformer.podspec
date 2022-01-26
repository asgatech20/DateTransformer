Pod::Spec.new do |spec|

  spec.name         = "DateTransformer"
  spec.version      = "1.0.0"
  spec.source_files = "DateTransformer/**/*.{h,m}"
  spec.summary      = "A DateTransformer convert date to string using custom formats and visversa."

  spec.description  = <<-DESC
		A DateTransformer module convert date to string using custom formats and visversa.
                   DESC

  spec.homepage     = "https://github.com/asgatech20/DateTransformer"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  
  spec.authors      = { "Khaled Mahmoud" => "khaled.mahmoud@asgatech.com" }

  spec.ios.deployment_target = "14.5"
  
  spec.source       = { :git => "https://github.com/asgatech20/DateTransformer.git", :tag => "#{spec.version}" }
  
end
