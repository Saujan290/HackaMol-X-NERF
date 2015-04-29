use HackaMol::X::NERF;
use Modern::Perl;
use Data::Dumper;

my $nerf = HackaMol::X::NERF->new;

print 6*1000 . "\n\n";
foreach my $x (1 .. 1000){
  my ($x,$y,$z) = (rand(50), rand(50), rand(50));
  my $a = $nerf->ext($x,$y,$z);
  my $b = $nerf->ext_a  ($a, 1.2);
  my $c = $nerf->ext_ab ($a,$b, 1.2, 120.0);
  my $d = $nerf->ext_abc($a,$b,$c,1.2,120,0.0);
  my $e = $nerf->ext_abc($b,$c,$d,1.2,120,0.0);
  my $f = $nerf->ext_abc($c,$d,$e,1.2,120,0.0);
  unshift( @{$_},'C') foreach ($a,$b,$c,$d, $e,$f);
  printf ("%5s %10.3f %10.3f %10.3f\n", @$_) foreach ($a,$b,$c,$d, $e,$f);
}
