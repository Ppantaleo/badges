# badges
OJS/OPS plugin for displaying altmetric badges

Allows managers to select which altmetrics badges display in the submission pages. There are 3 badges implemented:
* Dimensions.ai
* Altmetric.com
* PlumX (Plum Analytics)

Important note: submissions must have a DOI assigned (and registered) to have a badge displayed.

## Compatibility

Works on both OJS and OPS 3.5. The plugin picks the right hook and template
variable for whichever application it is installed in, so the same code runs on
an article landing page and on a preprint landing page.

## Settings

From the plugin settings modal a manager can choose:

* which of the three badges to display;
* whether to hide each badge when it has no mentions;
* the Dimensions and Altmetric badge styles;
* the position of the badge block: sidebar or main column.

The two positions map to the hooks each application exposes on its landing page
(`Templates::Article::Details` / `Templates::Article::Main` in OJS,
`Templates::Preprint::Details` / `Templates::Preprint::Main` in OPS). Where each
one actually renders is decided by the active theme, so a theme that places both
hooks in the same column will show both options in that column. The default
position is the sidebar.

## Notes

* The badges are rendered by the providers' own scripts, which load
  asynchronously. The block stays hidden until at least one badge has actually
  drawn something, so a submission no provider has data for shows nothing at all
  rather than an empty heading.
* Altmetric only draws a badge for DOIs present in its database. A DOI that has
  just been assigned, or one from a server Altmetric does not index, will not
  produce a badge even with "hide when empty" turned off. This is expected and
  is not specific to this plugin.

## Credits

This is a fork. The original plugin is a development from Portal de Revistas
(https://revistas.unlp.edu.ar), part of PREBI-SEDICI (http://prebi.unlp.edu.ar ;
http://sedici.unlp.edu.ar), Universidad Nacional de La Plata, Argentina
(https://www.unlp.edu.ar), and is available at https://github.com/sedici/badges

The journals running the plugin in production do so with the original version,
not with the changes in this fork.
