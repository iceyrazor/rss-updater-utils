# hi
this is just a personal project i made to generate and push to my static pages and rss feed at http://iceyfox.xyz and post to discord webhook

this isnt perfect and does require manual intervention. for instance. if you need to edit a post. you have to delete it from the rss feed aka the xml file. else you will have duplicates.

### this was built in mind with linux, not intended for windows

# how to download and use.
well its all shell. except for converting from md to html. witch you need hoedown. https://github.com/hoedown/hoedown

- download hoedown
- extract and compile it. should just be make.
- download this repo
- put hoedown in this repo ./
- make a directoy in this repo. static
- make a file called static-style.css in static/
- make a folder inside static for your 'posting' page.
- copy config.def.txt as config.txt and config it.
- prime folder is if on your webserver you want everything in a sub-directory. leave as is if you dont want it. must have trailing /!
- make post the same name as your 'posting' page
- copy index.xml and index.html to static/'posting' or static/primefolder/posting.
- in gen\_index\_list.sh edit the head -n 6 to get the top half of your index.html page. and make the one below your number +1
- optional
    - make a file discord\_api.txt and put a webhook api in there if you want to

and that shoooould be everything

# running
for this ill use test.md as a example

- only run this while in the same directory as this repo. i havent edited this to run outside it, for now.
- to run you can run rss\_pull.sh if you have files from a website that allready has a simmular setup //will use the config for url to pull from
- run ``gen_index_list.sh ./test.md`` and check static/post/index.html
- run ``gen_xml.sh ./test.md`` and check static/post/index.xml
- run ``gen_html.sh ./test.md`` and check static/post/list/filename/index.html
- if you have a discord webhook and thats config'd run ``push_discord_webhook.sh ./test.md`` and check your webhook channel
- run rss\_push.sh ./test.md or upload files to your webserver
- in rss\_push.sh if ./test.md or file isnt defined it wont add the posting file, instead it will just update the existing files.

# todo
- instead of defining posting page in config. make directory for each posting page then use directory name for post
- somthing i dont remember
- error checking. mainly input file checking.
