require 'formula'

class Pngout < Formula
  url 'http://static.jonof.id.au/dl/kenutils/pngout-20150920-darwin.tar.gz'
  homepage 'http://www.jonof.id.au/kenutils'
  sha256 'f3fdd1e2c3f1f1fa886b3b302d64e5e9285cf917ddd43dfd75fb3ff156b66442'
  version '20150920'

  def install
    prefix.install Dir['*']
    File.symlink(prefix+'pngout', '/usr/local/bin/pngout')
  end
end
