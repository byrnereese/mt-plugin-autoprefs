package AutoPrefs::Plugin;

use strict;

sub on_template_set_change {
   my ( $cb, $param ) = @_;
   my $blog = $param->{blog} or return;
   
#   $blog->save;
}

1;
