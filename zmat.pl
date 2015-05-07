use Modern::Perl;
use HackaMol::X::NERF;
use Math::Vector::Real;
use YAML::XS;
use Scalar::Util qw(looks_like_number);

my @zmat = <DATA>;
chomp @zmat;
my @vars = grep {  /\w+\s+\d+\.*\d+$/ } @zmat;
my @atms = grep { !/\w+\s+\d+\.*\d+$/ } @zmat;

my %mol;

foreach my $iatom (0 .. $#atms){
  # check if it's cartesian
  my ($sym, $iat1, $dist, $iat2, $ang, $iat3, $tors) = split (/ /, $atms[$iatom]);
  if ( defined($iat1) ){
    if ( looks_like_number($iat1)){ 
      if ( $iat1 == 0 ){
        $mol{atoms}[$iatom] = {
                              symbol  =>  $sym , 
                              coords => [ V($dist, $iat2, $ang) ]
                            };
        print Dump \%mol;
      }
    }
  } 
  
} 

print Dump \@vars;

sub parse_line {
  my $line = shift;
  my ($sym, $iat1, $dist, $iat2, $ang, $iat3, $tors) = split (/ /, $line);
  
}

__DATA__
C
C 1 R1
C  2 R1 1 A1
C 3 R1 2 A1 3 D1
C 4 R1 3 A1 2 D1
C 0 1 1 1
R1 1.5
A1 109
D1 180.0
