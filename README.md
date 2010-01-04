# AutoPrefs, a plugin for Melody and Movable Type #

This plugins provides a framework by which a blog, through it's 
config.yaml file, can dictate a collection of settings that can
easily be applied to a blog. 

## Installation ##

To install this plugin follow the instructions found here:

http://tinyurl.com/easy-plugin-install

## Usage ##

### Users and Admins ###

For the most part, users and admins never interact with this plugin directly.
All a user needs to do is RESET their templates, and if the theme they apply
supports this plugin and this plugin is installed, then the blog's preferences
will automagically be setup.

### Developers ###

Developers can use this plugin to automatically apply a set of blog preferences
to a blog when a user resets their blog templates. The format for specifying 
these preferences is as following:

First, within your `config.yaml`, you need to define a preferences group. Each
preferences group has a unique identifier (corresponding to the groups registry
key). Then provide some additional descriptive meta data about the preferences
group and finally provide a list of all the preferences you want to override. 
For example:

    name: 'My Plugin'
    description: 'This is a sample plugin showing off Auto Prefs.'

    blog_preferences:
      my_config:
        label: "Byrne's Preferred Config"
        description: "This is a packaging on my preferred settings for a blog."
        order: 100
        preferences:
          file_extension: php
          allow_comments_html: 0

*Note: in the example above, the preference group ID is `my_config`.*

Once the preferences group has been defined, then it can be referenced by a 
template set as follows:

    template_sets:
      myset:
        blog_preferences: my_config
        templates:
          index:
            main_index:
              label: 'Main Index'

You can also use this plugin to inject data into an `MT::PluginData` record. This
allows for themes to auto-configure plugins as well.

    blog_preferences:
      my_config:
        label: "Byrne's Preferred Config"
        description: "This is a packaging on my preferred settings for a blog."
        order: 100
        plugin_data:
          FacebookCommenters:
            facebook_app_secret: xxxxxx
            facebook_app_key: xxxxxx
        preferences:
          file_extension: php
          allow_comments_html: 0

*Note: This will only configure blog level settings. System level settings for
plugins must be configured manually. This seems like a reasonable restriction to
keep plugins from obliterating configs inadvertently.*

#### Supported Preferences ####

Below is a list of all the supported preferences and their default value. There
is no need to specify a default preference in your `config.yaml` unless you 
intend to override the default. 

* `allow_anon_comments` (default: 0) - Allow anonymous comments on the blog.
* `allow_comment_html` (default: 1) - Allow HTML to be used within comments.
* `allow_commenter_regist` (default: 1) - Allow visitors to register for new accounts from the sign in screen.
* `allow_comments_default` (default: 1) - Turn on comments by default for new entries.
* `allow_pings` (default: 1) - Global toggle for TrackBacks.
* `allow_pings_default` (default: 1) - Turn on TrackBacks by default for new entries.
* `allow_reg_comments` (default: 1) - 
* `allow_unreg_comments` (default: 0) - 
* `archive_type` (default: '') - 
* `archive_type_preferred` (default: '') - 
* `autodiscover_links` (default: 0) - 
* `autolink_urls` (default: 1) - 
* `basename_limit` (default: 100) - 
* `captcha_provider` (default: *null*) - 
* `cc_license` (default: *null*) - 
* `commenter_authenticators` (default: ) - Determines which authentication options are enabled by default. The value of this property should be a comma delimited list of acceptable values. Acceptable values are:
  * MovableType
  * OpenID
  * LiveJournal
  * Vox
  * Google
  * Yahoo
  * AIM 
  * WordPress - requires WordPress Auth plugin
  * Twitter - requires Twitter Commenters plugin
  * Facebook - requires Facebook Connect plugin
* `convert_paras` (default: *default text format*) - 
* `convert_paras_comments` (default: 1) - 
* `custom_dynamic_templates` (default: 'none') - 
* `days_on_index` (default: 0) - 
* `email_new_comments` (default: 1) - 
* `email_new_pings` (default: 1) - 
* `entries_on_index` (default: 10) - 
* `file_extension` (default: 'html') - 
* `follow_auth_links` (default: 1) - 
* `image_default_align` (default: *null*) - 
* `image_default_constrain` (default: *null*) - 
* `image_default_thumb` (default: *null*) - 
* `image_default_width` (default: *null*) - 
* `image_default_popup` (default: *null*) - 
* `image_default_wrap_text` (default: *null*) - 
* `image_default_wunits` (default: *null*) - 
* `include_cache` (default: 0) - Turns on/off template module caching for the blog.
* `include_system` (default: 0) - Determines what SSI include system to use. Acceptable values are:
  * php
  * jsp
  * asp
  * shtml
* `internal_autodiscovery` (default: 0) - 
* `is_dynamic` (default: 0) - 
* `junk_folder_expiry` (default: 14) - In days.
* `junk_score_threshold` (default: 0) - 
* `language` (default: *derived from config file, or from server*) - 
* `manual_approve_commenters` (default: 0) - 
* `moderate_pings` (default: 1) - 
* `moderate_unreg_comments` (default: 2) - Controls the commenting and moderation policy for the blog. Acceptable values range from 0 to 3. They are:
  * 0 - Immediately approve comments from anyone
  * 1 - Immediately approve comments from none
  * 2 - Immediately approve comments from trusted commenters only
  * 3 - Immediately approve comments from any authenticated commenter
* `nofollow_urls` (default: 1) - 
* `nwc_smart_replace` (default: ) - 
* `nwc_replace_field` (default: ) - 
* `ping_blogs` (default: 0) - 
* `ping_google` (default: 0) - 
* `ping_others` (default: 0) - 
* `ping_technorati` (default: 0) - 
* `ping_weblogs` (default: 0) - 
* `remote_auth_token` (default: ) - 
* `require_comment_emails` (default: 0) - 
* `require_typekey_emails` (default: 0) - 
* `sanitize_spec` (default: 0) - 
* `server_offset` (default: *determined from config file or server*) - 
* `sort_order_comments` (default: 'ascend') - 
* `sort_order_posts` (default: 'descend') - 
* `status_default` (default: 2) - unpublished = 1, published = 2, review = 3, scheduled = 4, junk = 5
* `update_pings` (default: *null*) - 
* `use_comment_confirmation` (default: 1) - 
* `welcome_msg` (default: 0) - 
* `words_in_excerpt` (default: 40) - 

## License ##

This plugin is licensed under the same terms as Perl itself.