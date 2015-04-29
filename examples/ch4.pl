use HackaMol::X::NERF;
use Modern::Perl;
use Data::Dumper;

my $nerf = HackaMol::X::NERF->new;

print 5*1000 . "\n\n";
foreach my $x (1 .. 1000){
  my ($x,$y,$z) = (rand(50), rand(50), rand(50));
  my $a = $nerf->ext($x,$y,$z);
  my $b = $nerf->ext_a  (         $a, 1.09             );
  my $c = $nerf->ext_ab (     $b, $a, 1.09, 109.5      );
  my $d = $nerf->ext_abc( $c, $b, $a, 1.09, 109.5, 120 );
  my $e = $nerf->ext_abc( $d, $b, $a, 1.09, 109.5, 120 );
  unshift( @{$a}, 'C');
  unshift( @{$_}, 'H') foreach ($b,$c,$d,$e);
  printf ("%5s %10.3f %10.3f %10.3f\n", @$_) foreach ($a,$b,$c,$d,$e);
}





