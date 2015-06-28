require 'formula'

class Pngout < Formula
  url 'http://static.jonof.id.au/dl/kenutils/pngout-20150319-darwin.tar.gz'
  homepage 'http://www.jonof.id.au/kenutils'
  sha256 'ff7905970457ee5c96776b94e0bf8a22b41fe05fc0cededb16da1c2c0aa5c65d'
  version '20150319'

  def install
    prefix.install Dir['*']
    File.symlink(prefix+'pngout', '/usr/local/bin/pngout')
  end
end
