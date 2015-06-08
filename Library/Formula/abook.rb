class Abook < Formula
  desc "Address book with mutt support"
  homepage "http://abook.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/abook/abook/0.5.6/abook-0.5.6.tar.gz"
  sha1 "79f04f2264c8bd81bbc952b6560c86d69b21615d"
  head "git://git.code.sf.net/p/abook/git"

  bottle do
    sha1 "79a5f0c68339b53df2558854ffef927aa1ef9b29" => :yosemite
    sha1 "2b71a4c791d982933129d096468e9faf365cf35a" => :mavericks
    sha1 "9d84e27e92763c9c9d45f4af89e433e6f5b77a49" => :mountain_lion
  end

  devel do
    url "http://abook.sourceforge.net/devel/abook-0.6.0pre2.tar.gz"
    sha1 "42a939fba43e51aa011fa185113c12ec4bc1e1ec"
    version "0.6.0pre2"

    # Remove `inline` from function implementation for clang compatibility
    patch :DATA
  end

  depends_on "readline"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/abook", "--formats"
  end
end

__END__
diff --git a/database.c b/database.c
index 7c47ab6..53bdb9f 100644
--- a/database.c
+++ b/database.c
@@ -762,7 +762,7 @@ item_duplicate(list_item dest, list_item src)
  */
 
 /* quick lookup by "standard" field number */
-inline int
+int
 field_id(int i)
 {
 	assert((i >= 0) && (i < ITEM_FIELDS));
