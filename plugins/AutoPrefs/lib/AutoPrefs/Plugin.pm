package AutoPrefs::Plugin;

use strict;

sub apply {
    my $app     = shift;
    my ($param) = @_;

    $app->validate_magic or return;

    my $q       = $app->{query};
    my $blog    = MT->model('blog')->load( $q->param('blog_id') );
    my $pid     = $q->param('pref_id');

    if ($pid eq '__default__') {
	$blog->set_defaults();
    } else {
	_apply_prefs( $blog, $pid );
    }

    return $app->redirect(
	$app->uri(
	    'mode' => 'autoprefs_chooser',
	    'args' => {
		'prefs_applied' => 1,
		'blog_id'       => $app->param('blog_id'),
		'return_args'   => $app->return_args,
		'magic_token'   => $app->param('magic_token')
	    }
	)
    );
}

sub chooser {
    my $app     = shift;
    my ($param) = @_;
    my $q       = $app->{query};
    my $blog    = MT->model('blog')->load( $q->param('blog_id') );

    $param ||= {};

    my $prefs = MT->registry('blog_preferences');
    my @data;
    foreach my $pid (keys %$prefs) {
	my $pref = $prefs->{$pid};
	push @data, {
	    id          => $pid,
	    name        => &{ $pref->{'label'} },
            description => $pref->{'description'},
            order       => $pref->{'order'} || 10,
	};
    }
    @data = sort { $a->{order} <=> $b->{order} } @data;
    $param->{prefs} = \@data;
    $param->{blog_id} = $app->param('blog_id');
    $param->{return_args} = $app->return_args;
    $param->{magic_token} = $app->param('magic_token');
    $param->{prefs_applied} = $app->param('prefs_applied') ? 1 : 0;

    return $app->load_tmpl( 'chooser.tmpl', $param );
}

sub on_template_set_change {
   my ( $cb, $param ) = @_;
   my $blog = $param->{blog} or return;

   my $ts   = $blog->template_set;
   return undef unless $ts;

   my $pref_id = MT->registry('template_sets')->{$ts}->{blog_preferences};
   return undef unless $pref_id;

   _apply_prefs( $blog, $pref_id );
}

sub _apply_prefs {
    my ($blog, $pid) = @_;

    my $label = &{ MT->registry('blog_preferences')->{$pid}->{label} };
    MT->log({
	blog_id => $blog->id,
	message => "The AutoPrefs plugin is configuring " . $blog->name . " with $label.",
	level => MT::Log::INFO(),
    });

    my $prefs = MT->registry('blog_preferences')->{$pid}->{'preferences'};
    foreach my $col (keys %$prefs) {
	my $value = $prefs->{$col};
	if ($blog->has_column($col)) {
	    # TODO Validate input
	    $blog->$col($value);
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
