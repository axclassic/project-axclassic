## SirensBane travels from oot to oot to freporte and back
## Angelox
## Qadar

sub EVENT_DEATH {
no warnings 'all' ;
  if(($sirens > 14.5) and ($sirens < 39)){
    quest::delglobal("sirens");
    quest::setglobal("sirens",39,7,"F");
    $sirens = undef;
  }
}

sub EVENT_WAYPOINT {
no warnings 'all' ;
## In Oot > FP ################################## In Oot > FP #################

if (($sirens==14.5) && ($sirens >= 14) && ($sirens <=38)){
 #if($debugpl){quest::shout("telling 69151 to depop");}
 quest::signal(69151);
 #if($debugpl){quest::shout ("ZONEING in From Butcher setting 15");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",15,7,"F");
 $sirens=undef;}
elsif (($sirens==15) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",16,7,"F");
 $sirens=undef;}
elsif (($sirens==16) && ($sirens >= 14) && ($sirens <=38)){
 #if($debugpl){quest::shout ("Setting 17");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",17,7,"F");
 $sirens=undef;}
elsif (($sirens==17) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",18,7,"F");
 $sirens=undef;}
elsif (($sirens==18) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",19,7,"F");
 $sirens=undef;}
elsif (($sirens==19) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",20,7,"F");
 $sirens=undef;}
elsif (($sirens==20) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",21,7,"F");
 $sirens=undef;}
elsif (($sirens==21) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",22,7,"F");
 $sirens=undef;}
elsif (($sirens==22) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",23,7,"F");
 $sirens=undef;}
elsif (($sirens==23) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",24,7,"F");
 $sirens=undef;}
elsif (($sirens==24) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 #if($debugpl){ quest::shout ("SET 25)");}
 #if($debugpl){ quest::shout ("Near Pier)");}
 quest::setglobal("sirens",25,7,"F");
 $sirens=undef;}
elsif (($sirens==25) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",26,7,"F");
 $sirens=undef;}
elsif (($sirens==26) && ($sirens >= 14) && ($sirens <=38)){
 #if($debugpl){ quest::shout ("Setting 27");}
 quest::delglobal("sirens");
 quest::setglobal("sirens",27,7,"F");
 $sirens=undef;}
elsif (($sirens==27) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",28,7,"F");
 $sirens=undef;}
elsif (($sirens==28) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",29,7,"F");
 $sirens=undef;}
elsif (($sirens==29) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",30,7,"F");
 $sirens=undef;}
elsif (($sirens==30) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",31,7,"F");
 $sirens=undef;}
elsif (($sirens==31) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",32,7,"F");
 $sirens=undef;}
elsif (($sirens==32) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",33,7,"F");
 $sirens=undef;}
elsif (($sirens==33) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",34,7,"F");
 #if($debugpl){ quest::shout ("SET 34)");}
 $sirens=undef;}
elsif (($sirens==34) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 #if($debugpl){ quest::shout ("SET 35)");}
 quest::setglobal("sirens",35,7,"F");
 $sirens=undef;}
elsif (($sirens==35) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",36,7,"F");
 $sirens=undef;
 #if($debugpl){ quest::shout (" 36)");}
}
elsif (($sirens==36) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 #if($debugpl){ quest::shout ("SET 37)");}
 quest::setglobal("sirens",37,7,"F");
 $sirens=undef;}
elsif (($sirens==37) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",38,7,"F");
 #if($debugpl){ quest::shout ("Near ZoneLine!)");}
 $sirens=undef;}
elsif (($sirens==38) && ($sirens >= 14) && ($sirens <=38)){
 quest::delglobal("sirens");
 quest::setglobal("sirens",39,7,"F");
 $sirens=undef;}
}
