#!/usr/bin/env ruby
#
# vmirc => au BufNewFile * :exe("0r! ~/.vim/skeletons.rb %:p " . &filetype)
#
require 'erb'
require 'date'

SKELETON_DIR = File.expand_path("~/.vim/skeletons");
EXTENSION  = "erb"

filepath, filetype = ARGV
filename = File.basename( filepath )
extension = File.extname( filename ).split( '.' )[1]

if filename =~ /\.h$/ then filetype='c_header'; end # otherwise filetype is cpp
if filetype.nil? then filetype = extension; end

skeleton  = [ filename, extension, filetype ].map { |s| File.join( SKELETON_DIR, "#{s}.#{EXTENSION}" ) }.find { |s| File.exist?(s) && File.readable?(s) }

exit if skeleton.nil?

@username = ENV['USERNAME'] || 'John Doe'
@email = ENV['EMAIL'] || 'john.doe@nope.com'
@website = ENV['WEBSITE'] || 'http://john.doe.org'
@now = Date.today.strftime("%d/%m/%y")
@year = Date.today.strftime("%Y")
@license_file = ENV['LICENSE'] || nil
@filename = filename
@filename_base = filename.split('.')[0]
@class_name = filename.split('.')[0].capitalize
@project = File.split( File.dirname( filepath ) ).last

def license comment=nil
    return unless @license_file and File.exist? @license_file
    return File.new( @license_file ).read if comment.nil?
    license = ''
    File.new( @license_file ).each_line { |l| license+=comment+l }
    license
end

def header fn
    fp = File.join( SKELETON_DIR, fn )
    return unless File.exists? fp
    File.open( fp ) { |f| puts ERB.new( f.read, nil, '<>' ).result( binding ) }
end

File.open( skeleton ) do |f| puts ERB.new( f.read, nil, '<>' ).result( binding ) end
