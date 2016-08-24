# This relies on the ssh client to be permanently redirected to port 7822
# as required by top8
# To achieve this:
# cat .ssh/config 
# Host top8.biz
#    Port 7822
# TODO rsync changes directory permissions, and it should be set back to +r and +x
rsync -a -v  --exclude .git --exclude  upload_rsync.sh --exclude *~  --exclude images ../TalmudIlluminated/ top8team@top8.biz:/home/top8team/public_html/talmudilluminated.com/

# If you want to do update images, uncomment the line below
#rsync -a -v  --exclude .git --exclude  upload_rsync.sh --exclude *~  ../TalmudIlluminated/ top8team@top8.biz:/home/top8team/public_html/talmudilluminated.com/

