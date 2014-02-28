#!/usr/bin/perl
open(MYFILE,"./axclassic.sql") || die "Couldn't open the file!\n";
@Lines=<MYFILE>;
close MYFILE;
for(@Lines){
s/TYPE=MyISAM/ENGINE=MyISAM/;
s/TYPE=InnoDB/ENGINE=InnoDB/;
#s/\(oldtext\)/\(newtext\)/;
print $_;
}