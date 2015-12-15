package ONVIF::Media::Types::AnalyticsEngineInput;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://www.onvif.org/ver10/schema' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(ONVIF::Media::Types::ConfigurationEntity);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %Name_of :ATTR(:get<Name>);
my %UseCount_of :ATTR(:get<UseCount>);
my %SourceIdentification_of :ATTR(:get<SourceIdentification>);
my %VideoInput_of :ATTR(:get<VideoInput>);
my %MetadataInput_of :ATTR(:get<MetadataInput>);

__PACKAGE__->_factory(
    [ qw(        Name
        UseCount
        SourceIdentification
        VideoInput
        MetadataInput

    ) ],
    {
        'Name' => \%Name_of,
        'UseCount' => \%UseCount_of,
        'SourceIdentification' => \%SourceIdentification_of,
        'VideoInput' => \%VideoInput_of,
        'MetadataInput' => \%MetadataInput_of,
    },
    {
        'Name' => 'ONVIF::Media::Types::Name',
        'UseCount' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
        'SourceIdentification' => 'ONVIF::Media::Types::SourceIdentification',
        'VideoInput' => 'ONVIF::Media::Types::VideoEncoderConfiguration',
        'MetadataInput' => 'ONVIF::Media::Types::MetadataInput',
    },
    {

        'Name' => 'Name',
        'UseCount' => 'UseCount',
        'SourceIdentification' => 'SourceIdentification',
        'VideoInput' => 'VideoInput',
        'MetadataInput' => 'MetadataInput',
    }
);

} # end BLOCK








1;


=pod

=head1 NAME

ONVIF::Media::Types::AnalyticsEngineInput

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
AnalyticsEngineInput from the namespace http://www.onvif.org/ver10/schema.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * SourceIdentification


=item * VideoInput


=item * MetadataInput




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # ONVIF::Media::Types::AnalyticsEngineInput
   SourceIdentification =>  { # ONVIF::Media::Types::SourceIdentification
     Name =>  $some_value, # string
     Token => $some_value, # ReferenceToken
     Extension =>  { # ONVIF::Media::Types::SourceIdentificationExtension
     },
   },
   VideoInput =>  { # ONVIF::Media::Types::VideoEncoderConfiguration
     Encoding => $some_value, # VideoEncoding
     Resolution =>  { # ONVIF::Media::Types::VideoResolution
       Width =>  $some_value, # int
       Height =>  $some_value, # int
     },
     Quality =>  $some_value, # float
     RateControl =>  { # ONVIF::Media::Types::VideoRateControl
       FrameRateLimit =>  $some_value, # int
       EncodingInterval =>  $some_value, # int
       BitrateLimit =>  $some_value, # int
     },
     MPEG4 =>  { # ONVIF::Media::Types::Mpeg4Configuration
       GovLength =>  $some_value, # int
       Mpeg4Profile => $some_value, # Mpeg4Profile
     },
     H264 =>  { # ONVIF::Media::Types::H264Configuration
       GovLength =>  $some_value, # int
       H264Profile => $some_value, # H264Profile
     },
     Multicast =>  { # ONVIF::Media::Types::MulticastConfiguration
       Address =>  { # ONVIF::Media::Types::IPAddress
         Type => $some_value, # IPType
         IPv4Address => $some_value, # IPv4Address
         IPv6Address => $some_value, # IPv6Address
       },
       Port =>  $some_value, # int
       TTL =>  $some_value, # int
       AutoStart =>  $some_value, # boolean
     },
     SessionTimeout =>  $some_value, # duration
   },
   MetadataInput =>  { # ONVIF::Media::Types::MetadataInput
     MetadataConfig =>  { # ONVIF::Media::Types::Config
       Parameters =>  { # ONVIF::Media::Types::ItemList
         SimpleItem => ,
         ElementItem =>  {
         },
         Extension =>  { # ONVIF::Media::Types::ItemListExtension
         },
       },
     },
     Extension =>  { # ONVIF::Media::Types::MetadataInputExtension
     },
   },
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut
