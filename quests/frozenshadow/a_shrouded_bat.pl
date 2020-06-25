# a_shrouded_bat
# Killing these on 6th floor spawns either a female or male version of enraged_vampire

sub EVENT_DEATH {
    my $vampall = int(rand(100));
    if($vampall <= 49) {
        quest::spawn2(111174, 0, 0, $x, $y, $z, 0); #spawns female 
    }
    else {
        quest::spawn2(111173, 0, 0, $x, $y, $z, 0); #spawns male
    }
}
