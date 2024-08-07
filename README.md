# REDDIT-GRAPH v2024.07.17.130528

This project aims to build a graph of subreddit links based on how they reference each other.

The database dumps in (csv format) can be found [HERE!](./csv).



## SUBREDDITS

### PROPERTIES

* `name (str)`: name of the subreddit.
    * between 2 and 21 characters (lowercase letters, digits and underscores).
* `type (str)`: type of the subreddit.
    * **public**: standard type, nothing special.
    * **banned**: banned by reddit admins, e.g. [/r/fatpeoplehate](https://reddit.com/r/fatpeoplehate).
    * **restricted**: has restrictions on who can post, e.g. [/r/reddit](https://reddit.com/r/reddit).
    * **private**: requires an invitation to join, e.g. [/r/ravenclaw](https://reddit.com/r/ravenclaw).
    * **archived**: archived by its owners, e.g. [/r/thebutton](https://reddit.com/r/thebutton).
    * **premium**: requires [reddit premium](https://reddit.com/premium) to join, e.g. [/r/lounge](https://reddit.com/r/lounge).
    * **user**: personal subreddit of a user, e.g. [/r/u_fedecalendino](https://reddit.com/r/u_fedecalendino).
    * **employees**: only for reddit employees, e.g. [/r/product](https://reddit.com/r/product).
* `title (str)`: title of the subreddit
* `description (str)`: short description of the subreddit.
* `subscribers (int?)`: amount of subscribers at the moment.
* `nsfw (bool?)`: indicator if its flaged as **n**ot **s**afe **f**or **w**ork 🔞.
* `quarantined (bool?)`: indicator if it has been quarantined 😷.
* `color (str)`: key color of the subreddit.
* `img_banner (str?)`: url of the image used as the banner.
* `img_icon (str?)`: url of the image used as the icon (snoo).
* `created_at (datetime)`: utc timestamp of when the subreddit was created.
* `updated_at (datetime)`: utc timestamp of when the information of the subreddit was last updated.

> **note**: the '?' indicates that the value can be null under certain conditions.


### STATS

TYPE | AMOUNT
--- | ---
**TOTAL** | 151664
**public** | 67383
**banned** | 42234
**restricted** | 21402
**public** [nsfw] | 9849
**private** | 8396
**restricted** [nsfw] | 2304
**restricted** [quarantined] | 24
**archived** | 20
**public** [quarantined] | 19
**premium** | 8
**public** [nsfw] [quarantined] | 8
**user** [nsfw] | 7
**user** | 5
**employees** | 2
**restricted** [nsfw] [quarantined] | 1
**error** | 1
**archived** | 1



## LINKS

### PROPERTIES

* `source (str)`: **name** of the subreddit where the link was found.
* `target (str)`: **name** of the linked subreddit.
* `type (str)`: place where the reference from source to target was found.
    * **description**: the reference was found in the description (see subreddit.description).
        * e.g.: [/r/hbo -> /r/hbomax](https://www.reddit.com/r/hbo/) (under "About Community").
    * **sidebar**: the reference was found in the sidebar (this include both sidebars from old and new reddit styles).
        * e.g.: [/r/hearthstone -> /r/bobstavern](https://www.reddit.com/r/hearthstone/) (under "Related Subreddits").
    * **topbar**: the reference was found in the links on the topbar.
        * e.g.: [/r/rocketleague > /r/rocketleagueesports](https://www.reddit.com/r/RocketLeague/) (under "Esports/Subreddit").
    * **wiki**: the reference was found in any of the pages of a subreddits's wiki
        * e.g.: [/r/zelda > /r/breath_of_the_wild](https://www.reddit.com/r/zelda/wiki/related_subreddits/) (under "For specific games").
* `updated_at (datetime)`: utc timestamp of when the information the link was last updated.

### STATS

TYPE | AMOUNT
--- | ---
**TOTAL** | 616116
**sidebar** | 343731
**wiki** | 254844
**topbar** | 10091
**description** | 7450


