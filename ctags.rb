require 'formula'

class Ctags < Formula
  homepage 'http://ctags.sourceforge.net/'
  url 'https://downloads.sourceforge.net/ctags/ctags-5.8.tar.gz'
  sha1 '482da1ecd182ab39bbdc09f2f02c9fba8cd20030'

  head do
    url 'https://github.com/universal-ctags/ctags', :using => :git
    depends_on :autoconf
  end

  def install
    if build.head?
      system "autoheader"
      system "autoconf"
    end
    system "./configure", "--prefix=#{prefix}",
                          "--enable-macro-patterns",
                          "--mandir=#{man}",
                          "--with-readlib"
    system "make install"
  end

  def caveats
    <<-EOS.undent
      Under some circumstances, emacs and ctags can conflict. By default,
      emacs provides an executable `ctags` that would conflict with the
      executable of the same name that ctags provides. To prevent this,
      Homebrew removes the emacs `ctags` and its manpage before linking.

      However, if you install emacs with the `--keep-ctags` option, then
      the `ctags` emacs provides will not be removed. In that case, you
      won't be able to install ctags successfully. It will build but not
      link.
    EOS
  end
end
