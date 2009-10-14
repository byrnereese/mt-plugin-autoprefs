This plugins provides a framework by which a blog, through it's 
config.yaml file, can dictate a collection of settings that can
easily be applied to a blog. 

# Installation

To install this plugin follow the instructions found here:

http://tinyurl.com/easy-plugin-install

# Usage

## Users and Admins

For the most part, users and admins never interact with this plugin directly.
All a user needs to do is RESET their templates, and if the theme they apply
supports this plugin and this plugin is installed, then the blog's preferences
will automagically be setup.

## Developers

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

### Supported Preferences

Below is a list of all the supported preferences and their default value. There
is no need to specify a default preference in your `config.yaml` unless you 
intend to override the default. 

* `allow_anon_comments` (default: ) - 
* `allow_comment_html` (default: ) - 
* `allow_commenter_regist` (default: ) - 
* `allow_comments_default` (default: ) - 
* `allow_pings` (default: ) - 
* `allow_pings_default` (default: ) - 
* `allow_reg_comments` (default: ) - 
* `allow_unreg_comments` (default: ) - 
* `archive_type` (default: ) - 
* `archive_type_preferred` (default: ) - 
* `autodiscover_links` (default: ) - 
* `autolink_urls` (default: ) - 
* `basename_limit` (default: ) - 
* `captcha_provider` (default: ) - 
* `cc_license` (default: ) - 
* `commenter_authenticators` (default: ) - 
* `convert_paras` (default: ) - 
* `convert_paras_comments` (default: ) - 
* `custom_dynamic_templates` (default: ) - 
* `days_on_index` (default: ) - 
* `email_new_comments` (default: ) - 
* `email_new_pings` (default: ) - 
* `entries_on_index` (default: ) - 
* `file_extension` (default: ) - 
* `follow_auth_links` (default: ) - 
* `google_api_key` (default: ) - 
* `image_default_align` (default: ) - 
* `image_default_constrain` (default: ) - 
* `image_default_thumb` (default: ) - 
* `image_default_width` (default: ) - 
* `image_default_popup` (default: ) - 
* `image_default_wrap_text` (default: ) - 
* `image_default_wunits` (default: ) - 
* `include_cache` (default: ) - 
* `include_system` (default: ) - 
* `internal_autodiscovery` (default: ) - 
* `is_dynamic` (default: ) - 
* `junk_folder_expiry` (default: ) - 
* `junk_score_threshold` (default: ) - 
* `language` (default: ) - 
* `manual_approve_commenters` (default: ) - 
* `moderate_pings` (default: ) - 
* `moderate_unreg_comments` (default: ) - 
* `nofollow_urls` (default: ) - 
* `nwc_smart_replace` (default: ) - 
* `nwc_replace_field` (default: ) - 
* `ping_blogs` (default: ) - 
* `ping_google` (default: ) - 
* `ping_others` (default: ) - 
* `ping_technorati` (default: ) - 
* `ping_weblogs` (default: ) - 
* `remote_auth_token` (default: ) - 
* `require_comment_emails` (default: ) - 
* `require_typekey_emails` (default: ) - 
* `sanitize_spec` (default: ) - 
* `server_offset` (default: ) - 
* `sort_order_comments` (default: ) - 
* `sort_order_posts` (default: ) - 
* `status_default` (default: ) - 
* `update_pings` (default: ) - 
* `use_comment_confirmation` (default: ) - 
* `welcome_msg` (default: ) - 
* `words_in_excerpt` (default: ) - 

# License

This plugin is licensed under the same terms as Perl itself.