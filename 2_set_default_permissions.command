cd $HOME
{ sudo chflags -R nouchg,nouappnd ~ $TMPDIR.. ; \
sudo chown -R $UID:staff ~ $_ ; \
sudo chmod -R -N ~ $_ ; \
sudo chmod -R 700 ~ $_ ; \
sudo chmod 755 ~ Public ; \
sudo chmod 733 Public/Drop\ Box ; \
} 2> /dev/null
