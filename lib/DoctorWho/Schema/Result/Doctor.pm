use utf8;
package DoctorWho::Schema::Result::Doctor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::Doctor

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<doctor>

=cut

__PACKAGE__->table("doctor");

=head1 ACCESSORS

=head2 doctor_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 start_date

  data_type: 'date'
  is_nullable: 1

=head2 end_date

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "doctor_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "start_date",
  { data_type => "date", is_nullable => 1 },
  "end_date",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</doctor_id>

=back

=cut

__PACKAGE__->set_primary_key("doctor_id");

=head1 RELATIONS

=head2 doctor_actors

Type: has_many

Related object: L<DoctorWho::Schema::Result::DoctorActor>

=cut

__PACKAGE__->has_many(
  "doctor_actors",
  "DoctorWho::Schema::Result::DoctorActor",
  { "foreign.doctor_id" => "self.doctor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 seasons

Type: has_many

Related object: L<DoctorWho::Schema::Result::Season>

=cut

__PACKAGE__->has_many(
  "seasons",
  "DoctorWho::Schema::Result::Season",
  { "foreign.main_doctor_id" => "self.doctor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stories

Type: has_many

Related object: L<DoctorWho::Schema::Result::Story>

=cut

__PACKAGE__->has_many(
  "stories",
  "DoctorWho::Schema::Result::Story",
  { "foreign.main_doctor_id" => "self.doctor_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2CYyUq7/d+hB8CjWf0HSOg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
