package AutoPrefs::Plugin;

use strict;

sub on_template_set_change {
   my ( $cb, $param ) = @_;
   my $blog = $param->{blog} or return;

   my $ts   = $blog->template_set;
   return undef unless $ts;

   my $pref_id = MT->registry('template_sets')->{$ts}->{blog_preferences};
   return undef unless $pref_id;

   MT->log({
       blog_id => $blog->id,
       message => "The AutoPrefs plugin is configuring " . $blog->name,
       level => MT::Log::INFO(),
   });

   my $prefs = MT->registry('blog_preferences')->{$pref_id}->{'preferences'};
   foreach my $col (keys %$prefs) {
       my $value = $prefs->{$col};
       if ($blog->has_column($col)) {
	   # TODO Validate input
	   $blog->$col($value);
#	   MT->log({
#	       blog_id => $blog->id,
#	       message => "The AutoPrefs plugin set $col to '$value.'",
#	       level => MT::Log::INFO(),
#	   });
       } else {
	   MT->log({
	       blog_id => $blog->id,
	       message => "The AutoPrefs plugin tried to set a blog preference $col that does not exist.",
	       level => MT::Log::WARNING(),
	   });
       }
   }
   $blog->save;
}

1;
